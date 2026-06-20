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

## Mandatory Subagent Execution

For this skill, topic writing must use subagents whenever the Codex runtime supports subagents.

After creating and freezing:

* `00-study-roadmap.md`
* `00-requirement-coverage-map.md`
* the Canonical Prerequisite Registry
* the final filename/lesson manifest

the coordinator must stop doing topic authoring directly and explicitly spawn parallel subagents.

### Subagent Batching, Approval, and Effort Defaults

Subagent execution must be approval-gated and batched.

* The maximum number of simultaneously active topic-writing subagents is **3**.
* If the Codex runtime has its own lower concurrency limit, use the lower limit.
* Never spawn more than 3 topic-writing subagents in one batch, even if more manifest rows remain.
* After each batch finishes, the coordinator must summarize:

  * completed output paths,
  * failed or incomplete output paths,
  * any missing prerequisite requests,
  * unresolved ambiguities,
  * remaining topic documents not yet spawned.
* Before spawning the next batch, the coordinator must ask the user for approval.
* The coordinator must not spawn the next batch until the user explicitly approves.
* If user approval is unavailable in the current run, stop after the completed batch and report that remaining topic documents are pending approval.
* Subagents must use **High** reasoning/effort by default.
* Use a different subagent effort level only when the user explicitly specifies one for this run.
* If the runtime does not expose an effort setting for subagents, include `Effort: High` in the subagent task packet and state in the final response that the requested effort level was expressed as an instruction rather than a runtime parameter.


Use this exact orchestration rule:

1. Create `topic-manifest.csv` with one row per planned topic document.
2. Each row must include:

   * `output_path`
   * `lesson_type` = `foundation` or `role`
   * `lesson_title`
   * `covered_requirement_or_prerequisite`
   * `job_evidence`
   * `canonical_prerequisite_filenames`
   * `allowed_references`
   * `handoff_schema`
3. Spawn topic-writing subagents in approval-gated batches:
   * Select the next unstarted rows from `topic-manifest.csv` in dependency/roadmap order.
   * Spawn at most 3 subagents in the batch.
   * Each subagent receives exactly one manifest row.
   * Each subagent must use `High` effort by default unless the user explicitly specified a different effort level.
   * Do not spawn subagents for later rows until the current batch has completed and the user has approved the next batch.

4. Wait for all subagents in the current batch to finish before integration for that batch. After the batch finishes:
   * collect and review every handoff,
   * check that each subagent wrote only its assigned `output_path`,
   * summarize batch results for the user,
   * list the next pending batch of up to 3 topic documents,
   * ask the user whether to approve spawning the next batch.
  4a. If the user approves the next batch, repeat step 3 for the next unstarted manifest rows. If the user does not approve, pause topic authoring and report the remaining pending files.
5. The coordinator may write only the `00-` documents, manifest, integration edits, validation fixes, and final response.
6. A topic-writing subagent may write only its assigned `output_path`.
7. If Codex cannot spawn subagents, the coordinator must state this explicitly in the final response: “Subagents were not available in this run, so I executed the topic-writing phase sequentially.”
8. Do not silently fall back to sequential topic writing.

Each subagent must receive this task packet:

You are a topic author for the `$build-job-study-guide` skill. Write exactly one independently readable lesson.

Assigned output path: `{output_path}`
Lesson type: `{lesson_type}`
Lesson title: `{lesson_title}`
Covered requirement or prerequisite: `{covered_requirement_or_prerequisite}`
Job evidence: `{job_evidence}`
Canonical prerequisite filenames: `{canonical_prerequisite_filenames}`
Allowed references: `{allowed_references}`

Rules:

* Write only the assigned output file.
* Do not edit `00-study-roadmap.md`, `00-requirement-coverage-map.md`, the manifest, or another lesson.
* Do not create new prerequisite lessons.
* If a missing prerequisite is discovered, report it in the handoff instead of creating a new file.
* Follow `references/study-guide-rubric.md`, `references/study-content-library.md`, and `references/lesson-depth-quality-gates.md`.
* Include two fully solved worked paths: one guided baseline and one failure, edge-case, or trade-off path.
* Include complete practice, assessment, model solution, scoring, and remediation.

Return this handoff:

```json
{
  "output_path": "",
  "covered_item": "",
  "prerequisite_lessons_referenced": [],
  "references_used": [],
  "new_prerequisite_requested": null,
  "unresolved_ambiguity": null,
  "quality_gate_notes": ""
}
```

## Workflow

1. **Map requirements and dependencies.** List job evidence, competency, canonical prerequisite concepts, one planned foundation lesson per unique prerequisite, planned role lesson, practical proof, and likely assessment. Do not write the roadmap until every requirement has a destination and every prerequisite has one owner.
2. **Freeze shared guide inputs.** The coordinator creates `00-study-roadmap.md`, `00-requirement-coverage-map.md`, and the prerequisite registry before topic writing begins. Treat these documents as read-only inputs for topic authors until integration. They are the sole source of truth for filenames, requirement coverage, and prerequisite reuse.
3. **Sequence foundations before applications.** Teach concepts in the order needed to use them. Foundations teach general mechanisms; role lessons apply them to the employer’s work. Add a brief readiness diagnostic when the learner supplied a mixed background.
4. **Research for accuracy.** Use user material first, then current primary sources, standards bodies, universities, or official documentation. Synthesize original explanations. Research supports factual accuracy; it must not carry the instructional load.
5. **Write each document with the novice-complete contract.** Follow the exact structure and depth rules in `study-guide-rubric.md`. Use the patterns in `study-content-library.md`. For each topic, include two fully solved worked paths: a guided baseline and a failure, edge-case, or trade-off path.
6. **Add role-relevant assessment preparation.** Match coding, data, system-design, writing, role-play, or operational exercises to the job evidence. Give the learner all starting data, constraints, steps, verification criteria, completed solution, scoring, and remediation needed to practise independently.
7. **Offer optional consolidation after lesson completion.** After all foundation and role lesson documents are finished and integrated, ask the user whether they want a consolidated Markdown or DOCX document with topics ordered by the roadmap/dependency sequence. If the user confirms a format, create that consolidated document while preserving the separate lesson files and the established topic order.
8. **Validate before delivery.** Apply every gate in `lesson-depth-quality-gates.md`. For Markdown guides, run `sh scripts/validate-study-guide.sh <guide-directory>`. Fix all failures before presenting the guide.

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
- After all lesson documents are complete, the user is asked whether they want a consolidated Markdown or DOCX document ordered by the roadmap/dependency sequence.
- References are optional and Markdown/DOCX have equivalent content.
- Personal evidence prompts remain truthful and use placeholders where background is absent.
