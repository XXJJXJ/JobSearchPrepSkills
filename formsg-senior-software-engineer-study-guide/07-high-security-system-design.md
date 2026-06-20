# High-Security System Design for FormSG

## Role Relevance and Outcomes

- **Evidence:** High-security-system experience is a strong plus; FormSG handles classified government data with end-to-end encryption.
- **Outcome:** Lead security design through questions, documented assumptions, and operationally credible controls.
- **Definitions:** A *security architecture* defines controls and boundaries across the system; *defence in depth* uses independent layers so one failure is not total compromise.

## Beginner Foundations

### Plain-Language Explanation

High security is not a product label. It means the consequences of unauthorised access, alteration, or loss are significant enough that design, implementation, operation, audit, and recovery must all be intentional. “End-to-end encryption” must be defined by a specific endpoint and key model, not assumed from the job wording.

### Glossary

- **Confidentiality / integrity / availability:** prevent unauthorised disclosure, alteration, and loss of service.
- **Blast radius:** the scope of harm if a control or credential fails.
- **Separation of duties:** prevent one identity/process from having unnecessary combined power.
- **Key rotation:** replacing cryptographic key material under a controlled policy.

### Core Concepts and How They Connect

Layer identity, authorisation, encryption, input/output control, network/service boundaries, audit, monitoring, backup/recovery, and incident response. Each must have an owner and evidence. A secure system that cannot be patched, investigated, or recovered is incomplete.

### Worked Example: Encryption Clarification

For a sensitive form field, ask: who creates it; which client/service can read plaintext; whether agencies, OGP operators, or support may decrypt; where keys are stored; how revocation and recovery work; and what metadata remains visible. Only then select a vetted encryption/service pattern and document residual risk.

### Beginner Check With Answer Key

**Check:** Why is “we encrypt at rest” insufficient for this role’s context?  
**Answer:** It says little about transport, application access, key authorisation, audit, backups, or who may decrypt. It is one layer in a broader threat model.

## Intermediate Application

### Role Workflow

1. Write system/data-flow diagram with assets and trust boundaries.
2. Classify data and identify allowed readers/writers/administrators.
3. Propose controls per threat, including how they are configured, tested, monitored, and recovered.
4. Record decisions, assumptions, and owners in an ADR/RFC.
5. Rehearse a compromise/incident and revise from findings.

### Guided Role Scenario

An agency asks for a support workflow to recover a locked-out form owner. A strong design does not give support blanket read access to submissions. It defines an identity-verification flow, limited recovery permission, approval/audit requirements, expiration, and an escalation path for exceptional access.

### Practice Task

For delegated completion, list three controls that reduce blast radius if an invite service credential is compromised.

### Model Answer or Completed Example Solution

1. Give the credential only invite-scoped actions and no raw-submission read/decrypt permission.
2. Scope each token/action to form response, recipient, expiry, and environment; monitor anomalous issuance/use.
3. Support rapid rotation/revocation and protect keys/secrets in a managed access boundary; test the rotation path.

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| “Secure” design cannot state plaintext locations | Vague encryption claim | Data-flow diagram | Document and minimise plaintext boundaries |
| Break-glass access becomes normal | No expiry/review | Audit trail | Time-bound approvals and periodic review |
| Security change causes outage | No recovery/rollout test | Key/config change plan | Staged rollout, rollback, rotation rehearsal |

## Advanced Judgment

Security and operability are coupled. Key rotation, audit review, incident containment, backups, and migration are production features. A senior engineer makes unresolved security requirements visible early and avoids asserting a cryptographic implementation beyond their evidence. If security requirements conflict with product needs (for example server-side search versus strong confidentiality), present options and decision owners rather than silently weakening either.

**Case:** A proposal lets any backend service decrypt any response because all services are “internal.” Reject broad trust. Define service identity, least-privileged decryption grants, auditable purpose, network and deployment boundaries, and how a compromised service is contained.

## Practical Deliverable

- **Instructions:** Write a two-page security architecture decision record for capstone data protection.
- **Expected artifact:** Context, threat model, chosen boundary, alternatives, key/access assumptions, operational controls, residual risk.
- **Quality criteria:** No invented FormSG internals; assumptions marked; controls are testable and operable.

## Timed Assessment

**Format:** 50-minute system-design discussion.  
**Prompt:** “Design secure delegated access to part of a submission.”  
**Model answer:** Clarify actors/data/classification first; use scoped server-enforced permission, expiry/revocation, audit, purpose-specific responses, and an explicit encryption/key model. Describe failure/recovery and trade-offs.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Assumptions | Clarifies threat model before selecting controls | Some questions | Invents architecture |
| Depth | Identity, policy, key, audit, recovery connected | Controls listed separately | “Encrypt it” only |
| Judgment | Trade-offs and residual risk explicit | One option | False certainty |

**Bands:** Ready: 8–10; Developing: 5–7, practise architecture/risk articulation; Foundation needed: below 5.

## Interview and Evidence Preparation

**Question:** “What would you do if you lacked prior classified-system experience?”  
**Model answer:** “I would not overclaim it. I would start from the data classification and threat model, use approved architecture and cryptographic services, seek security review early, make assumptions explicit, and take operational controls—keys, access, audit, recovery—as part of the delivery.”

**Truthful evidence prompt:** State a security boundary you have designed, reviewed, or practised; if it was academic, label it as such and explain the feedback you would seek in production.

## Retention and Exit Criteria

- **Misconception:** “Internal services are automatically trusted.” Correction: compromise and misuse still require service identity and least privilege.
- **Flashcard:** What does defence in depth seek? **Answer:** Independent layers that limit harm when one control fails.
- **Revision summary:** Clarify data/key boundaries, reduce blast radius, document assumptions, and operate the controls.
- **I can:** run a credible security-design conversation without inventing cryptography or infrastructure details.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| OWASP | [Developer Guide](https://owasp.org/www-project-developer-guide/assets/exports/OWASP_Developer_Guide.pdf) | Free, accessed 20 June 2026 | Additional secure-design and verification material. |
