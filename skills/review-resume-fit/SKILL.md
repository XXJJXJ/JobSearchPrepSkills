---
name: review-resume-fit
description: Evaluate and improve a resume against a job description or job posting. Use when Codex needs to act as an expert resume reviewer, career coach, or interview preparation advisor for resume-job fit scoring, ATS keyword alignment, section-by-section feedback, bullet rewrites, tailored resume drafts, or skill gap analysis without inventing experience.
---

# Review Resume Fit

## Overview

Compare a user's resume against a target job role and produce honest, practical, immediately usable resume and interview-prep guidance. The user may provide a resume, a job description or posting, and optional context about experience, projects, career goals, or constraints.

Read [resume-fit-rubric.md](references/resume-fit-rubric.md) when producing a full resume fit analysis, rewriting bullets, drafting tailored resume content, or identifying skill gaps.

## Workflow

1. Gather inputs.
   - Require both a resume and a job description, posting, or job URL.
   - Use optional context about experience, projects, career goals, target seniority, location, visa/work authorization constraints, or preferred industries when provided.
   - If the resume or job description is missing, ask for the missing input before giving a full fit analysis.

2. Analyse the job requirements.
   - Use `$analyse-job-requirement` when available to extract must-have skills, nice-to-have skills, responsibilities, domain knowledge, soft skills, working style, seniority, and hiring priorities.
   - If `$analyse-job-requirement` is unavailable, create a compact job breakdown before reviewing the resume.
   - Preserve evidence from the job description for each important requirement.

3. Evaluate resume fit.
   - Score match from 1 to 10 using relevant experience, required technical skills, required soft skills, project relevance, seniority, ATS alignment, and evidence of impact.
   - Separate true skill gaps from resume wording or positioning problems.
   - Be honest if the resume is not suitable for the role yet, and explain what the user should improve before applying.

4. Give practical improvement guidance.
   - Identify resume strengths, gaps, ATS keywords, and section-by-section improvements.
   - Rewrite weak bullets using action verb, technical skill or method, business/user impact, and measurable result where available.
   - If exact metrics are missing, suggest realistic metric types to look for instead of inventing numbers.
   - Create a suggested tailored resume version using only provided experience; add bracketed placeholders for missing details such as `[Add metric here if available]`.

5. Identify skill gaps and next steps.
   - Group gaps into high, medium, and low priority based on the job description.
   - For each gap, explain why it matters, what level is likely needed, how the user can demonstrate it on the resume, and a small project or task to prove the skill.
   - Offer to use `$build-job-study-guide` for selected high-priority skills when study materials would help.

## Output Shape

For a full analysis, use:

1. Overall Match Score
2. Job Requirements Breakdown
3. Resume Strengths
4. Resume Gaps
5. ATS and Keyword Optimization
6. Section-by-Section Resume Feedback
7. Bullet Point Improvements
8. Suggested Resume Version
9. Skill Gap Analysis

## Truthfulness Rules

- Do not exaggerate the user's experience.
- Do not invent achievements, metrics, companies, responsibilities, projects, credentials, dates, or technologies.
- Do not imply the user has used a tool or method unless the resume or provided context supports it.
- Use bracketed suggestions when information may exist but was not provided.
- Keep the user's career story truthful while making it clearer, more targeted, and more achievement-oriented.

## Quality Checks

Before responding:

- Verify that the analysis uses both the resume and the job description.
- Verify that must-have skills, nice-to-have skills, responsibilities, domain knowledge, soft skills, and working style are covered.
- Verify that gaps explain why they matter, where they appear in the job description, severity, and whether they are wording issues or real skill gaps.
- Verify that ATS keywords are grouped and placed naturally, without keyword stuffing.
- Verify that bullet rewrites do not fabricate metrics or experience.
- Verify that the suggested resume version contains only supported content plus bracketed prompts for missing facts.
