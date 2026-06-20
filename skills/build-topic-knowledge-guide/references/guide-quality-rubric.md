# Topic Knowledge Guide Quality Rubric

Use this rubric for every `$build-topic-knowledge-guide` output. The reference quality is a dense professional study guide: specific audience, strong table of contents, numbered Q&A, mechanism-first answers, practical commands or examples, comparisons, troubleshooting, cheat sheets, and final readiness checks.

## 1. Guide-Level Gates

### 1.1 Target and Scope

The guide must state:

- Topic and target learner.
- Purpose: interview, exam, work readiness, self-study, or general mastery.
- Starting assumption and omitted areas.
- How to use the guide: read, cover answers, explain aloud, redo checks, then use the checklist.

Reject a guide that starts with generic background before naming who it is for and what success means.

### 1.2 Knowledge Map

Create a dependency-aware map before the lessons:

| Area | Why it matters | Prerequisites | Questions to answer | Practice/check |
|---|---|---|---|---|

The map must include foundations, mechanisms, procedures, troubleshooting, comparisons, applications, and revision material where relevant.

### 1.3 Self-Containment

The guide must teach the core topic directly. External references may verify or extend learning, but removing them must not break the learner's ability to follow examples, complete practice, or answer recall questions.

## 2. Section Contract

Every major section must contain:

- A mental model or plain-language framing.
- Numbered Q&A items.
- Terms and prerequisites before first use.
- Step-by-step mechanisms for causal or procedural topics.
- Concrete examples, commands, formulas, diagrams, or artifacts when relevant.
- Checks: how to verify the result or know the answer is correct.
- Failure modes, diagnosis, correction, and prevention.
- Key concepts or recall prompts.

Do not accept a section that only summarizes "what X is" without showing how it behaves, how to inspect it, how it fails, and why it matters.

## 3. Q&A Quality Gates

Each answer should usually include:

1. Direct answer in one or two sentences.
2. Mechanism or reasoning steps.
3. Concrete example or artifact.
4. Verification or diagnostic check.
5. Pitfall, boundary, or trade-off.
6. Key concepts or memory hook.

Use compact prose, but do not omit reasoning. A high-quality answer is short because it is precise, not because it is shallow.

## 4. Operational Material Gates

When a topic involves tools, systems, math, law, policy, workflows, or procedures, include:

- Preferred method and why it is preferred.
- Variants or alternatives.
- Inputs and expected outputs.
- How to inspect or verify the result.
- Safety, cost, compliance, state mutation, or reversibility cautions.
- Common symptoms and first diagnostic checks.

For commands and code, explain non-obvious flags, fields, operators, and side effects.

## 5. Compare-and-Choose Gates

When alternatives exist, include:

| Option | Best for | Avoid when | Trade-off | Default stance |
|---|---|---|---|---|

Then state a decision rule:

- Choose option A when these conditions hold.
- Choose option B when these conditions hold.
- Revisit the choice if this evidence changes.

Reject one-option recommendations unless no credible alternative exists.

## 6. Troubleshooting Gates

Troubleshooting must include:

| Symptom | Likely cause | First check | Fix | Prevention |
|---|---|---|---|---|

For complex systems, include an ordered diagnostic path: observe, narrow scope, test hypothesis, fix, verify, prevent recurrence.

## 7. Revision and Checklist Gates

The guide must end with recall material:

- One-page cheat sheets or equivalent compressed reference.
- Flashcards or high-yield Q&A.
- Memory drills: "explain from memory", "draw the flow", "redo the example".
- Final readiness checklist with concrete actions.

The checklist must use actionable items, not vague advice.

## 8. Rejection Conditions

Revise the guide if any condition is true:

- The learner must understand an undefined term, abbreviation, notation, tool, or prerequisite.
- A mechanism jumps from input to result without intermediate steps.
- A command, formula, workflow, or code block lacks explanation of important parts.
- Troubleshooting names fixes without symptoms, checks, or prevention.
- A comparison recommends one option without criteria or caveats.
- A practice task lacks starting material, expected output, verification, or solution.
- References carry essential teaching.
- Cheat sheets introduce unexplained terms.
- The final checklist is generic or motivational rather than operational.

## 9. Final Manual Checklist

- [ ] Audience, purpose, assumptions, and how-to-study instructions exist.
- [ ] Table of contents and knowledge map exist.
- [ ] Sections are dependency ordered.
- [ ] Numbered Q&A forms the guide spine.
- [ ] Mechanisms are step-by-step.
- [ ] Examples and checks are concrete.
- [ ] Failure modes include diagnosis and prevention.
- [ ] Comparisons include criteria and caveats.
- [ ] Cheat sheets and final checklist support last-day revision.
- [ ] References are optional.
