# Building the PDF

Jake's template needs **pdfLaTeX**. XeLaTeX and Tectonic fail on `\pdfgentounicode`, the line that keeps the PDF's text machine-readable for ATS.

## 1. Find a compiler

Check the PATH first (`pdflatex --version`), then these common install locations:
- **Windows (MiKTeX, per-user):** `%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64\pdflatex.exe`
- **Windows (MiKTeX, all users):** `C:\Program Files\MiKTeX\miktex\bin\x64\pdflatex.exe`
- **macOS:** `/Library/TeX/texbin/pdflatex`
- **Linux:** `/usr/bin/pdflatex`

## 2. Install one (ask the user first; it changes their system)

| OS | Command | Notes |
|---|---|---|
| Windows | `winget install --id MiKTeX.MiKTeX --scope user --silent --accept-package-agreements --accept-source-agreements` | If `winget` isn't on PATH, try `%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe`. Then turn on auto package install: `initexmf --set-config-value=[MPM]AutoInstall=1` (same bin folder). About 150 MB. |
| macOS | `brew install --cask basictex`, then `sudo tlmgr install titlesec enumitem marvosym fancyhdr preprint` | Needs `sudo`, so the user runs it. Full MacTeX also works. |
| Linux | `sudo apt install texlive-latex-extra texlive-fonts-recommended` | Needs `sudo`, so the user runs it. About 500 MB. |
| Any | Overleaf (overleaf.com → New Project → paste the `.tex`) | Nothing to install. You can't see the output, so ask the user to report the page count and any odd gaps. |

On Windows, if WSL Ubuntu exists, it rarely has TeX already, and installing it there needs the user's sudo password. MiKTeX is usually the smoother path.

## 3. Compile

Run from the posting's folder:
```
pdflatex -interaction=nonstopmode -halt-on-error resume.tex
```
- Success prints `Output written on resume.pdf (1 page, ...)`. The page count is right there, so check it every time.
- The first MiKTeX run may pause to download packages. Give it a few minutes.
- A harmless warning like `you have not checked for MiKTeX updates` can surface as a non-zero exit in PowerShell. Judge success by the "Output written" line.
- Rename or copy the output to `<FirstLast>_Resume_<Company>_<RoleTag>.pdf` (naming rules in SKILL.md §7), then delete `resume.aux`, `resume.log` and `resume.out`.
- If it fails, read the lines starting with `!` in `resume.log`. The usual causes are an unescaped `&`, `%`, `#` or `_`, or an unbalanced `\resumeItemListStart`/`\resumeItemListEnd`.

## 4. Look at the result

Open the PDF with a tool that renders pages (e.g. a Read tool that shows PDF pages as images) **and** extracts text. Then run the §6 checklist from SKILL.md. Both views matter: the image shows layout problems, and the text shows what an ATS will parse.

## Gotchas found the hard way

- **A bullet that fills its line exactly leaves a blank line under it.** The template's `\vspace{-2pt}` wraps onto a new line. Fix it by trimming a few characters from that bullet.
- **Rendered images understate how full the page is.** A page can look like it has 2 inches free while LaTeX has only 12pt left. To measure, run `perl ../scripts/measure_fill.pl <resume.tex>`. It inserts the probe in a temporary copy (so shell backslash mangling can't break it), compiles, and reports free space in points and bullet lines. A negative number means LaTeX is shrinking the spacing to fit, so the page is completely full.
- **Bold text is wider.** A bullet that fit on one line can wrap after you bold its keywords. Recheck after bolding.
- **Edit `.tex` files with an exact-string edit tool, not `sed` or regex in a shell.** Shell escaping mangles backslashes. In one run `\\resumeItemListEnd` came out as a carriage return plus "esumeItemListEnd" because `\r` was interpreted. A regex line-delete also removed a closing `\resumeItemListEnd` that shared the line, which broke the build.
- **Keep one LaTeX command per line in the source,** so line-based edits can't swallow a neighbour.
- **Stock Jake's `\resumeProjectHeading` leaves its right column at full size,** so "GitHub" looks oversized. The bundled template sets both columns to `\small`.
- **Unicode symbols** (→, ~, smart quotes from pasted text) may not render, or may extract badly. Use LaTeX equivalents.
