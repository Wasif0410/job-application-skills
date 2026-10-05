#!/usr/bin/perl
# Measure how full a one-page LaTeX resume is.
# Usage: perl measure_fill.pl path/to/resume.tex [path/to/pdflatex]
# Prints: pages, used height, page goal, free space in pt and in body lines.
# Works on a temporary copy; the original .tex is never modified.
use strict;
use warnings;
use File::Basename qw(dirname basename);
use File::Copy qw(copy);
use Cwd qw(abs_path);

my $tex = shift or die "usage: perl measure_fill.pl resume.tex [pdflatex]\n";
my $pdflatex = shift
  || ($ENV{LOCALAPPDATA} ? "$ENV{LOCALAPPDATA}/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe" : "pdflatex");
$tex = abs_path($tex);
my $dir = dirname($tex);
my $tmp = "$dir/_measure_fill.tex";

open my $in, '<', $tex or die "cannot read $tex: $!\n";
local $/;
my $src = <$in>;
close $in;

my $probe = '\\par\\typeout{PAGEFILL used=\\the\\pagetotal\\space goal=\\the\\pagegoal\\space line=\\the\\baselineskip\\space page=\\thepage}';
my $n = ($src =~ s/\\end\{document\}/$probe\n\\end{document}/);
die "could not find \\end{document} in $tex\n" unless $n;

open my $out, '>', $tmp or die "cannot write $tmp: $!\n";
print $out $src;
close $out;

chdir $dir;
my $log = `"$pdflatex" -interaction=nonstopmode _measure_fill.tex 2>&1`;
my ($pages) = $log =~ /Output written on .*?\((\d+) page/;
my ($used, $goal, $line, $page) = $log =~ /PAGEFILL used=([\d.]+)pt goal=([\d.]+)pt line=([\d.]+)pt page=(\d+)/;
unlink glob("$dir/_measure_fill.*");

die "measurement failed (no PAGEFILL line in the log)\n" unless defined $used;
$pages //= '?';
if ($pages ne '1' || $page ne '1') {
  printf "OVERFLOW: %s pages. Remove content until it fits on one page.\n", $pages;
  exit 1;
}
my $free = $goal - $used;
# Bullets are \small (~0.9x the body baseline), so report lines at both sizes.
printf "pages=1 used=%.1fpt goal=%.1fpt free=%.1fpt (~%.1f body lines, ~%.1f bullet lines)\n",
  $used, $goal, $free, $free / $line, $free / ($line * 0.9);
if ($free < 0) {
  printf "FULL: content is %.1fpt taller than the page and LaTeX is shrinking the spacing to keep one page. Don't add more.\n", -$free;
} elsif ($free < $line * 0.9) {
  print "FULL: less than one bullet line left.\n";
} else {
  printf "ROOM: about %.1f bullet lines free. Add true, relevant content.\n", $free / ($line * 0.9);
}
