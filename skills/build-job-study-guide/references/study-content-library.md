# Content-First Teaching Library

Use these reusable patterns to write the actual lessons in a job study guide. Adapt them to the role and topic; do not output the patterns as empty headings or send the learner to a link for missing content.

## Lesson Building Blocks

### Explain A Concept

Teach each major concept in this order:

1. **Purpose:** What problem it solves and why the target role needs it.
2. **Plain-language definition:** Explain it without assuming prior vocabulary.
3. **Mechanism:** Describe the important parts, inputs, outputs, and decision rules.
4. **Role use:** Show when the learner would use it in a realistic responsibility.
5. **Boundary:** State when it is not the right tool, what it cannot prove, or what it depends on.

Use concrete nouns, small examples, and short causal explanations. Define abbreviations before using them.

### Progress Through Levels

| Level | Teach | Prove with |
|---|---|---|
| Beginner | Vocabulary, purpose, core concepts, and a simple successful example. | Explain the concept and solve a bounded check. |
| Intermediate | Repeatable workflow, realistic inputs, validation, and troubleshooting. | Complete a guided role scenario. |
| Advanced | Trade-offs, ambiguity, constraints, scale, risk, and stakeholder judgment. | Defend a decision in a case with alternatives. |

Do not label a section as advanced merely because it uses harder terminology. It must require judgment between plausible options.

## Worked Example Pattern

Use this shape whenever a concept has a procedure, decision, calculation, query, analysis, design, or communication output.

```markdown
### Worked Example: [Role Scenario]

**Goal:** [Outcome the role needs.]

**Inputs and constraints:** [Facts, assumptions, data, deadline, risk, or stakeholder need.]

**Approach:**
1. [Step and why it comes first.]
2. [Step and how to check it.]
3. [Step and decision rule.]

**Completed result:** [Concrete output, decision, query, design, message, or artifact.]

**Why this works:** [Connect the steps to the core concept and the role outcome.]

**What could go wrong:** [Failure mode and prevention.]
```

The completed result must be specific enough to inspect. When several results are valid, show one defensible result and explain the criteria used to judge it.

## Practice And Answer-Key Pattern

Use practice to move from recognition to application.

```markdown
### Practice Task: [Role Scenario]

**Task:** [What the learner must produce or decide.]
**Constraints:** [Time, data, scope, quality, or stakeholder constraints.]
**Success criteria:** [Observable requirements.]

### Answer Key Or Evaluation Rubric
- [Criterion]: [What a strong response includes and why.]
- [Criterion]: [What a weak or incorrect response misses.]
```

For fixed-answer questions, provide the answer and reasoning. For open-ended work, provide a completed example solution plus criteria that allow an alternative valid approach to be scored fairly.

## Troubleshooting Pattern

| Symptom | Likely cause | First check | Correction | Prevention |
|---|---|---|---|---|
| [Observed issue] | [Likely cause] | [Evidence to inspect] | [Concrete fix] | [Control or habit] |

Prioritize errors that would affect correctness, safety, compliance, cost, users, or credibility in the target role.

## Timed Mock Assessment Pattern

```markdown
## Timed Assessment: [Role-Relevant Format]

**Competencies assessed:** [Skills and judgment being tested.]
**Time limit:** [Realistic duration.]
**Instructions:** [Deliverable, constraints, assumptions, and what not to optimize prematurely.]

### Assessment Prompt
[Complete task, dataset description, case, or scenario.]

### Model Answer or Completed Example Solution
[Walk through the solution, decisions, checks, and trade-offs.]

### Scoring rubric
| Criterion | Strong | Partial | Missing |
|---|---|---|---|

### Result Bands And Remediation
- **Ready:** [Score range and next practice.]
- **Developing:** [Score range and focused repair work.]
- **Foundation needed:** [Score range and which earlier lesson material to revisit.]
```

Keep the format relevant to the role. A data role may need SQL and interpretation; a customer-facing role may need a written response or role-play; a systems role may need requirements, design, trade-offs, and failure handling.

## Interview And Evidence Pattern

### Technical Or Role Answer

Use this answer flow:

1. Give a direct answer or recommendation.
2. Explain the reasoning, workflow, or decision rule.
3. Use a concise role-relevant example.
4. Name the important trade-off, limitation, or failure mode.
5. Connect the answer to the target responsibility.

### Truthful Evidence Prompt

When user background is available, ask for a specific situation, personal action, tool or method, result, and lesson. When it is unavailable, use:

```text
Choose a real example from your work, study, volunteering, or project experience where you [relevant action].
Situation: [What was happening and why it mattered]
Task: [Your actual responsibility]
Action: [What you personally did using this skill]
Result: [Observed outcome, metric, or lesson]
Role relevance: [How it prepares you for this job requirement]
```

Never turn a prompt into a claim that the learner has not supported.

## Retention Pattern

End each topic with:

- **Common misconceptions:** state the tempting but wrong belief, why it fails, and the correction.
- **Flashcards:** ask about terms, decision rules, failure signals, and trade-offs; give concise answers.
- **Final revision summary:** list the few concepts, procedures, checks, and judgment calls to revisit before an interview or test.
- **Exit criteria:** use specific `I can...` statements tied to an explanation, deliverable, timed task, or interview answer.

Use retrieval and application, not rereading alone. After the learner completes the lesson, have them explain the workflow without notes, repeat a reduced-time practice task, and repair the weakest rubric criterion.

## Optional Reference Pattern

Put references last, after the lesson is complete.

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| [Provider] | [Title and URL] | Free / free with account / paid | Verify a current detail, explore a variant, or get extra practice. |

Use current sources to improve accuracy, but never write “see the link to learn this” for material the guide is expected to teach.
