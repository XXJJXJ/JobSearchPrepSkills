# CI/CD for a FormSG Senior Software Engineer

## Role Relevance and Outcomes

- **Evidence:** CI/CD familiarity is explicitly required; the role ships and operates features.
- **Outcome:** Define a release path that gives fast feedback and prevents unsafe production changes.
- **Definitions:** *Continuous integration (CI)* validates changes frequently; *continuous delivery/deployment (CD)* automates preparation/release; a *quality gate* is a condition required before promotion.

## Beginner Foundations

### Plain-Language Explanation

CI/CD turns a reviewed change into a repeatable, observable release. The goal is a short, trustworthy feedback loop with a safe way to stop or reverse a bad change—not maximal automation.

### Glossary

- **Artifact:** immutable build output promoted through environments.
- **Canary:** small initial exposure before wider release.
- **Feature flag:** controlled runtime enablement separate from deployment.
- **Rollback:** return to a safe state; data changes may need a forward-fix plan.

### Core Concepts and How They Connect

Typical gates are format/type/lint, unit tests, dependency/security checks, immutable build, integration/contract tests, staging smoke tests, and progressive production health verification. Store credentials as short-lived, least-privileged secrets; never ship production credentials in source or configuration.

### Worked Example: Invite-Feature Pipeline

On each pull request: type-check, test authorisation denials, scan dependencies, build an immutable artifact, and execute API contract tests. On protected merge: deploy pre-production, run smoke tests, then expose a small cohort behind a flag. Promote only while agreed error/SLO thresholds stay healthy.

### Beginner Check With Answer Key

**Check:** Why is a successful build insufficient release evidence?  
**Answer:** It does not prove deployed configuration, permissions, migration compatibility, dependency behaviour, or user-critical outcomes are safe.

## Intermediate Application

### Role Workflow

1. Identify risks and the cheapest test layer that catches each.
2. Make tests deterministic and failure output actionable.
3. Build once and promote the same artifact with version/config provenance.
4. Use staged rollout plus explicit health and rollback criteria.
5. Review pipeline permissions and secrets like production code.

### Guided Role Scenario

An API change adds a required client field. CI should catch old-client failure. Usually add optional/server-default behaviour first, deploy compatible versions, measure adoption, then remove old paths in a planned migration.

### Practice Task

Write gates and rollback conditions for a final-submission change.

### Model Answer or Completed Example Solution

Gates: typed/unit tests; integration tests for idempotent retry and denied authorisation; migration rehearsal; staging smoke; dependency scan. Roll back or halt promotion when final-submit error SLI exceeds the agreed threshold or unknown outcomes rise. Preserve data/idempotency compatibility so rollback does not create duplicate effects.

### Troubleshooting and Common Failure Modes

| Symptom | Cause | Correction |
|---|---|---|
| Pipeline bypassed often | Slow/flaky/low-signal gates | Fix determinism and parallelise; do not normalise bypass |
| Rollback fails | Migration/config not reversible | Expand-contract migration, flags, forward-fix plan |
| Deployment credential overpowered | Convenience permissions | Scope short-lived identity to environment/action |

## Advanced Judgment

Fast delivery and strong controls align when feedback is reliable. Manual approval for every change may hide weak automation; automatic unobservable database changes are equally poor. A feature flag needs ownership, expiry, test coverage, and removal.

**Case:** For an incident hotfix, use the controlled pipeline where possible: narrowly scoped change, expedited documented approval, canary/health validation, then follow-up—not a permanent production-shell workaround.

## Practical Deliverable

- **Instructions:** Draw the capstone pipeline from PR to rollout.
- **Expected artifact:** Gates, identity/secrets, artifact, environments, observability, rollback, and flag lifecycle.
- **Quality criteria:** Tests correspond to risks; deploy is traceable; migration and rollback are addressed.

## Timed Assessment

**Format:** 30-minute release-design task. **Prompt:** Propose CI/CD for an API and Mongo index change.  
**Model answer:** Validate code/contracts, rehearse index/migration impact, build an immutable artifact, deploy progressively, monitor query/submit SLO, and use compatibility-aware rollback.

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Risk gates | Specific and proportionate | Build/test only | No validation |
| Rollout | Observable staged promotion | “Deploy then watch” | No rollback |
| Supply chain | Least privilege/provenance | Mentions secrets | Permissions ignored |

**Bands:** Ready 8–10; Developing 5–7; Foundation needed below 5.

## Interview and Evidence Preparation

**Question:** “How do you ship quickly without breaking things?”  
**Model answer:** “I reduce batch size, automate high-signal checks, keep artifacts/provenance clear, deploy progressively, and predefine health/rollback decisions. Speed comes from trustworthy feedback, not skipping it.”

**Truthful evidence prompt:** Describe a release process you used or designed; identify the actual check, rollout, and recovery mechanism.

## Retention and Exit Criteria

- **Misconception:** “CD means deploy every merge to everyone.” Correction: delivery policy can use environments, cohorts, approvals, and flags.
- **Flashcard:** Why build once? **Answer:** To promote the same tested artifact and preserve provenance.
- **I can:** propose a pipeline that tests a risky feature and safely promotes or halts it.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| GitHub | [GitHub Actions documentation](https://docs.github.com/en/actions) | Free, accessed 20 June 2026 | Current workflow syntax and deployment capabilities. |
