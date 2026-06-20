# Senior End-to-End Delivery in Ambiguity for FormSG

## Role Relevance and Outcomes

- **Evidence:** The role owns features from “we should build this” to live service; OGP values fast iteration and comfort with ambiguity.
- **Outcome:** Lead a small, safe delivery from discovery through operation while improving team practices.
- **Definitions:** *Ownership* includes outcome after launch; *ambiguity* is missing/competing information; *iteration* is learning and improving after release.

## Beginner Foundations

### Plain-Language Explanation

Senior ownership is not doing every task. It is creating enough clarity that the right people can decide, build, verify, ship, operate, and learn. The role expects a bias to build, but the job explicitly balances that with security and reliability.

### Glossary

- **Risk register:** concise list of uncertainty, consequence, owner, mitigation.
- **Milestone:** evidence-based checkpoint, not a date-only promise.
- **Rollout:** controlled increase in real-user exposure.
- **Retrospective:** review of outcome and process to make future delivery better.

### Core Concepts and How They Connect

Use a delivery loop: discover → frame outcome/constraints → make technical decision → slice a minimum safe increment → implement/review/test → staged rollout → observe/support → measure outcome → iterate/share learning. Keep a decision/risk log so ambiguity becomes owned work rather than hidden delay.

### Worked Example: First Delegated-Completion Increment

Rather than build a general collaboration platform, deliver a narrow increment: one owner may invite one authenticated colleague to complete one bounded section; expiry/revocation and audit are supported; measure owner completion time and error rate. Explicitly defer multiple collaborators, arbitrary links, and workflow automation. This reduces security and product uncertainty while producing real feedback.

### Beginner Check With Answer Key

**Check:** Is rapid prototyping a reason to skip monitoring?  
**Answer:** No. A prototype exposed to real users needs proportionate safety, observability, and a stop/rollback condition; otherwise it cannot teach reliable lessons.

## Intermediate Application

### Role Workflow

1. Establish problem, user outcome, constraints, decision owners, and unknowns.
2. Split work into a smallest safe/reversible increment and define exit/rollout metrics.
3. Align PM/design/engineering/security/operations early through an RFC or equivalent.
4. Maintain risk, dependencies, and decision records; unblock through options, not vague escalation.
5. Ship, observe, support, measure, and turn findings into code/docs/tests/runbooks/knowledge sharing.

### Guided Role Scenario

The product lead wants payments, AI form creation, and multi-respondent flow in one quarter. A senior engineer decomposes by user value, security/data boundaries, external dependencies, and reversibility. Propose a sequence and call out decisions that cannot be safely compressed, rather than accepting an undifferentiated deadline.

### Practice Task

Create a delivery plan for delegated completion with five milestones and one risk/metric each.

### Model Answer or Completed Example Solution

1. Validate workflow/policy with agencies—risk: wrong recipient model; metric: research agreement.  
2. Threat model/RFC—risk: unresolved access boundary; metric: decision owners signed off.  
3. Vertical slice behind flag—risk: integration defect; metric: contract/e2e pass.  
4. Limited rollout—risk: user failure/denials; metric: completion/error SLO.  
5. Expand/iterate—risk: operational load; metric: support volume and journey outcome.

### Troubleshooting and Common Failure Modes

| Symptom | Cause | Correction |
|---|---|---|
| “Blocked” for days | Unknown has no owner/decision | Write options, decision owner, deadline |
| Fast release creates cleanup debt | No scope/flag/exit boundary | Narrow increment and schedule removal/follow-up |
| Team repeats incident | Learning remains verbal | Convert finding to test, runbook, alert, RFC, or policy |

## Advanced Judgment

The key senior trade-off is speed of learning versus cost of harm. Choose experiments that are observable, reversible, and limited in data/actor exposure. Lead without authority by making evidence and alternatives easy to evaluate. Improve the system around the work—review standards, RFC templates, monitoring, test practice—when the recurring issue materially affects delivery.

**Case:** A deadline conflicts with a missing authorisation decision. Recommend pausing exposure of the sensitive path, deliver safe independent work, surface business options, and document the accountable decision. Shipping an unbounded exception is not ownership.

## Practical Deliverable

- **Instructions:** Write your end-to-end capstone narrative and delivery plan.
- **Expected artifact:** Problem, choices, milestones, collaboration map, metrics, rollout/incident response, result/next iteration.
- **Quality criteria:** Distinguishes your action from team action; demonstrates user outcome, security, operations, and learning honestly.

## Timed Assessment

**Format:** 45-minute behavioural/system-design case. **Prompt:** “A stakeholder gives a vague urgent request affecting sensitive submissions. What do you do?”  
**Model answer:** Clarify outcome/constraints/owners, identify risk, slice a safe increment, make decisions visible, deliver with staged rollout/metrics, and communicate learning.

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Ownership | Discovery through operation and learning | Implementation plan only | Waits for complete spec |
| Judgment | Reversible, safe prioritisation | Generic agile terms | Speed over safety |
| Leadership | Clear decisions/communication/team leverage | Individual heroics | No collaboration |

**Bands:** Ready 8–10; Developing 5–7; Foundation needed below 5.

## Interview and Evidence Preparation

**Question:** “Tell me about owning an ambiguous feature end to end.”  
**Model answer structure:** State the user/problem and constraints; explain the uncertainty and options; describe your direct decisions/actions; give delivery/rollout evidence; report result, limitation, and learning. Do not invent a production story—use work, study, volunteer, or project evidence truthfully.

**Truthful evidence prompt:** Write a STAR-plus-learning story from a real project. Include Situation, Task, your Action, Result, security/reliability decision, and what you changed afterward.

## Retention and Exit Criteria

- **Misconception:** “Ownership means personally implementing everything.” Correction: it means ensuring the outcome and risk are owned across the system.
- **Flashcard:** What makes an experiment safe? **Answer:** Bounded exposure, measurable hypothesis, reversal/stop condition, and appropriate controls.
- **Revision summary:** Create clarity, slice safely, ship observably, communicate decisions, and compound learning.
- **I can:** present a credible, truthful senior-delivery story that balances speed, user value, security, and reliability.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| OGP | [FormSG job posting](https://careers.open.gov.sg/o/senior-software-engineer-formsg) | Free, accessed 20 June 2026 | Ground the simulation in the role’s stated ownership and pace. |
