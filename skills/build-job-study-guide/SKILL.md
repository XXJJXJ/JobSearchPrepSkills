---
name: build-job-study-guide
description: Build a Markdown or DOCX study document from a job analysis, job requirement breakdown, or job description. Use when Codex needs to identify skill gaps, search for current free learning materials, curate reputable free resources, organize a role-specific study guide, and create key concepts, study notes, practice questions, answers, flashcards, and revision summaries.
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

2. Gather and verify source material.
   - Prioritize free and accessible material from links provided by the user.
   - If the user provides no links or the links do not cover enough material, use live web search for current free resources because courses, documentation, and public learning material change.
   - Prefer official documentation, university/open courseware, reputable nonprofit education, vendor free tiers, standards bodies, public books, maintained tutorials, and high-quality public videos.
   - Avoid paywalled content, low-quality SEO pages, outdated tutorials, unmaintained repositories, and resources that require a paid trial unless clearly labeled optional.
   - Capture title, provider, URL, format, cost/free status, topic coverage, estimated depth, and why it fits the job requirement.
   - If any user-provided link cannot be accessed, mention it and continue with the remaining accessible links and sources.

3. Curate rather than dump links.
   - Choose a small set of strong resources per topic.
   - Prioritize resources that directly map to must-have job requirements.
   - Include alternatives only when they serve different learning styles, such as documentation, video, hands-on lab, or practice problems.
   - Mark beginner, intermediate, and advanced resources when relevant.
   - Remove duplicate information across sources.
   - When sources explain the same concept differently, combine them into one clear explanation and note the supporting URLs.

4. Build the study document.
   - Start with the target role and the study goal.
   - Keep the broader job-study guide structure: role preparation summary, skills-to-study map, curated free resources, study path, study content modules, practice tasks, review checklist, and next steps.
   - Use the 9-section study-content structure in `study-guide-rubric.md` inside each major study module or topic: Overview, Key Concepts, Organized Study Notes, Must-Know Details, Common Mistakes or Misunderstandings, Practice Questions, Questions and Answers, Flashcards, and Final Revision Summary.
   - Highlight the most important topics first.
   - Make explanations beginner-friendly while detailed enough for serious study.
   - Rewrite source material clearly in your own words; do not copy large chunks from links.
   - Include source references by linking each major section back to relevant URLs.
   - Include practice questions across beginner, intermediate, advanced, scenario-based, and interview-style levels when relevant.
   - Include answers for every practice question and flashcards for memorization.

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
- Study content modules: for each major topic, use the 9-section structure: Overview, Key Concepts, Organized Study Notes, Must-Know Details, Common Mistakes or Misunderstandings, Practice Questions, Questions and Answers, Flashcards, and Final Revision Summary.
- Practice tasks: hands-on activities that simulate the role's responsibilities.
- Review checklist: what the learner should be able to explain, build, analyze, or demonstrate.
- Next steps: portfolio pieces, resume keywords, interview prep, or deeper learning when relevant.

## Quality Checks

Before responding:

- Verify that every major study topic maps back to a job requirement, responsibility, qualification, or knowledge gap.
- Verify that resources are free or clearly labeled with access limitations, and that user-provided links are prioritized when available.
- Verify that inaccessible links are mentioned without stopping the whole task.
- Verify that duplicate information across sources has been removed or merged.
- Verify that the guide retains the broader job-study scaffold and includes 9-section study content modules with key concepts, organized notes, must-know details, common mistakes, practice questions, Q&A, flashcards, and final revision summaries.
- Verify that every practice question has a clear answer formatted as `Q:` and `A:`.
- Verify that citations are present for external resources and each major section links back to relevant URLs.
- Verify that the final output format is Markdown or DOCX, matching the user's preference or the default Markdown behavior.
- If live search is unavailable, say so and produce a study structure without pretending resources were verified.
