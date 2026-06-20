---
name: build-job-study-guide
description: Build self-contained job-preparation lessons from a job analysis, job description, or role requirements. Use when Codex needs to teach required and preferred skills from beginner through advanced level, create realistic practice and assessment preparation, or produce Markdown or DOCX study materials that do not require learners to follow external links for essential content.
---

# Build Job Study Guide

Create a content-first job preparation curriculum. Teach the material in the guide; use external sources to verify freshness and provide optional further practice, not as a substitute for explanation.

Read [study-guide-rubric.md](references/study-guide-rubric.md) for every guide. Read [study-content-library.md](references/study-content-library.md) when writing lesson explanations, examples, exercises, assessments, or retention material.

## Input Handling

1. Start from a job analysis when available. If the user supplies only a job description or URL, use `$analyse-job-requirement` first when available; otherwise create a compact requirement breakdown.
2. Treat every explicit required and preferred qualification, responsibility, tool, methodology, domain concept, and behavioral competency as a study requirement. Split compound requirements into separate learnable competencies and maintain a one-to-one requirement-to-document coverage map.
3. Use a resume, background, timeline, current level, weak areas, or known hiring stages when supplied. These inputs personalize sequencing and evidence prompts but are never required to produce the teaching material.
4. When personal background is absent, provide structured evidence prompts and bracketed placeholders. Never invent projects, achievements, or interview stories.

## Output Contract

Produce a complete guide set, not a resource list.

- For Markdown, produce `00-study-roadmap.md` plus one numbered topic file for every required and preferred requirement, for example `01-sql.md`.
- For DOCX, create an equivalent roadmap and individual numbered topic documents. Use `documents:documents` when available.
- Each topic document must be understandable without opening an external link. A learner may use the optional references to verify, update, or deepen their knowledge, but must not need them to learn a major concept or complete an exercise.
- For an in-chat request, present the roadmap first, then each standalone topic document in dependency order. If the material exceeds one response, continue in labeled topic-document parts; do not replace the lessons with summaries or links.

## Workflow

1. Build the roadmap.
   - Order requirements by prerequisite and role importance.
   - State the expected outcome and evidence of competence for each topic document.
   - Make assumptions about unspecified assessment formats explicit.

2. Research to support teaching.
   - Prioritize user-provided material, official documentation, standards bodies, universities, and reputable primary sources.
   - Verify time-sensitive facts, tool versions, and resource access when live search is available.
   - Synthesize sources into original, role-specific explanations. Do not copy long passages or make the learner read sources to fill an explanatory gap.

3. Write every topic document using the complete lesson contract in `study-guide-rubric.md`.
   - Teach Beginner Foundations, Intermediate Application, and Advanced Judgment in that order.
   - Include worked examples, guided practice, completed solutions or evaluation criteria, role scenarios, a practical deliverable, and retention material.
   - Define terminology before relying on it and explain the reasoning behind recommended actions.

4. Add relevant assessment preparation.
   - Select formats that match the role or employer evidence: technical task, coding exercise, SQL/data analysis, case study, system design, writing sample, role-play, or practical work sample.
   - Include a timed assessment, model answer or completed example solution, scoring rubric, remediation guidance, interview questions, and a truthful evidence prompt.
   - Do not include irrelevant assessment types or assist with active, prohibited, or live assessments.

5. Finish with optional references.
   - Put citations, provider, URL, access level, access date when relevant, and a short purpose note in `References And Further Practice` at the end of each topic document.
   - Label external resources as optional and distinguish source-backed facts from study recommendations.

## Quality Checks

Before responding, verify that:

- The roadmap and a full topic document exist for every required and preferred requirement.
- Every topic document contains all three learning levels, role-specific explanations, worked examples, practice, answer keys or rubrics, assessment rehearsal, retention material, and exit criteria.
- No major concept, required procedure, or exercise answer is delegated to an external link.
- The assessment format is relevant to the role and every timed task has a model solution and scoring criteria.
- All citations are optional further-practice material, accurate to the best available source evidence, and clearly labeled for access limitations.
- Personal evidence remains truthful and uses prompts or placeholders when the user did not supply background.
