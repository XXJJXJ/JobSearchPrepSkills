---
name: build-job-study-guide
description: Use when Codex needs to turn a job analysis, job description, or role requirements into self-contained study material for a learner with an unknown or beginner background, including prerequisite lessons, realistic practice, and interview preparation.
---

# Build Job Study Guide

Create a curriculum that teaches the knowledge required to perform a role. A guide is not complete because it names a topic or provides a resource: the learner must be able to follow its examples, complete its practice, and defend its decisions without opening an external link.

Read [study-guide-rubric.md](references/study-guide-rubric.md), [study-content-library.md](references/study-content-library.md), and [lesson-depth-quality-gates.md](references/lesson-depth-quality-gates.md) for every guide.

## Learner Assumption

Assume the learner has no relevant prior knowledge unless the user supplies their current level, background, or completed prerequisites. Do not compress teaching because a topic is common to practitioners. A learner may know general reading and arithmetic, but must be taught every role-relevant concept, tool, notation, input, and decision rule before applying it.

If a guide would become long, create more numbered documents or continue in labelled parts. Never replace essential explanation with a link, a phrase such as “use X,” or an unexplained code snippet.

## Input Handling

1. Start from a job analysis. When the user supplies only a job description or URL, use `$analyse-job-requirement` first when available; otherwise create a compact evidence-aware breakdown.
2. Split every explicit required or preferred qualification, responsibility, tool, methodology, domain concept, and behavioural competency into separately learnable role requirements. Do not merge requirements because they are related.
3. Build one global concept-dependency map before writing any lesson. Mark every prerequisite that a beginner would need before they can understand the lesson’s first example.
4. Canonicalise prerequisites in a shared registry. Give each distinct learnable concept one name, one foundation filename, and a list of dependent role lessons. For example, every topic needing JavaScript values and functions must point to one `foundation-javascript-values-functions` lesson rather than creating local variants. Merge only prerequisites with the same learning outcome; related but different concepts remain separate.
5. Reuse user-supplied background to omit already-mastered foundations only when the user explicitly confirms mastery. Otherwise create the foundation lesson. Never invent experience, projects, achievements, or interview stories.

## Output Contract

Produce a complete guide set, not a resource list.

For Markdown, create:

- `00-study-roadmap.md`: target role, readiness assumptions, sequence, estimates, assessment assumptions, and capstone.
- `00-requirement-coverage-map.md`: one row per job requirement, its evidence, the role lesson that proves it, and every prerequisite/foundation lesson it depends on. Include a **Canonical Prerequisite Registry** with foundation ID, canonical prerequisite, merged aliases, one foundation filename, and dependent role lessons.
- Numbered foundation lessons before role lessons, with filenames containing `foundation`, for example `01-foundation-javascript-values.md`.
- One numbered role lesson for every distinct required and preferred requirement, for example `08-production-api-idempotency.md`.

For DOCX, create the same document set and content. Use `documents:documents` when available. Preserve the coverage map, foundation/role distinction, and every required lesson section.

Every topic document must be independently readable. A role lesson may point to a foundation lesson for additional practice, but must recap the definitions and mechanisms needed for its own examples. References are optional verification or further practice only.

For an in-chat request, present the roadmap and coverage map first, then documents in dependency order. Continue in labelled parts if needed; do not reduce the explanation to fit one message.

## Workflow

1. **Map requirements and dependencies.** List job evidence, competency, canonical prerequisite concepts, one planned foundation lesson per unique prerequisite, planned role lesson, practical proof, and likely assessment. Do not write the roadmap until every requirement has a destination and every prerequisite has one owner.
2. **Freeze shared guide inputs.** The coordinator creates `00-study-roadmap.md`, `00-requirement-coverage-map.md`, and the prerequisite registry before topic writing begins. Treat these documents as read-only inputs for topic authors until integration. They are the sole source of truth for filenames, requirement coverage, and prerequisite reuse.
3. **Sequence foundations before applications.** Teach concepts in the order needed to use them. Foundations teach general mechanisms; role lessons apply them to the employer’s work. Add a brief readiness diagnostic when the learner supplied a mixed background.
4. **Research for accuracy.** Use user material first, then current primary sources, standards bodies, universities, or official documentation. Synthesize original explanations. Research supports factual accuracy; it must not carry the instructional load.
5. **Write each document with the novice-complete contract.** Follow the exact structure and depth rules in `study-guide-rubric.md`. Use the patterns in `study-content-library.md`. For each topic, include two fully solved worked paths: a guided baseline and a failure, edge-case, or trade-off path.
6. **Add role-relevant assessment preparation.** Match coding, data, system-design, writing, role-play, or operational exercises to the job evidence. Give the learner all starting data, constraints, steps, verification criteria, completed solution, scoring, and remediation needed to practise independently.
7. **Validate before delivery.** Apply every gate in `lesson-depth-quality-gates.md`. For Markdown guides, run `sh scripts/validate-study-guide.sh <guide-directory>`. Fix all failures before presenting the guide.

