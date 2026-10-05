# Example letter and lessons (anonymized)

This is a fictional candidate and a fictional company. It shows the default five-paragraph shape and the corrections that shaped the rules. **The user's own approved letters, if they have any, live in their workspace as `cover-letter-examples.md`.** Read that file for their real voice. This file is only for the general shape.

## Lessons from real corrections (apply to everyone)
- **Keep the user's chosen paragraph order.** Don't silently swap in a structure you think is better; suggest it instead.
- **Introduce employers with the role.** "At Brightline, I…" reads random to a reader who's never heard of Brightline. Write "During my previous internship as a Data Engineering Intern at Brightline, I…".
- **Open plainly in first person.** "The project closest to your work is X" isn't first person, and "My closest project is X" sounds odd. Write "I built X, …".
- **Don't list every skill.** Only what the posting needs, each tied to where it was used.
- **Availability must match the posting, in the exact format.** Line 1 is "Start Availability: <Month> <Year>" (always with a year), and line 2 is only a length ("4 months"). "Start Availability: September" with "4-month work term, September to December" is wrong.
- **No bold in letters** (bold keywords belong on the resume only).
- **Don't name the same employer in every paragraph.** One letter mentioned the same internship in four of five paragraphs.
- **Never turn a forced resume keyword into a story.** "I used Copilot on those automations" was invented, and it contradicted the next sentence.
- **Read every sentence aloud.** "I know Ottawa from my internship and can be in the office three days a week" glues two unrelated facts together.
- **Never let the shell write the `.tex`.** It collapses `\\`, gluing the header lines together and the sign-off to the name.

## Example (fictional): Jordan Lee → Ledgerly, Data Engineering Co-op (Winter 2027, Toronto)
Shape: the hook uses a fact stated in the posting; skills are tied to evidence; the project paragraph shows a decision; the experience paragraph goes deep on one role and ends in curiosity about the users; the goodbye gives a local tie.

```
Dear Hiring Manager,

I'm applying for the Data Engineering co-op at Ledgerly in Toronto for the Winter 2027 term. Your posting says Ledgerly reconciles 40 million small-business transactions a month, and that every mismatch becomes a support ticket. I spent last summer building the checks that catch mismatches before anyone sees them, so that number caught my attention right away.

I work mostly in Python and SQL. At Brightline I built Airflow pipelines that loaded data into Snowflake. In my own projects I test every transformation with pytest before it touches real data, and I've used dbt to model data in two coursework projects.

I built Tally Check, an open-source tool that compares two CSV ledgers and explains each mismatch in plain language. It handles 2 million rows in under a minute by hashing rows into buckets before comparing them, which I chose over a full join after the first version ran out of memory. The README lists what it can't do yet, like currency conversion. That's the same reconciliation problem your team works on, at a much smaller scale.

During my previous internship as a Data Engineering Intern at Brightline, I owned the nightly pipeline that loaded 3 million payment records into Snowflake. I added row-count and checksum checks between each stage, which caught a duplicate-load bug in my second week before it reached the finance dashboards. I also wrote the runbook the team still uses when a load fails. In my current role as a teaching assistant for Databases, I help 120 students debug their SQL, which has made me good at explaining why a query is wrong. What I'd most want to learn at Ledgerly is how a bookkeeper decides whether a mismatch is a bug or just a timing difference.

Thank you for your time. I'm based in Toronto and available for the full term. You can reach me at jordan.lee@example.com or 555-0100.

Sincerely,
Jordan Lee
```

Why it works:
- **The hook** quotes a number from the posting itself (no research needed when the JD is detailed) and ties it to the candidate's own work.
- **The skills paragraph** is only the candidate's own skills, each tied to where it was used. It never mentions the posting or the company.
- **No bold, no em dashes.** The goodbye is two sentences: thanks plus one logistics fact, then contact details.
- **The project paragraph** shows a real decision (buckets instead of a full join, and why).
- **The experience paragraph** has one real story (the duplicate-load bug), one sentence on the other role, and ends with curiosity about the users.
- **The goodbye** is two lines with a real local tie.
