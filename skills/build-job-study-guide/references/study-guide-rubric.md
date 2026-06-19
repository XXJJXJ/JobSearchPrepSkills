# Study Guide Rubric

Use this rubric to turn a job analysis into a useful study document.

## Study Target Extraction

Derive study targets from:

- Required qualifications: convert into must-learn topics.
- Preferred qualifications: convert into differentiators.
- Responsibilities: convert into role scenarios and hands-on practice tasks.
- Knowledge and skills map: convert into modules and checkpoints.
- Seniority and scope: adjust depth, autonomy, and scenario complexity.
- Candidate gaps: prioritize weak areas and add prerequisite material.

Use priorities:

- P0: Required for screening or core role execution.
- P1: Important for interviews and early job performance.
- P2: Differentiator or later-depth topic.

## Free Resource Selection

Prioritize free and accessible material from links the user provides. If user-provided links are missing, inaccessible, or incomplete, supplement with current free resources found through live search.

Prefer:

- Official product or platform documentation.
- Free vendor learning paths or labs.
- University courses, open courseware, public lectures, or public textbooks.
- Reputable nonprofit learning sites.
- Maintained open-source project docs and tutorials.
- Standards bodies, government, or regulatory sources for compliance-heavy roles.
- Public videos only when the creator/provider is credible and the content is current enough.

Avoid:

- Paywalled courses or books unless the user explicitly allows paid options.
- Sites where most useful content is locked behind a subscription.
- Content farms, thin SEO pages, unverified blogs, and AI-generated article farms.
- Outdated tutorials for fast-moving tools unless historical context is useful.
- Resource lists without enough substance to teach the topic.

Label access:

- Free: usable without payment.
- Free account: free but requires sign-up.
- Partly free: useful free sections exist, but some material is paid.
- Unverified: do not use as a primary recommendation.

## Document Structure

Use this structure by default for both Markdown and DOCX output. In DOCX, use real document headings, tables, and lists rather than pasting raw Markdown syntax.

The 9-section study-content structure complements the broader job-study guide. Do not replace the role preparation, resources, study path, practice tasks, checklist, or next steps with only the 9-section content block.

## Output Format Rules

- If the user requests Markdown, `.md`, plain text, or an in-chat guide, produce Markdown.
- If the user requests Word, `.docx`, an editable document, or a downloadable study document, produce DOCX.
- If the user gives no format preference, default to Markdown.
- If the user asks for PDF, slides, spreadsheet, HTML, or another format, ask whether Markdown or DOCX is acceptable unless the broader task explicitly requires conversion.
- Keep content equivalent across Markdown and DOCX: role preparation, study map, resources, study path, 9-section study content modules, practice tasks, checklist, and next steps.

## Markdown Template

```markdown
# Study Guide: [Topic / Job Role / Subject]

## 1. Preparation Focus
- Target role/topic:
- Source job analysis or source links:
- Highest-priority skills or concepts:
- Suggested timeline:

## 2. Skills-To-Study Map
| Priority | Job requirement or source topic | Study topic | Outcome |
|---|---|---|---|

## 3. Curated Free Resources
| Topic | Resource | Provider | Access | Why use it |
|---|---|---|---|---|

## 4. Study Path
### Module 1: [Topic]
- Why it matters:
- Learn:
- Practice:
- Checkpoint:

## 5. Study Content Modules
### Module: [Topic]

#### 5.1 Overview
[Summarize what this topic is about and why it is important.]

Sources: [Source title](URL)

#### 5.2 Key Concepts
##### [Concept]
- Explanation:
- Why it matters:
- Important terms or definitions:
- Simple example:
- Sources: [Source title](URL)

#### 5.3 Organized Study Notes
##### [Logical section]
- Notes:
- Examples:
- Sources: [Source title](URL)

#### 5.4 Must-Know Details
- [ ] [Important item to understand or memorize]

#### 5.5 Common Mistakes or Misunderstandings
| Mistake | Correct understanding | Why it matters |
|---|---|---|

#### 5.6 Practice Questions
##### Beginner
-
##### Intermediate
-
##### Advanced
-
##### Scenario-Based
-
##### Interview-Style
-

#### 5.7 Questions and Answers
Q:
A:

#### 5.8 Flashcards
Front:
Back:

#### 5.9 Final Revision Summary
[Concise summary to review before a test, interview, or practical use.]

## 6. Practice Tasks
| Task | Role scenario or practical use | Deliverable |
|---|---|---|

## 7. Review Checklist
-

## 8. Next Steps
-
```

## Question And Answer Design

Include a mix of:

- Beginner questions: definitions, simple recall, and basic distinctions.
- Intermediate questions: explanation, comparison, and practical application.
- Advanced questions: tradeoffs, edge cases, synthesis, and deeper reasoning.
- Scenario-based questions: realistic problems based on role responsibilities or practical use.
- Interview-style questions when relevant: concise but thoughtful answers that show communication and judgment.

Write answers that are useful for studying:

- Give direct answers first.
- Add short reasoning or examples.
- Include common pitfalls when helpful.
- Tie answers back to job responsibilities or interview expectations.
- Format every answer as `Q:` and `A:`.

## Study Notes And Cheat Sheets

Read `study-content-library.md` when the output should include actual study content. Use it as reusable starter material, then adapt it to the job analysis and the free resources found during live search.

Include:

- The broader job-study guide scaffold: preparation focus, study map, free resources, study path, practice tasks, review checklist, and next steps.
- For each major topic, a 9-section study content module with overview, key concepts, organized study notes, must-know details, common mistakes, practice questions, Q&A, flashcards, and final revision summary.
- Cheat sheet material inside organized study notes or must-know details when useful.
- Interview question sets with model answers.
- Role-specific examples, not only generic definitions.

Do not copy the content library blindly. Remove irrelevant sections and rewrite examples so they match the target role.

## Source Synthesis Rules

- Prioritize free and accessible material from links the user provides.
- If any link cannot be accessed, mention it and continue using remaining accessible links.
- Remove duplicate information across sources.
- If sources explain the same concept differently, combine them into one clear explanation.
- Highlight the most important topics first.
- Make the document beginner-friendly but detailed enough for serious study.
- Include source references by linking each major section back to relevant URLs.
- Avoid copying large chunks directly from sources; paraphrase clearly.

## Study Plan Rules

- Put prerequisites before advanced topics.
- Keep modules small enough to complete in one study session.
- Prefer active practice over passive reading.
- Include at least one concrete deliverable for portfolio-relevant roles.
- Make timelines realistic; avoid cramming too many tools into a short plan.
- For senior roles, emphasize judgment, system design, tradeoffs, stakeholder communication, and leadership scenarios.

## Citation Rules

- Cite URLs for all external learning resources.
- Include provider names so the learner can judge credibility.
- Use current web search for resource freshness.
- Do not copy long passages from resources.
- Summarize what each resource covers and how to use it.
- Link each major generated section to the relevant source URLs.
