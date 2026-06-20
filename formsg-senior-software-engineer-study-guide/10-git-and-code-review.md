# Git Workflows and Code Review for FormSG

## Role Relevance and Outcomes

- **Evidence:** The posting names Git workflows and code reviews as a way to improve the team.
- **Outcome:** Make changes understandable, reviewable, recoverable, and connected to product/security risk.
- **Definitions:** A *pull request (PR)* proposes a scoped change; a *code review* checks correctness, maintainability, risk, and shared understanding; an *RFC* records a larger decision before implementation.

## Beginner Foundations

### Plain-Language Explanation

Git preserves history, but a useful workflow makes intent inspectable. Small commits and PRs give reviewers a safe unit for reasoning about permissions, data changes, tests, rollout, and rollback. Review is a control and a knowledge-sharing mechanism, not approval theatre.

### Glossary

- **Atomic commit:** one coherent change that can be understood/reverted.
- **Protected branch:** branch with required review/check policy.
- **Blocking comment:** issue that must be resolved because it risks correctness, security, or maintainability.
- **RFC:** document for a material cross-system or cross-team decision.

### Core Concepts and How They Connect

A strong PR explains outcome, constraints, scope, test evidence, security/data impact, migration, rollout/rollback, and follow-ups. Reviewers ask what can go wrong and whether evidence supports the decision. Separate unrelated refactors from sensitive changes so review risk stays bounded.

### Worked Example: Review Comment

> **Blocking:** This handler checks `actor.role === 'owner'` but does not prove the actor owns this response. A caller could change the response ID. Enforce actor-to-response relationship in the service and add a negative integration test.

This identifies risk, missing condition, and testable correction.

### Beginner Check With Answer Key

**Check:** Why not put a schema migration, UI redesign, and unrelated refactor in one PR?  
**Answer:** It expands cognitive load and makes it difficult to isolate risk, test evidence, rollback, or a defect.

## Intermediate Application

### Role Workflow

1. Start a branch/PR with a narrow outcome and decision context.
2. Commit logical slices; exclude secrets and generated noise.
3. Run/report relevant checks, including negative/security paths.
4. Request domain/security-aware reviewers; respond with evidence.
5. Merge only with rollout/rollback ownership and follow through on deferrals.

### Guided Role Scenario

A delegated-invites PR should state policy, expiry/revocation, data fields, logs/metrics, cross-response denial tests, migration safety, and rollout flag. “Adds invites” is not senior-grade review context.

### Practice Task

Write three review comments for a PR that logs the full request body, returns raw database records, and lacks retry tests for a submit endpoint.

### Model Answer or Completed Example Solution

Flag each as blocking with consequence and correction: redact/allowlist logs; return a caller-authorised response DTO; add idempotent concurrent-retry integration test. Ask for evidence rather than blindly rewriting the author’s code.

### Troubleshooting and Common Failure Modes

| Symptom | Cause | Correction |
|---|---|---|
| Review latency is high | PR too large/unclear ownership | Split change; add context and reviewers early |
| Comments become personal | Style/policy not separated from risk | State impact, standard, desired outcome |
| Merge breaks production | PR lacked rollout ownership | Require change plan and post-deploy verification |

## Advanced Judgment

Senior review calibrates severity. Block data leakage, broken authorisation, unsafe migration, and unproven critical behaviour. Do not block a harmless naming preference where a follow-up or formatter is better. An RFC is appropriate when a decision changes a system boundary, operational model, or cross-team contract.

**Case:** Resolve embed-versus-reference disagreement with access patterns, sensitivity, cardinality, migration cost, and operational evidence; record the decision for future engineers.

## Practical Deliverable

- **Instructions:** Create a PR template and simulated review for the capstone.
- **Expected artifact:** PR description plus five comments labelled blocking/non-blocking/question.
- **Quality criteria:** Comments are factual, risk-based, specific, and propose verification.

## Timed Assessment

**Format:** 30-minute code-review exercise. **Prompt:** Review a sensitive API change.  
**Model answer:** Prioritise authz, input/output data, idempotency, tests, and rollout; distinguish must-fix from improvement.

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Risk priority | Finds high-impact defects first | Style-heavy review | Misses security/correctness |
| Communication | Clear rationale/correction | Vague comment | Personal/ambiguous |
| Delivery | Asks for evidence/plan | Tests mentioned | No rollout awareness |

**Bands:** Ready 8–10; Developing 5–7; Foundation needed below 5.

## Interview and Evidence Preparation

**Question:** “What makes a code review valuable?”  
**Model answer:** “It makes risk and decisions inspectable, catches defects before production, and transfers context. I focus comments on correctness, security, operational change, and evidence—not preference policing.”

**Truthful evidence prompt:** Recall a review you gave or received. State the actual issue, decision, and outcome without claiming ownership of another person’s work.

## Retention and Exit Criteria

- **Misconception:** “Approval means review succeeded.” Correction: review succeeds when material risk is understood, tested, and owned.
- **Flashcard:** When is an RFC useful? **Answer:** When a change affects a substantial cross-team/system/operational decision.
- **I can:** write a security-relevant PR description and review it proportionately.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| GitHub | [About pull-request reviews](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews) | Free, accessed 20 June 2026 | Current review mechanics; the lesson covers judgment. |
