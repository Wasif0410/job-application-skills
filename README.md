# Job Application Skills for Claude Code

Paste a job posting, type `/apply`, and get a complete application package:

- a **tailored one-page resume** (Jake's LaTeX template, ATS-friendly)
- a **cover letter** in your own voice
- **copy-paste answers** for the application form
- a **zip** ready to upload
- a row in your **application tracker**

Everything is grounded in your real resume. Nothing about you is stored in the skills: your details live in your own local folder.

---

## What's inside

| Skill | Command | What it does |
|---|---|---|
| **apply** | `/apply` | Runs the two skills below on one posting, cross-checks them, writes the form answers, zips the package and logs it in your tracker |
| **resume-tailor** | `/resume-tailor` | Builds a one-page resume tailored to the posting, plus a keyword report |
| **cover-letter** | `/cover-letter` | Writes a one-page cover letter that matches your resume |
| **humanizer** | (used automatically) | Removes signs of AI-generated writing from the letter |

## How a run works

```
You: /apply + paste a job posting
 │
 ├─ 1. Read the posting: term, location, visa, required documents
 ├─ 2. Research the company ONLY if the posting is thin (detailed postings need none)
 ├─ 3. /resume-tailor → one-page resume built from YOUR original resume
 ├─ 4. /cover-letter  → one-page letter in YOUR style, consistent with that resume
 ├─ 5. Cross-check: numbers, titles, dates and availability agree everywhere
 ├─ 6. application-kit.md: copy-paste form answers + short answers
 ├─ 7. Zip: resume + cover letter + kit
 └─ 8. Tracker row + checkpoint update
 │
You get: both PDFs, a keyword table, and a short "check before you submit" list
```

## Install

**macOS / Linux / Git Bash:**
```bash
git clone https://github.com/Wasif0410/job-application-skills.git
mkdir -p ~/.claude/skills
cp -r job-application-skills/skills/* ~/.claude/skills/
```

**Windows (PowerShell):**
```powershell
git clone https://github.com/Wasif0410/job-application-skills.git
New-Item -ItemType Directory -Force "$HOME\.claude\skills" | Out-Null
Copy-Item -Recurse -Force job-application-skills\skills\* "$HOME\.claude\skills\"
```

Then start a new Claude Code session so it picks up the skills.

## Requirements

| Tool | Used for | Windows | macOS | Linux |
|---|---|---|---|---|
| `pdflatex` | building the PDFs | [MiKTeX](https://miktex.org/) (`winget install MiKTeX.MiKTeX`) | `brew install --cask basictex` | `sudo apt install texlive-latex-extra` |
| `pdftotext`, `pdftoppm` | checking text, rendering pages | included with MiKTeX | `brew install poppler` | `sudo apt install poppler-utils` |
| `perl` | the page-fill check | Git for Windows (Git Bash) | built in | built in |
| `zip` | packaging | included with MiKTeX | built in | `sudo apt install zip` |

You don't have to check these yourself. On the first run the skills check, tell you what's missing, and offer the install command (they never install anything without your OK).

**Optional:** a `structural-humanizer` skill, if you have one installed, runs as a second de-AI pass on the cover letter. Without it, the cover-letter skill uses its own read-aloud check.

## First run

1. Make a folder for your job search, put your resume(s) in it, and open Claude Code in that folder.
2. Type `/apply` and paste a job posting.
3. The skill shows you the folder layout and asks **"Should I set this up and create your profiles?"** Say yes.
4. It pre-fills your profile from your resume and asks you the rest in **one** message: file prefix, city, work authorization, which job titles may be adjusted, your projects, and how you like your cover letters.
5. It builds your first package. After that, every run goes straight through with no questions.

### Your workspace

```
my-job-search/
├── checkpoint.md          overview: status counts, log, open items
├── resumes/               your ORIGINAL resumes (the ground truth for everything)
├── personal-info/
│   ├── tailor-profile.md        your identity, contact line, title rules, facts, resume preferences
│   ├── cover-letter-profile.md  your letter header, sign-off, structure, voice
│   └── cover-letter-examples.md (optional) letters you've approved
├── job-tracker/
│   └── applications.csv   every posting + status (prepared → applied → oa → interviewing → offer/rejected)
└── tailored/
    └── Company_Role_Term/ jd.md, resume.tex, <You>_Resume.pdf, <You>_CoverLetter.pdf,
                           report.md, application-kit.md, <You>_Company_Role_Application.zip
```

## Everyday use

| You say | What happens |
|---|---|
| `/apply` + a posting | the full package |
| `/resume-tailor` + a posting | just the resume |
| `/cover-letter` + a posting | just the cover letter |
| "I applied to Shopify today" | tracker + checkpoint updated |
| "Shopify sent me an OA" / "rejected" | status updated |
| "No bold in my letters" / "always mention I'm bilingual" | saved to your profile for every future letter |

## What makes the output good

**Resume**
- Built only from your real experience: your original resumes, GitHub repos and confirmed facts. Never from a previous tailored version.
- Every posting keyword is extracted and ranked **Mandatory / Critical / Important / Nice-to-have / Soft**, then placed where it's most believable. You get a table showing what was used, where, and why.
- The Technical Skills section is rebuilt for each job. It contains **100% of the languages and tools named in the posting**, then your related skills, with irrelevant ones dropped and one line per category. The report shows `Skills coverage: X/X`.
- Bullets follow *what you built → for whom / at what scale → result*, with a metric in every job, past tense, and no AI-sounding words.
- The page is measured, not eyeballed: `scripts/measure_fill.pl` confirms it's exactly one page and full.

**Cover letter** (hard rules that no profile can override)
- Five paragraphs: company hook → your technical background → one project → your experience (the core) → a two-sentence goodbye.
- Paragraph 2 is your technical background: how it fits the company's engineering work, your languages and tools, any relevant coursework, and what you build in your current role. Stories and metrics are saved for paragraph 4.
- The goodbye is a fixed, natural pattern: "Thank you for your time and consideration. I'd welcome the chance to discuss how I could contribute to <Company>, and you can reach me at…". No graduation date or other facts glued on.
- No bold, no em dashes, no "I am writing to express", no invented stories or reasons.
- Each employer appears in at most two paragraphs.
- Every sentence is checked by reading it aloud: one idea per sentence, plain correct English.

**Honesty built in**
- Anything inferred or placed without direct evidence is flagged as **forced** in the report, with a note on how to talk about it in an interview.
- The cover letter never turns a forced resume keyword into a claim.

## Example keyword table (from the report)

| Keyword | Priority | JD source | Used? | Where | Basis |
|---|---|---|---|---|---|
| Python | Mandatory | "Strong Python foundations" | ✅ | Experience 1, Research 2 / CL P2 | explicit |
| LightGBM | Important | "Interest in … LightGBM" | ❌ | n/a | no basis; weekend-project suggestion |

`Coverage: Mandatory 6/6 · Critical 13/13 · Important 9/9 · Forced placements: 2`

## Privacy

The skills contain **rules and blank templates only**. Your name, contact details, experience, preferences and letters live in your own `personal-info/` folder. The skills never write your details into their own files.

## Customizing

- **How your letters look and sound:** edit `personal-info/cover-letter-profile.md` (header, sign-off, structure, how to introduce each employer, phrases to avoid, a story bank).
- **Your details and resume preferences:** edit `personal-info/tailor-profile.md`.
- Or just tell Claude, and it saves the change to the right file.

## Troubleshooting

| Problem | Fix |
|---|---|
| "pdflatex not found" | Install MiKTeX / BasicTeX / TeX Live (see Requirements), then restart the terminal |
| PDF spills onto two pages | Normal while tailoring; the skill trims and rechecks until it's one full page |
| Header lines glued together in the PDF | The `.tex` was written through a shell; the skill writes it with the Write tool to keep `\\` line breaks |
| It asks setup questions again | It couldn't find `personal-info/`. Open Claude Code in your job-search folder. |

## Credits

- Resume layout: [Jake's Resume](https://github.com/jakegut/resume) LaTeX template (MIT).
- `skills/humanizer`: based on [blader/humanizer](https://github.com/blader/humanizer) (MIT, © 2025 Siqi Chen; license in `skills/humanizer/LICENSE`), itself based on Wikipedia's "Signs of AI writing" guide.
- Cover-letter research: ResumeGo's cover letter field experiment (7,287 applications); Wingate et al. (2025), *International Journal of Selection and Assessment*; "Signaling in the Age of AI: Evidence from Cover Letters" (arXiv 2509.25054).

## License

MIT. See [LICENSE](LICENSE). `skills/humanizer` keeps its own MIT license.
