# Product Discovery and Technical Planning for FormSG

## Role Relevance and Outcomes

- **Evidence:** You will work with PMs, designers, and public officers; translate messy problems into a scoped technical plan; think in product outcomes.
- **Outcome:** Turn a stakeholder need into a bounded, measurable, security-aware plan rather than a premature implementation.
- **Definitions:** A *problem statement* names user and harm; an *outcome* is an observable change; an *RFC* explains a material decision, alternatives, and risks.

## Beginner Foundations

### Plain-Language Explanation

Senior product work starts by discovering the actual problem. “Build respondent invitations” may conceal needs about accountability, deadlines, privacy, existing agency workflow, and support. A good technical plan makes these assumptions visible before committing to a database/API/UI shape.

### Glossary

- **User journey:** steps a person takes to reach an outcome.
- **Constraint:** non-negotiable boundary such as security, policy, time, or existing integration.
- **Success metric:** signal showing the intended outcome changed.
- **Non-goal:** explicitly excluded scope that prevents accidental expansion.

### Core Concepts and How They Connect

Frame: user/actor → current pain → desired outcome → constraints → evidence/metric → options/trade-offs → smallest safe experiment → rollout/learning. Include security and operational constraints at discovery, not after a prototype proves popular.

### Worked Example: Delegated Completion

**Problem:** A form owner waits for colleagues to provide sections and manually consolidates responses.  
**Outcome:** Owner can request and track section completion without exposing other responses.  
**Non-goal:** General workflow automation.  
**Success:** completion time and owner follow-up burden improve without unauthorised-access events.  
**Open questions:** recipient identity, agency policy, expiry, edits after completion, support/recovery, mobile/accessibility.

### Beginner Check With Answer Key

**Check:** Why is “ship the feature in two weeks” not a success metric?  
**Answer:** It measures activity, not whether the feature solves the user problem safely or is adopted correctly.

## Intermediate Application

### Role Workflow

1. Speak to representative users/stakeholders and map current journey.
2. Separate facts, assumptions, decisions, and unknowns.
3. Define security/data constraints and a measurable outcome.
4. Compare at least two feasible options with cost, risk, and reversibility.
5. Write a decision/RFC, prototype the riskiest assumption, and plan staged delivery.

### Guided Role Scenario

Public officers request “send a link to collaborators.” Ask whether a collaborator must authenticate, whether a forwarded link is allowed, which answers they may see, when access expires, and how the owner knows completion. These questions determine the product and security model; do not begin with an email API.

### Practice Task

Draft a one-page RFC outline for delegated completion.

### Model Answer or Completed Example Solution

Include context/outcome/non-goals; actors/data policy; flow; options (authenticated recipient vs controlled link); chosen option and reasons; data/API/UI changes; rollout/metrics; risks/open questions; decision owners. It is complete when a reviewer can challenge assumptions and test the decision.

### Troubleshooting and Common Failure Modes

| Symptom | Cause | Correction |
|---|---|---|
| Scope grows endlessly | No explicit outcome/non-goals | Reframe and sequence follow-ups |
| Prototype creates security debt | Constraints deferred | Include threat/data review at discovery |
| Stakeholders reject delivery | Assumptions untested | Validate workflow with users early |

## Advanced Judgment

Product outcome does not override security or reliability; it gives trade-offs a concrete purpose. Prefer reversible steps when uncertainty is high. Senior ownership means making an unpopular constraint explicit, presenting options, and recording the decision—not quietly building a brittle “quick win.”

**Case:** The fastest option is unauthenticated share links. Present the adoption benefit, forwarding/revocation risk, alternative authenticated experience, and decision owner. Recommend a narrow pilot only if risk posture and monitoring support it.

## Practical Deliverable

- **Instructions:** Write the capstone RFC (2–3 pages).
- **Expected artifact:** Problem/outcome, actors, metrics, non-goals, options, recommendation, security/operations, rollout.
- **Quality criteria:** Clear facts vs assumptions; user and technical evidence; trade-offs recorded.

## Timed Assessment

**Format:** 45-minute product/system-design case. **Prompt:** Scope a multi-respondent workflow from a one-sentence stakeholder request.  
**Model answer:** Clarify journey/policy/data, define success/non-goals, compare options, select a staged safe plan and measures.

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Discovery | Targeted questions and assumptions | Generic questions | Jumps to solution |
| Outcome | Measurable/user-centred | Feature list | No success definition |
| Senior judgment | Options, risk, staged plan | One design | Ignores security/ops |

**Bands:** Ready 8–10; Developing 5–7; Foundation needed below 5.

## Interview and Evidence Preparation

**Question:** “How do you scope an ambiguous problem?”  
**Model answer:** “I map actors and current journey, separate facts from assumptions, define outcome/constraints/non-goals, compare options, validate the riskiest assumption, then write a decision and staged delivery plan.”

**Truthful evidence prompt:** Select a real ambiguous task. Explain the questions you asked, an assumption you changed, and the actual result.

## Retention and Exit Criteria

- **Misconception:** “Product thinking means always saying yes to the request.” Correction: it means solving the underlying outcome within real constraints.
- **Flashcard:** What is a non-goal for? **Answer:** To prevent unowned scope and clarify a release boundary.
- **I can:** turn a stakeholder request into a measurable, security-aware RFC.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| OGP | [FormSG job posting](https://careers.open.gov.sg/o/senior-software-engineer-formsg) | Free, accessed 20 June 2026 | Re-check role-specific product and collaboration signals. |
