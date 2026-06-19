---
name: build-job-study-guide
description: Build a study document from a job analysis, job requirement breakdown, or job description. Use when Codex needs to identify skill gaps, search for current free learning materials, curate reputable free resources, organize a role-specific study plan, and create study notes with practice questions and answers for interview or job preparation.
---

# Build Job Study Guide

## Overview

Turn a job analysis into a practical study document that helps a learner prepare for the role. Start from the generated job analysis when available; otherwise analyze the job description first or ask for the missing job analysis.

Read [study-guide-rubric.md](references/study-guide-rubric.md) when creating a full study document, selecting free resources, building a study plan, or writing questions and answers.

## Input Handling

1. Identify the input type.
   - If the user provides a job analysis, use its responsibilities, qualifications, knowledge map, seniority signals, and candidate preparation notes as the study blueprint.
   - If the user provides a raw job description or URL instead of an analysis, use `$analyze-job-requirement` first when available, or produce a compact role/skills breakdown before building the guide.
   - If the user also provides a resume, background, target timeline, or weak areas, personalize the priority order and practice questions.

2. Confirm the output format only when necessary.
   - Default to a Markdown study document in the response or saved artifact.
   - If the user asks for `.docx`, `.pdf`, slides, or spreadsheet tracking, use the appropriate document/spreadsheet/presentation skill when available.

## Workflow

1. Extract study targets from the job analysis.
   - Convert role responsibilities into work scenarios the learner must understand.
   - Convert required and preferred qualifications into knowledge topics, tool topics, and behavioral competencies.
   - Separate must-learn topics from optional differentiators.
   - Note any prerequisites that must be learned first.

2. Search for free materials.
   - Use live web search for current free resources because courses, documentation, and public learning material change.
   - Prefer official documentation, university/open courseware, reputable nonprofit education, vendor free tiers, standards bodies, public books, maintained tutorials, and high-quality public videos.
   - Avoid paywalled content, low-quality SEO pages, outdated tutorials, unmaintained repositories, and resources that require a paid trial unless clearly labeled optional.
   - Capture title, provider, URL, format, cost/free status, topic coverage, estimated depth, and why it fits the job requirement.

3. Curate rather than dump links.
   - Choose a small set of strong resources per topic.
   - Prioritize resources that directly map to must-have job requirements.
   - Include alternatives only when they serve different learning styles, such as documentation, video, hands-on lab, or practice problems.
   - Mark beginner, intermediate, and advanced resources when relevant.

4. Build the study document.
   - Start with the target role and the study goal.
   - Include a topic map linking each job requirement to study topics and resources.
   - Organize sections in prerequisite order, not job-post order.
   - Include a weekly or phased plan when the user gives a timeline, or a default 2-4 week plan when useful.
   - Add hands-on exercises that mirror role responsibilities.
   - Add Q&A for each topic, including conceptual, practical, scenario, and interview-style questions.

5. Verify and cite.
   - Cite each resource URL and label it as free, free with account, or partly free.
   - Mention the access date when resources are likely to change.
   - Distinguish source-backed facts from your study recommendations.
   - If a resource cannot be verified as free, do not present it as free.

## Study Document Shape

For a standard guide, produce:

- Role preparation summary: what the learner is preparing for and the highest-priority gaps.
- Skills-to-study map: job requirement, study topic, priority, and evidence from the job analysis.
- Curated free resources: grouped by topic with source links and rationale.
- Study path: ordered modules with outcomes, readings/videos/labs, and checkpoints.
- Practice tasks: hands-on activities that simulate the role's responsibilities.
- Questions and answers: topic-by-topic Q&A, including interview and applied scenario questions.
- Review checklist: what the learner should be able to explain, build, analyze, or demonstrate.
- Next steps: portfolio pieces, resume keywords, interview prep, or deeper learning when relevant.

## Quality Checks

Before responding:

- Verify that every major study topic maps back to a job requirement, responsibility, qualification, or knowledge gap.
- Verify that resources are free or clearly labeled with access limitations.
- Verify that the guide contains both learning content and Q&A, not just links.
- Verify that questions include answers and cover applied understanding.
- Verify that citations are present for external resources.
- If live search is unavailable, say so and produce a study structure without pretending resources were verified.
