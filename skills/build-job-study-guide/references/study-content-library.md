# Content-First Teaching Library

Use these patterns to write complete lessons. Adapt the nouns, data, risks, and decisions to the target role; do not output empty template headings.

## 1. Explain a Concept Before Applying It

Use this ladder for each concept a beginner needs:

1. **Purpose:** Name the real problem the concept solves for this role.
2. **Plain definition:** Explain it without relying on another undefined term.
3. **Parts:** Define inputs, outputs, states, actors, and data involved.
4. **Mechanism:** Trace what happens in order and why each step matters.
5. **Decision rule:** State when to choose, reject, or escalate it.
6. **Boundary:** State what the concept does not guarantee and the companion control it needs.

Before an example, list the terms it uses. Explain code or formal notation immediately after the relevant line, rather than assuming the learner can infer it.

## 2. Guided Baseline Worked Path

Use the first path to teach a normal, successful route.

```markdown
## Worked Path 1: Guided Baseline

**Goal:** [Role outcome.]  
**Starting state:** [What exists and what the learner knows.]  
**Inputs:** [Concrete values, data, or stakeholders.]  
**Constraints:** [Security, time, quality, or policy limits.]

### Step-by-step approach
1. **[Action]** — What happens, why it is first, and what input/output changes.
   **Check:** [Observable confirmation.]
2. **[Action]** — Explain the mechanism and decision rule.
   **Check:** [Observable confirmation.]

### Completed result
[Complete code, query, decision record, message, or diagram.]  

### Why this works
[Trace the result back to the mechanism and role outcome.]  

### Verify it
[Exact expected output, test, review question, or observable user outcome.]
```

For technical work, include runnable or internally consistent code/data plus its expected result. For non-technical work, include the full finished artefact and commentary that identifies each effective choice.

## 3. Failure, Edge Case, or Trade-off Worked Path

Use the second path to make limits and diagnostics teachable.

```markdown
## Worked Path 2: Failure, Edge Case, or Trade-off

**Scenario:** [Concrete variation from the baseline.]  
**Observed symptom:** [What user/system/stakeholder sees.]  
**Failure mechanism:** [Why the baseline no longer works.]

### Diagnose
1. [First signal to inspect and why.]
2. [How the evidence distinguishes credible causes.]

### Correct or choose an alternative
[Complete corrected implementation or decision.]  

### Verify and prevent recurrence
[Expected result, test/monitor/control, and prevention habit.]
```

Do not call a generic warning an edge case. Show the changed input or constraint, the causal mechanism, and the corrected outcome.

## 4. Intermediate Practice and Solution

Every task must be independently executable.

```markdown
### Practice Task: [Role Scenario]

**Starting material:** [Data, code, brief, table, or explicit placeholders.]  
**Task:** [Exact deliverable.]  
**Method:** [Steps the learner should follow.]  
**Constraints:** [Time, data, security, scope, quality.]  
**Verification:** [How the learner checks correctness.]  
**Success criteria:** [Observable requirements.]

### Completed Solution With Reasoning
1. [Decision/action and why it meets the criterion.]
2. [Completed artefact or relevant excerpt, annotated.]
3. [Verification result and what a different result means.]
```

Use open-ended rubrics only when more than one result is valid. State what weak work misses and how to repair it.

## 5. Advanced Decision Record

Use this structure whenever the role needs judgment rather than a fixed procedure.

```markdown
### Advanced Role Case and Decision Record

**Facts:** [Verified facts.]  
**Assumptions:** [Unknowns treated as assumptions.]  
**Decision:** [What must be chosen and by whom.]

| Option | Benefits | Costs and risks | Best when |
|---|---|---|---|
| A | | | |
| B | | | |

**Selection criteria:** [Prioritised criteria and thresholds.]  
**Recommended decision:** [Option and reasoning tied to facts.]  
**Consequences:** [What becomes harder, slower, riskier, or deferred.]  
**Residual risk and control:** [What remains and how it is observed.]  
**Revisit when:** [New evidence that would change the decision.]
```

An advanced explanation succeeds only when the learner can explain why a plausible alternative loses under the stated constraints.

## 6. Non-Technical Role Artefacts

Teach product, communication, leadership, and operations with completed outputs, not slogans.

| Competency | Completed artefact to teach from | Commentary must explain |
|---|---|---|
| Product discovery | Interview notes and problem statement | Evidence, assumptions, non-goals, success measure |
| Technical planning | RFC or decision record | Options, decision owner, risks, rollout, reversal |
| Stakeholder communication | Status update or launch brief | Audience, decision/action, known/unknown facts, next step |
| Incident response | Incident update and runbook step | Impact, scope, safe mitigation, escalation, follow-up |
| Code review | Review comments and PR summary | Severity, evidence, requested change, verification |

Show a weak version only when it helps explain a concrete correction. Never ask the learner to “communicate clearly” without showing a complete message and why its wording is appropriate.

## 7. Retention and Assessment

Use flashcards for terms, decision rules, failure signals, and trade-offs. Make every exit criterion observable: “I can construct an access-policy table for a supplied scenario and explain one denied path,” not “I understand access control.”

Timed assessments need the same starting materials and full solution as ordinary practice, plus an explicit time limit, rubric, readiness bands, and remediation that points to a named concept or worked path.

## 8. Optional References

Place references last. A reference may verify current tool behaviour, add variants, or offer extra practice. If removing it leaves the learner unable to perform a required procedure, move that explanation into the lesson.
