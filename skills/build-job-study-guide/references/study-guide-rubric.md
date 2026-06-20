# Novice-Complete Study Guide Rubric

Use this rubric for every `$build-job-study-guide` output. The default learner has no role-relevant prior knowledge. The guide must teach them enough to perform intermediate application and evaluate advanced choices without external instruction.

## 1. Guide-Level Contract

### 1.1 Roadmap and Coverage Map

Create `00-study-roadmap.md` and `00-requirement-coverage-map.md` before topic documents.

The roadmap must state target role, source analysis, learner assumption, readiness outcome, assessment assumptions, a dependency-ordered sequence, practical proof, and capstone. Each row must identify whether it is a foundation or role lesson.

The coverage map must include one row for every job requirement:

| Job evidence | Requirement | Role lesson | Foundation lessons | Practical proof | Assessment |
|---|---|---|---|---|---|

Do not use a broad document such as “full-stack engineering” to cover TypeScript, React, Node.js, API design, and databases. Split them into distinct role lessons, then share foundation lessons where appropriate.

### 1.2 Foundation Lessons

Create a foundation lesson whenever a beginner would need a concept before understanding a role lesson’s first example. Examples include programming values before TypeScript types, HTTP before API design, identity and permissions before access-control design, or metrics before reliability targets.

Foundation lessons must be numbered before dependent role lessons and have `foundation` in the filename. They teach transferable mechanisms; role lessons use those mechanisms in job-specific situations.

## 2. Topic Document Contract

Use this exact shape for every foundation and role lesson. Add subsections when a concept needs more explanation; do not remove a section to shorten the lesson.

```markdown
# [Topic] for [Target Role]

## Role Relevance and Outcomes
- Job evidence or foundation dependency:
- What the learner will explain, do, and demonstrate:

## Learner Readiness and Concept Map
- Starting knowledge assumed: none / supplied knowledge only
- Terms and prerequisites taught or recapped before use:
- Concept flow: [concept] → [mechanism] → [role use] → [decision]

## Beginner Foundations
### Purpose and Plain-Language Definition
### Terms, Inputs, Outputs, and Decision Rules
### Mechanism Step by Step
### Boundary: What This Does Not Guarantee
### Beginner Check With Reasoned Answer

## Worked Path 1: Guided Baseline
### Goal, Starting State, and Constraints
### Inputs and Setup
### Numbered Approach With Why and Verification
### Completed Result
### Why the Result Works

## Worked Path 2: Failure, Edge Case, or Trade-off
### Scenario and Failure Mechanism
### Diagnosis
### Corrected or Alternative Approach
### Verification and Prevention

## Intermediate Application
### Repeatable Workflow
### Guided Role Scenario
### Practice Task With Starting Material
### Completed Solution With Reasoning
### Troubleshooting and Common Failure Modes

## Advanced Judgment
### Options and Selection Criteria
### Quality, Scale, Risk, Cost, or Compliance Effects
### Advanced Role Case and Decision Record

## Practical Deliverable
- Instructions, expected artifact, self-review method, quality criteria

## Timed Assessment
- Competency, format, time, constraints, complete prompt, model solution, scoring, bands, remediation

## Interview and Evidence Preparation
### Question and Model Answer
### Truthful Evidence Prompt

## Retention and Exit Criteria
### Misconceptions, Flashcards, Revision Summary, I Can Statements

## References and Further Practice
| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
```

## 3. Minimum Instructional Depth

### Beginner Foundations

For every concept used later in the lesson:

1. State the purpose and the problem it solves.
2. Give a plain-language definition before specialist language.
3. Define the inputs, outputs, important parts, and decision rules.
4. Explain the mechanism in a sequence a beginner can trace.
5. Show a small result and explain why it is correct.
6. State a boundary: what the concept cannot prove, control, or replace.

If an example contains code, query syntax, a calculation, a diagram, or a policy rule, explain each non-obvious line, field, operator, arrow, or decision before asking the learner to modify it.

### Worked Paths

Each worked path must include a goal, starting state, concrete inputs, constraints, numbered steps, completed result, verification method, explanation of why it works, and prevention of the relevant failure. Path 1 teaches the normal route. Path 2 teaches an error, edge case, unsafe shortcut, or competing option. Do not label a paragraph “worked example” when it omits the intermediate reasoning.

### Intermediate Application

Intermediate tasks must provide all material required to start: environment/setup assumptions, data or placeholders, role scenario, deliverable, procedure, success criteria, and verification method. A completed solution must show the result and the reasoning behind each material decision. The troubleshooting table must state symptom, likely cause, first diagnostic check, correction, and prevention.

### Advanced Judgment

Advanced material must not be a more confident assertion. Compare at least two credible options. State the criteria that favour each option, including relevant correctness, security, reliability, scale, cost, usability, compliance, or stakeholder effects. The role case must record facts, assumptions, options, decision, rationale, consequences, residual risk, and what evidence would reverse the decision.

## 4. Assessment and Evidence Rules

Select only formats supported by the role or a clearly labelled inference. Every timed assessment must state competency, time, permitted assumptions, full scenario/data, deliverable, model answer, scoring rubric, result bands, and targeted remediation.

Use placeholders when background is absent. Never turn an evidence prompt into an unsupported personal claim.

## 5. Rejection Conditions

Reject and revise a document if any of the following is true:

- A learner must know an undefined term, notation, tool, or prerequisite to read an example.
- Code, data, a diagram, or a workflow has a non-obvious step without an explanation of what it does and why.
- A practice task depends on an external tutorial, unstated setup, unavailable data, or an answer that only names a solution.
- A model answer gives a conclusion but not the reasoning, verification, or trade-off behind it.
- An advanced section offers one recommendation without credible alternatives and selection criteria.
- An external reference supplies an essential concept or procedure missing from the lesson.
- A job requirement lacks a distinct mapped role lesson, or a dependent lesson lacks a mapped foundation/recap.

## 6. Final Checklist

- [ ] Roadmap, coverage map, foundation lessons, and distinct role lessons exist.
- [ ] Every prerequisite is taught or recapped before use.
- [ ] Every lesson has two complete worked paths.
- [ ] Every intermediate practice task is executable and fully solved in the document.
- [ ] Every advanced case compares options and records a defensible decision.
- [ ] Every assessment and evidence prompt is complete and truthful.
- [ ] Optional references are not prerequisites for learning.
- [ ] Markdown and DOCX provide equivalent content.