## Parallel Topic Production

After the coordinator freezes the shared inputs, spawn subagents to prepare independent foundation and role-topic documents in parallel. Do not parallelise the dependency map, prerequisite registry, roadmap, coverage map, numbering, or final integration.

1. Assign at most one subagent to each unique foundation lesson and at most one subagent to each role lesson. Queue remaining lessons when concurrency is limited.
2. Give every subagent the same frozen task packet: target role and job evidence, learner assumption, lesson contract, assigned requirement or foundation concept, canonical prerequisite filenames, source/research constraints, exact output filename, and the instruction not to edit shared `00-` documents or another agent’s file.
3. Give each subagent an isolated output path. A subagent may write only its assigned topic file and may read the frozen registry and other completed foundations. It must not create an alternative prerequisite lesson, renumber documents, or alter the coverage map.
4. Require each subagent to return a concise handoff: output path, requirement/foundation covered, prerequisite lessons referenced, optional references used, and any unresolved ambiguity. Do not accept a topic that reports a new prerequisite without routing it to the coordinator.
5. The coordinator resolves new prerequisites by updating the registry once, assigning one foundation owner, and updating all dependent topics before they are finalised. Do not duplicate a foundation to avoid waiting; queue dependent role lessons or let them include only a short, explicit recap until the shared foundation exists.
6. After all topic authors finish, the coordinator checks document names, one-to-one requirement coverage, prerequisite reuse, cross-links, and full lesson quality. Resolve conflicts centrally, then run the guide validator and depth gates. When subagents are unavailable, execute the same phases sequentially.

## Non-Negotiable Teaching Rules

- Define a term before relying on it. Define abbreviations, syntax, inputs, outputs, and decision rules at first use.
- Explain non-obvious code, data, diagrams, and workflow steps line-by-line or decision-by-decision. State what happens, why it happens, how to check it, and what changes when the condition changes.
- Give each worked path a concrete goal, starting state, inputs, constraints, numbered approach, completed result, verification, reasoning, and failure prevention.
- Make intermediate practice executable from the document alone. Include setup, supplied data or realistic placeholders, exact deliverable, method, expected output, verification, full solution, and troubleshooting.
- Make advanced judgment comparative. Explain at least two credible options, the criteria that favour each, risks and consequences, and the reasoning that selects an option in a role-specific case.
- Use completed artefacts and commentary for non-technical topics. Do not substitute advice such as “communicate clearly” for a worked brief, RFC, decision record, incident update, or role-play response.

## Quality Checks

Before responding, confirm that:

- Every job requirement is represented once in `00-requirement-coverage-map.md` and has a distinct role lesson.
- Every prerequisite from the dependency map has exactly one canonical foundation lesson or is explicitly recapped in the dependent lesson; the coverage map links every dependent topic to that same lesson.
- Shared prerequisite lessons are not duplicated under different names or independently rewritten inside role lessons. Role lessons may recap only the definitions/mechanisms required to understand their own examples.
- Parallel topic authors received frozen shared inputs and wrote only their assigned output paths; the coordinator owns all `00-` documents, registry changes, numbering, and integration.
- A true beginner can define all terms and follow all code, data, and procedures used in each document.
- Every lesson contains both completed worked paths and both explain their reasoning and verification.
- Every intermediate task can be started and assessed without another tutorial, repository, or external link.
- Every advanced section compares options and justifies a context-specific decision rather than asserting a recommendation.
- Every assessment has a complete prompt, constraints, model solution, scoring rubric, result bands, and targeted remediation.
- References are optional and Markdown/DOCX have equivalent content.
- Personal evidence prompts remain truthful and use placeholders where background is absent.
