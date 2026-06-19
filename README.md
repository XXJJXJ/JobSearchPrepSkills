# Repository Guidelines

## What This Repository Does

This repository contains Codex skills for turning job descriptions, resumes, and role requirements into practical interview and study preparation material. Use it when you need to understand a role quickly, compare your background against it, improve resume positioning, or build a targeted study guide from the gaps.

## Available Skills

- `analyse-job-requirement`: Breaks down a job post into role purpose, responsibilities, required qualifications, preferred qualifications, skill map, seniority signals, hiring priorities, and ambiguities. Use this first when you only have a job description or job URL.
- `review-resume-fit`: Compares a resume against a target job description. It scores fit, identifies true gaps versus wording problems, suggests ATS keywords, rewrites bullets truthfully, and recommends resume improvements without inventing experience.
- `build-job-study-guide`: Creates a Markdown or DOCX study guide from a job analysis, resume gap analysis, or raw job description. It maps requirements to study topics, curates free resources, builds study modules, and adds practice questions, answers, flashcards, and revision summaries.

## Fast Interview-Preparation Workflow

1. Start with a job post: run `$analyse-job-requirement` to extract what the employer is really asking for.
2. Add your resume: run `$review-resume-fit` to identify match strength, ATS gaps, missing evidence, and weak bullets.
3. Convert gaps into study material: run `$build-job-study-guide` for the highest-priority requirements or weak areas.
4. Use the outputs together: update your resume, prepare interview stories, review likely technical or behavioral questions, and complete practice tasks that mirror the role.

Example prompt:

```text
Use $review-resume-fit to compare my resume against this job description, then identify the top study topics I should prepare before interviewing.
```

## Repository Layout

Each skill lives in `skills/<skill-name>/`:

- `SKILL.md`: main instructions and workflow.
- `agents/openai.yaml`: display name, short description, and default prompt.
- `references/*.md`: rubrics, templates, and reusable guidance.

## Guidance For Contributors

Keep skill names lowercase and hyphenated. Write Markdown in clear instructional language, keep YAML valid, and link reference files explicitly from `SKILL.md`. Before committing, run:

```bash
rg --files skills
git diff --check
```

Recent commits use short messages such as `feat: resume fit skill`; follow `feat:`, `fix:`, or `docs:` with a concise summary. Do not commit real resumes, private job links, credentials, or user-specific career data.
