# Stakeholder Communication for FormSG

## Role Relevance and Outcomes

- **Evidence:** The role requires clear communication and the ability to explain a technical plan to non-technical people.
- **Outcome:** Communicate decisions, risk, progress, and incident impact precisely enough for stakeholders to act.
- **Definitions:** A *stakeholder* is affected by or makes decisions about the work; a *decision record* captures choice and rationale; a *risk* is an uncertain event with consequence and response.

## Beginner Foundations

### Plain-Language Explanation

Clear communication is not simplifying away truth. It translates technical mechanism into user impact, decision, trade-off, evidence, and next action. For a government form platform, agency staff need to know what changes for their workflow and what they must do; engineers need the exact constraint and acceptance condition.

### Glossary

- **Audience:** who needs this message and what action they can take.
- **Decision needed:** the owner, choice, and deadline.
- **Status:** current evidence, not optimistic activity.
- **Escalation:** raise a blocked/high-impact decision to the person able to resolve it.

### Core Concepts and How They Connect

Use a layered message: headline/outcome first; then facts and decision; then technical detail and risk. Separate confirmed facts from assumptions. State uncertainty and owner rather than hiding it. Written plans, RFCs, PRs, release notes, and incident updates should tell the same coherent story at different depth.

### Worked Example: Plain-Language Decision Brief

**Headline:** “We recommend authenticated delegated access rather than forwardable links.”  
**Why:** “It lets a form owner request a section while limiting access to the intended colleague and allowing revocation/audit.”  
**Trade-off:** “It adds a sign-in step; we will test whether it prevents completion.”  
**Decision needed:** “Agency policy owner to confirm recipient identity requirement by Friday.”

### Beginner Check With Answer Key

**Check:** What is wrong with “we need more time because the backend is complex”?  
**Answer:** It supplies no user impact, specific risk, options, evidence, or decision. Name the dependency/constraint, consequence, recovery options, and requested owner action.

## Intermediate Application

### Role Workflow

1. Identify audience, desired action, and decision owner.
2. Lead with outcome/status and material change.
3. Explain only the mechanism needed to understand the choice.
4. State risk, uncertainty, options, recommendation, and deadline.
5. Record decision and update affected implementation/release documents.

### Guided Role Scenario

During a release, invitation delivery is delayed but submissions remain intact. Tell public officers: who is affected, what they can do now, what is confirmed, next update time, and support channel. Tell engineers: correlation/metric, scope, mitigation, owner, and rollback threshold. Do not send either audience the other’s raw diagnostics.

### Practice Task

Write a 120-word update to a non-technical agency owner about pausing an invite rollout because authorisation-denial rate increased.

### Model Answer or Completed Example Solution

“We have paused the new invitation feature for newly selected users after seeing more access denials than expected. Existing form responses and submissions are unaffected. We are checking whether the issue is limited to a configuration or indicates a workflow mismatch; we will not expand access while that is unresolved. Your teams do not need to take action today. We will provide a confirmed update by [time], including whether we will resume, revise the workflow, or keep the feature disabled. Please route affected-user examples through [approved support channel], without including form answers.”

### Troubleshooting and Common Failure Modes

| Symptom | Cause | Correction |
|---|---|---|
| Stakeholder surprises late | Decision/owner never explicit | Add decision and deadline to brief |
| Technical plan misunderstood | Mechanism before outcome | Lead with user impact and recommendation |
| Incident update creates data risk | Raw logs/examples pasted | Use redacted identifiers and approved channel |

## Advanced Judgment

Do not use jargon to avoid accountability or false certainty to create confidence. A senior engineer can say “we do not yet know,” explain how uncertainty will be reduced, and recommend a safe interim action. Disagree respectfully by anchoring to user outcome, evidence, constraints, and trade-offs, not hierarchy.

**Case:** A stakeholder asks for an exception to security policy to meet a deadline. Explain the harm and blocked requirement, offer safe narrower options, name the accountable policy owner, and record the decision. Do not make unilateral policy exceptions.

## Practical Deliverable

- **Instructions:** Produce the capstone’s RFC summary, release note, and incident update for three audiences.
- **Expected artifact:** Three concise messages with consistent facts but appropriate depth.
- **Quality criteria:** Each has audience/action/decision; facts and assumptions separated; no sensitive data.

## Timed Assessment

**Format:** 25-minute writing/role-play task. **Prompt:** Explain a security-driven rollout pause to an agency owner.  
**Model answer:** State impact, safe current action, known/unknown facts, next update, and decision path in plain language.

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Clarity | Outcome/action/owner explicit | Understandable but vague | Jargon or no request |
| Accuracy | Facts vs uncertainty/risk | Overconfident | Misleading claim |
| Data care | Redacted, appropriate channel | Some detail | Sensitive details exposed |

**Bands:** Ready 8–10; Developing 5–7; Foundation needed below 5.

## Interview and Evidence Preparation

**Question:** “How do you explain a technical trade-off to a non-technical user?”  
**Model answer:** “I start with their outcome and the decision. I explain the relevant risk in plain language, compare practical options, make my recommendation and its consequence explicit, then confirm the action/owner.”

**Truthful evidence prompt:** Describe a real time you adjusted a technical explanation for a different audience and what decision or outcome followed.

## Retention and Exit Criteria

- **Misconception:** “Clear communication means no technical detail.” Correction: it means the right detail for a decision.
- **Flashcard:** What should every decision brief name? **Answer:** Outcome, evidence, options, recommendation, owner, deadline.
- **I can:** write a trustworthy stakeholder update without overclaiming or leaking sensitive information.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| OGP | [FormSG job posting](https://careers.open.gov.sg/o/senior-software-engineer-formsg) | Free, accessed 20 June 2026 | Re-check role-specific communication expectations. |
