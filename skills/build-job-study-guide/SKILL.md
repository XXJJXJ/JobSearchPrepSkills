---
name: build-job-study-guide
description: Build a Markdown or DOCX study document from a job analysis, job requirement breakdown, or job description. Use when Codex needs to identify skill gaps, search for current free learning materials, curate reputable free resources, organize a role-specific study plan, and create study notes, cheat sheets or cheatsheets, interview questions, and answers for job preparation.
---

# Build Job Study Guide

## Overview

Turn a job analysis into a practical study document that helps a learner prepare for the role. Start from the generated job analysis when available; otherwise analyze the job description first or ask for the missing job analysis.

Read [study-guide-rubric.md](references/study-guide-rubric.md) when creating a full study document, selecting free resources, building a study plan, or writing questions and answers.

Read [study-content-library.md](references/study-content-library.md) when the user asks for actual study content, cheat sheets, cheatsheets, interview questions, practice answers, or a ready-to-study document rather than only a plan and resource list.

## Input Handling

1. Identify the input type.
   - If the user provides a job analysis, use its responsibilities, qualifications, knowledge map, seniority signals, and candidate preparation notes as the study blueprint.
   - If the user provides a raw job description or URL instead of an analysis, use `$analyze-job-requirement` first when available, or produce a compact role/skills breakdown before building the guide.
   - If the user also provides a resume, background, target timeline, or weak areas, personalize the priority order and practice questions.

2. Select the output format from the user's preference.
   - Produce Markdown when the user asks for Markdown, `.md`, plain text, an in-chat study guide, or does not specify a file format.
   - Produce DOCX when the user asks for Word, `.docx`, an editable document, or a downloadable study document.
   - If the user asks for another format, offer Markdown or DOCX unless they explicitly require conversion outside this skill's scope.
   - If DOCX is requested, use the `documents:documents` skill when available and create an editable `.docx` containing the same sections as the Markdown guide.

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
   - Include concise study notes and cheat sheets for each major module.
   - Include a weekly or phased plan when the user gives a timeline, or a default 2-4 week plan when useful.
   - Add hands-on exercises that mirror role responsibilities.
   - Add Q&A for each topic, including conceptual, practical, scenario, behavioral, and interview-style questions with answers.

5. Verify and cite.
   - Cite each resource URL and label it as free, free with account, or partly free.
   - Mention the access date when resources are likely to change.
   - Distinguish source-backed facts from your study recommendations.
   - If a resource cannot be verified as free, do not present it as free.

## Study Document Shape

Use either Markdown or DOCX depending on the user's preference. Keep the same content structure in both formats.

For a standard guide, produce:

- Role preparation summary: what the learner is preparing for and the highest-priority gaps.
- Skills-to-study map: job requirement, study topic, priority, and evidence from the job analysis.
- Curated free resources: grouped by topic with source links and rationale.
- Study path: ordered modules with outcomes, readings/videos/labs, and checkpoints.
- Study notes and cheat sheets: concise explanations, frameworks, formulas, commands, vocabulary, or decision rules that fit the role.
- Practice tasks: hands-on activities that simulate the role's responsibilities.
- Questions and answers: topic-by-topic Q&A, including interview and applied scenario questions with model answers.
- Review checklist: what the learner should be able to explain, build, analyze, or demonstrate.
- Next steps: portfolio pieces, resume keywords, interview prep, or deeper learning when relevant.

## Quality Checks

Before responding:

- Verify that every major study topic maps back to a job requirement, responsibility, qualification, or knowledge gap.
- Verify that resources are free or clearly labeled with access limitations.
- Verify that the guide contains learning content, cheat sheets, and Q&A, not just links.
- Verify that questions include answers and cover applied understanding, interview communication, and role scenarios.
- Verify that citations are present for external resources.
- Verify that the final output format is Markdown or DOCX, matching the user's preference or the default Markdown behavior.
- If live search is unavailable, say so and produce a study structure without pretending resources were verified.
