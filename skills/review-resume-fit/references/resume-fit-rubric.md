# Resume Fit Rubric

Use this rubric to produce an expert resume review, career-coaching analysis, and interview-prep-oriented improvement plan.

## Input Requirements

Required:

- Resume text or resume file content.
- Job description, job posting, or job URL.

Optional:

- User's target seniority, career goal, industry preference, location, constraints, known weak areas, portfolio links, or project context.

If the job posting is a URL, fetch or browse it when possible because postings change. If inaccessible, ask for pasted text.

## Output Template

```markdown
# Resume Fit Analysis for [Job Role]

## 1. Overall Match Score
Score: [1-10]/10

Explain the score using:
- Relevant experience:
- Required technical skills:
- Required soft skills:
- Project relevance:
- Seniority level:
- Keywords and ATS alignment:
- Evidence of impact and achievements:

## 2. Job Requirements Breakdown
| Category | Requirements | Evidence from job description |
|---|---|---|
| Must-have skills | | |
| Nice-to-have skills | | |
| Responsibilities | | |
| Domain knowledge | | |
| Soft skills and working style | | |

## 3. Resume Strengths
- Strong experience:
- Relevant projects:
- Technical skills:
- Achievements:
- Keywords already present:

## 4. Resume Gaps
| Gap | Why it matters | Job evidence | Severity | Type |
|---|---|---|---|---|

Use `Type` values:
- Resume wording issue
- Evidence gap
- Real skill gap
- Seniority/scope gap
- Unclear from provided resume

## 5. ATS and Keyword Optimization
### Technical keywords
-
### Tools and frameworks
-
### Methodologies
-
### Soft skills
-
### Domain-specific keywords
-

Suggested natural placements:
| Keyword | Where to add it | How to add without stuffing |
|---|---|---|

## 6. Section-by-Section Resume Feedback
### Summary / Profile
- What works well:
- What should be improved:
- Specific rewrite suggestions:

### Work Experience
- What works well:
- What should be improved:
- Specific rewrite suggestions:

### Projects
- What works well:
- What should be improved:
- Specific rewrite suggestions:

### Skills
- What works well:
- What should be improved:
- Specific rewrite suggestions:

### Education
- What works well:
- What should be improved:
- Specific rewrite suggestions:

### Certifications
- What works well:
- What should be improved:
- Specific rewrite suggestions:

### Other Sections
- What works well:
- What should be improved:
- Specific rewrite suggestions:

## 7. Bullet Point Improvements
Original:
[Original bullet point]

Improved:
[Improved bullet point]

Why this is better:
[Explanation]

Missing metric to look for:
[Metric type, not invented number]

## 8. Suggested Resume Version
[Provide improved resume content tailored to this job.]

Use bracketed prompts when facts are missing:
- [Add metric here if available]
- [Add project detail here]
- [Add specific technology used here]

## 9. Skill Gap Analysis
### High Priority Skills
| Skill | Why it matters | Needed level | Resume demonstration | Small proof project/task |
|---|---|---|---|---|

### Medium Priority Skills
| Skill | Why it matters | Needed level | Resume demonstration | Small proof project/task |
|---|---|---|---|---|

### Low Priority Skills
| Skill | Why it matters | Needed level | Resume demonstration | Small proof project/task |
|---|---|---|---|---|

Suggested study support:
- Offer `$build-job-study-guide` for selected skills or knowledge areas when useful.
```

## Match Score Guidance

Score honestly:

- 9-10: Very strong fit; resume clearly shows most must-haves, seniority, impact, and relevant keywords.
- 7-8: Good fit; several strong signals, but some gaps or weak evidence need fixing.
- 5-6: Partial fit; credible foundation, but important requirements are missing or under-evidenced.
- 3-4: Weak fit; major requirements, seniority, or domain evidence are missing.
- 1-2: Poor fit; resume does not support the role yet.

Explain the score with evidence. Do not soften a low score if the resume is not suitable yet.
If the resume is not suitable for the role yet, clearly state what the user should improve before applying.

## Gap Severity

Use:

- High: likely screening blocker or major interview concern.
- Medium: hurts competitiveness but may be addressable with wording, portfolio evidence, or study.
- Low: nice-to-have, minor clarity issue, or low-impact keyword gap.

For each gap, state whether it is:

- Wording issue: the experience may exist, but the resume does not express it clearly.
- Evidence gap: the resume claims a skill but lacks proof, context, or impact.
- Real skill gap: the provided resume/context does not show the skill.
- Seniority/scope gap: the role expects broader ownership than the resume shows.

## Bullet Rewrite Rules

Prefer this structure:

```text
[Action verb] + [technical skill/method/tool] + [what was built, improved, analyzed, led, or delivered] + [business/user/team impact] + [measurable result if provided]
```

Examples of metric types to request:

- Scale: users, customers, records, requests, projects, regions, stakeholders.
- Impact: time saved, cost reduced, revenue influenced, quality improved, incidents reduced.
- Delivery: deadlines met, cycle time reduced, automation created, process steps removed.
- Reliability: defects reduced, uptime improved, audit issues resolved, error rate lowered.

Do not invent numbers. Use placeholders such as `[Add percentage if known]` or `[Add user/customer count if available]`.

## Suggested Resume Version Rules

- Reframe and reorganize only what the user provided.
- Keep technologies, employers, dates, credentials, and project claims truthful.
- If a stronger claim would require missing data, add a bracketed prompt rather than writing it as fact.
- Prefer concise, achievement-oriented bullets over long responsibility lists.
- Align section order to the target role: relevant projects and skills may move higher when they are stronger than work history.

## ATS Keyword Rules

- Extract keywords from the job description, not generic keyword lists.
- Separate technical keywords, tools/frameworks, methodologies, soft skills, and domain-specific keywords.
- Suggest natural placements in summary, skills, project titles, work bullets, or certifications.
- Avoid keyword stuffing; keywords should be supported by real experience or bracketed as things to add only if true.

## Interview Preparation Angle

When useful, add interview notes:

- Likely questions created by resume gaps.
- Strong stories the user should prepare.
- Projects or examples that can support missing requirements.
- Honest ways to discuss learning-in-progress skills without overstating mastery.

## Safety And Integrity

- Be specific, not flattering.
- Do not present uncertainty as fact.
- Do not infer protected characteristics.
- Do not provide legal immigration advice.
- Do not encourage misrepresentation.
