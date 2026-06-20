---
name: build-topic-knowledge-guide
description: Use when Codex needs to turn any knowledge topic, technology, domain, tool, concept set, syllabus, article, or role-relevant subject into a self-contained study and knowledge guide with dense Q&A, step-by-step mechanisms, practical examples, troubleshooting, comparisons, cheat sheets, and final readiness checklists. Use for learning plans, interview preparation, revision guides, technical knowledge guides, conceptual deep dives, or beginner-to-practitioner guides when the user asks for guide quality similar to a professional Linux/interview study guide.
---

# Build Topic Knowledge Guide

Create a polished study guide that helps a learner explain, apply, troubleshoot, compare, and revise a topic without relying on external links for core learning.

For every full guide, read:

- [guide-quality-rubric.md](references/guide-quality-rubric.md)
- [guide-template.md](references/guide-template.md)
- [question-patterns.md](references/question-patterns.md)

## Learner Assumption

Assume a motivated beginner unless the user gives a background, exam target, job target, deadline, or preferred depth. Do not skip foundations just because the topic is common among practitioners.

If a topic is broad, split it into a dependency-ordered guide set. If the user asks for a short guide, keep it compact but preserve mechanisms, examples, checks, and revision prompts.

## Input Handling

1. Identify the topic, learner level, purpose, output format, deadline, and any source material.
2. Ask one clarification only when the missing detail changes the guide shape materially. Otherwise proceed with explicit assumptions.
3. For current or version-sensitive topics, research with primary or official sources. Use sources for accuracy, not as a substitute for teaching.
4. Convert the topic into a knowledge map: foundations, core mechanisms, operational procedures, troubleshooting, comparisons, applications, and revision material.
5. Prefer the user's source material when supplied. Label uncertainty and distinguish sourced facts from reasonable inferences.

## Output Contract

Default to Markdown.

For file output, create `knowledge-guides/<topic-slug>/` with:

- `00-study-guide.md`: the main guide, including title, target learner, how to study, table of contents, knowledge map, study sequence, numbered sections, Q&A, examples, failures, comparisons, and final readiness.
- `99-cheat-sheets-and-checklist.md`: condensed recall material, one-page cheat sheets, common commands or formulas when relevant, memory drills, and final checklist.
- Additional numbered module files only when the topic is too large for a readable single guide.

For in-chat output, present the same structure in compressed form and continue in labelled parts if needed. Do not reduce the answer to a resource list.

When the user explicitly requests DOCX or PDF, use the relevant document/PDF skill if available. Preserve the same content and verify rendering when layout matters.

## Workflow

1. **Define the learning target.** State the learner assumption, scope, exclusions, success criteria, and how to use the guide.
2. **Build the knowledge map.** Order concepts so prerequisites appear before dependent mechanisms. Include conceptual, procedural, diagnostic, and judgment topics.
3. **Plan the Q&A spine.** Use `question-patterns.md` to create questions that force explanation, procedure, troubleshooting, comparison, and recall.
4. **Write mechanism-first sections.** For each section, define terms before use, explain causal steps, show practical examples, include checks, and name failure modes.
5. **Add operational material.** Include commands, code, formulas, decision records, diagrams, or worked artifacts only when useful. Explain non-obvious lines, fields, inputs, outputs, and verification.
6. **Add comparison and judgment.** When alternatives exist, compare them by criteria, choose a default, state caveats, and explain what evidence would change the choice.
7. **Add revision material.** End with cheat sheets, flashcards, memory drills, practice prompts, and a final checklist.
8. **Validate before delivery.** Apply `guide-quality-rubric.md`. For Markdown file output, run `sh scripts/validate-topic-guide.sh <guide-directory>` and fix failures.

## Non-Negotiable Teaching Rules

- Start with a concrete audience and learning goal.
- Define every term, abbreviation, notation, command, role, input, and output before relying on it.
- Explain mechanisms as ordered steps a learner can trace.
- Include concrete examples or worked artifacts for major ideas.
- Include practical checks: how to verify, inspect, test, measure, or self-assess.
- Include common failures, symptoms, diagnosis, correction, and prevention.
- Include compare-and-choose sections when credible alternatives exist.
- Include cheat sheets and final checklist material for revision.
- Keep references optional. A learner must not need an external link to understand the core guide.

## Quality Checks

Before responding, verify:

- The guide has a clear audience, scope, and how-to-study instructions.
- The table of contents reflects the actual sections.
- The first example in each section is understandable from prior material.
- Q&A answers include mechanisms, checks, and implications rather than definitions alone.
- Operational content includes preferred path, alternatives, and cautions when applicable.
- Troubleshooting content includes symptoms, likely causes, checks, fixes, and prevention.
- Cheat sheets compress the guide without introducing unexplained terms.
- No placeholders, invented sources, or unsupported personal claims remain.
