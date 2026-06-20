# Infrastructure as Code for FormSG

## Role Relevance and Outcomes

- **Evidence:** The posting requires IaC familiarity and says engineers help design and maintain infrastructure.
- **Outcome:** Manage infrastructure as reviewed, tested, versioned desired state rather than undocumented console actions.
- **Definitions:** *Infrastructure as code (IaC)* is declarative configuration for infrastructure; *desired state* is the intended resource configuration; *drift* is difference between desired and real state.

## Beginner Foundations

### Plain-Language Explanation

IaC makes infrastructure changes visible, repeatable, reviewable, and automatable. It should include least-privilege identities, environment boundaries, change plans, and secrets references—not secret values.

### Glossary

- **Plan:** proposed change before apply.
- **State:** tool record of managed resources; protect it because it may reveal sensitive metadata.
- **Module:** reusable, bounded infrastructure component.
- **Drift detection:** identify out-of-band changes.

### Core Concepts and How They Connect

Version infrastructure beside or through a controlled relationship with application changes. Validate formatting/policy/plan in CI; use separate environments/accounts/projects; restrict who may apply production changes; record provenance. Treat state and deployment identities as high-value security assets.

### Worked Example: Submission Service Change

A new background worker needs queue access. Add a module/input for the queue, grant the worker only send/receive actions it needs, output non-secret identifiers, review the plan, apply progressively, and verify queue lag/permissions. Do not use a broad shared production credential “to make it work.”

### Beginner Check With Answer Key

**Check:** Why is clicking the same cloud configuration manually not equivalent to IaC?  
**Answer:** The change is hard to reproduce, review, test, audit, compare across environments, and recover after personnel or incident changes.

## Intermediate Application

### Role Workflow

1. Define a small module boundary and required identity/data flows.
2. Use environment-specific inputs and no embedded secrets.
3. Run format/validate/policy/plan in CI; review the plan and blast radius.
4. Apply with limited production identity and capture version/provenance.
5. Verify behaviour, monitor drift, and document a reverse/forward recovery path.

### Guided Role Scenario

An index or queue configuration needs production change. A senior engineer checks capacity/security effect, rehearses in representative environment, stages application compatibility, observes after apply, and avoids treating infrastructure update as unrelated to the user journey.

### Practice Task

Describe an IaC module for an invite-worker queue: inputs, outputs, identity permissions, tests, and safe deletion/recovery rule.

### Model Answer or Completed Example Solution

Inputs: name, environment, retention/dead-letter policy, worker identity. Outputs: queue identifier/metrics handle, never secret. Permissions: worker limited to required actions; deployer limited to module/environment. Tests: plan/policy and integration smoke. Deletion: protect production data or explicitly retain/backup; remove only through approved lifecycle.

### Troubleshooting and Common Failure Modes

| Symptom | Cause | Correction |
|---|---|---|
| Production differs from config | Manual drift | Detect/import/reconcile; restrict console change |
| Apply has huge blast radius | Shared/global module change | Inspect plan; scope module/environment |
| State exposes secrets | Secret values/outputs stored | Use secret references; restrict/encrypt state |

## Advanced Judgment

IaC can make dangerous changes repeatable, so review and policy still matter. Immutable/replaceable infrastructure helps recovery but databases, keys, DNS, and access policies need explicit lifecycle handling. Do not couple application deployment and infrastructure apply so tightly that a partial failure becomes unrecoverable; model compatibility and sequencing.

**Case:** A resource rename forces replacement. Pause: identify stateful data, network/DNS cutover, credentials, consumers, downtime tolerance, and rollback. A clean plan output is not a safety proof.

## Practical Deliverable

- **Instructions:** Create an IaC change proposal for capstone queue/service identity.
- **Expected artifact:** Module interface, plan-review checklist, environment/policy controls, verify/recovery steps.
- **Quality criteria:** Least privilege, no secrets in code/state, blast radius and lifecycle addressed.

## Timed Assessment

**Format:** 30-minute systems-delivery task. **Prompt:** Review a plan that replaces a stateful resource.  
**Model answer:** Identify data/cutover impact, split migration, protect backups/identity, stage and observe; do not apply merely because syntax is valid.

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Safety | Lifecycle/blast radius explicit | Plan only | Applies blindly |
| Security | Least privilege and state protection | Secrets mentioned | Broad identities/embedded secret |
| Delivery | Environment/provenance/recovery | Generic rollback | No operational plan |

**Bands:** Ready 8–10; Developing 5–7; Foundation needed below 5.

## Interview and Evidence Preparation

**Question:** “What engineering benefit does IaC provide?”  
**Model answer:** “It converts infrastructure into a reviewable, repeatable, testable change with provenance. That improves consistency and recovery but does not eliminate the need to assess blast radius, access, data lifecycle, and rollout.”

**Truthful evidence prompt:** Use a real infrastructure lab, work change, or project. State what you configured, the access boundary, validation, and any limitation.

## Retention and Exit Criteria

- **Misconception:** “IaC means every apply is safe.” Correction: a valid declarative plan may still replace data or broaden access.
- **Flashcard:** What is configuration drift? **Answer:** Difference between real infrastructure and desired versioned configuration.
- **I can:** review an IaC plan for permission, state, lifecycle, and recovery risks.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| HashiCorp | [What is Terraform?](https://developer.hashicorp.com/terraform/intro) | Free, accessed 20 June 2026 | Concrete IaC tool/practice examples. |
| HashiCorp | [Use infrastructure as code](https://developer.hashicorp.com/well-architected-framework/define-and-automate-processes/define/as-code/infrastructure) | Free, accessed 20 June 2026 | IaC workflow and governance detail. |
