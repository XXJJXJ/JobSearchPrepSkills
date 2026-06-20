# Security, Access Control, and Data Protection for FormSG

## Role Relevance and Outcomes

- **Evidence:** The posting specifically names encryption, access control, data handling, classified data, and end-to-end encryption.
- **Outcome:** Use a threat model to choose defensible controls without treating security as a checklist.
- **Definitions:** *Authentication* establishes who or what is calling; *authorisation* decides what that identity may do; *encryption* protects data confidentiality using keys; *threat model* identifies assets, adversaries, trust boundaries, and mitigations.

## Beginner Foundations

### Plain-Language Explanation

Security begins by naming what must be protected and from whom. A form product may hold citizen answers, agency workflows, identifiers, and payment-related states. The design must control access, minimise data, protect it in transit and storage where applicable, and leave a safe audit trail without making logs another sensitive-data store.

### Glossary

- **Least privilege:** grant only the minimum access necessary for the task.
- **Trust boundary:** where data or control moves between parties/systems with different trust.
- **Key management:** creation, protection, rotation, access, and recovery rules for cryptographic keys.
- **Data minimisation:** collect, retain, and expose only what is necessary.

### Core Concepts and How They Connect

Authentication answers “who?”; authorisation answers “may they perform this action on this resource now?” Encryption does not fix over-broad access: an authorised decryption service can still reveal data to the wrong internal caller if its policy is wrong. Put authorisation near the resource/action, make decisions auditable, and use vetted cryptographic primitives/services rather than custom algorithms.

### Worked Example: Invite Access Check

Before a recipient opens an invited section: validate the invite token, resolve its response/form/version, confirm it is active and unexpired, confirm the authenticated recipient (or permitted delivery channel) matches, apply scope limited to that section, then record a redacted audit event. A valid token alone should not silently become broad form-owner authority.

### Beginner Check With Answer Key

**Check:** Does HTTPS mean the application has end-to-end encryption?  
**Answer:** No. HTTPS protects transport hops. End-to-end encryption is a specific architecture about which endpoints can decrypt and how keys are handled; clarify that threat model before using the term.

## Intermediate Application

### Role Workflow

1. Inventory assets, actors, entry points, third parties, and trust boundaries.
2. State allowed actions in a policy table, including deny/default and delegation/expiry.
3. Validate all inputs and protect output fields; do not trust UI roles.
4. Select approved crypto/key-management mechanisms; document where plaintext exists.
5. Define retention/deletion, audit, incident, and secret/dependency controls.

### Guided Role Scenario

A public officer delegates a section to a respondent. Build a policy table: owner can create/revoke invite; named recipient can view/edit assigned section until expiry; no one can access another section through an ID change; support staff receive a deliberately limited operational view. Test both allowed and denied paths.

### Practice Task

Write five abuse cases for delegated completion and one mitigation/test for each.

### Model Answer or Completed Example Solution

| Abuse case | Mitigation / test |
|---|---|
| Recipient changes response ID in URL | Authorise resource relationship server-side; negative integration test |
| Stolen invite is replayed after revocation | Stateful active/revoked check; test revoked token |
| Owner sees respondent’s protected field unnecessarily | Purpose-specific response projection; response-field test |
| Sensitive payload appears in logs | Redaction allowlist and log scan test |
| Dependency compromise steals secrets | Pin/scan dependencies, least-privileged secrets, rotation plan |

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| User accesses another record | Authz checks ID format only | Resource/action policy tests | Enforce relationship and scope at server |
| Secrets appear in diagnostics | Broad request logging | Log samples/retention | Structured redaction and access control |
| “Encrypted” data still overexposed | Key/decrypt service policy is broad | Who can request decrypt | Narrow grants/audits and split duties |

## Advanced Judgment

Security decisions have usability and recovery trade-offs. More client-side secrecy can limit server-side validation, search, support, and recovery; broader server access can reduce confidentiality. Make these consequences explicit. Never improvise cryptographic protocols in an interview. Ask: which actor must read which data, when, what compromise is in scope, where does plaintext exist, and how are keys authorised, rotated, and audited?

**Case:** “Encrypt every database field” is proposed after a security concern. A senior response distinguishes TLS, storage encryption, application/field encryption, and end-to-end encryption; identifies search/indexing and key-access impacts; and starts with data classification and threat model rather than claiming one universal solution.

## Practical Deliverable

- **Instructions:** Create a one-page threat model for the capstone.
- **Expected artifact:** Asset list, trust-boundary diagram, actor/action policy, top five threats, mitigations, and test/evidence plan.
- **Quality criteria:** Explicit plaintext/key boundaries; server-side authorisation; no custom crypto; logging and support access included.

## Timed Assessment

**Format:** 50-minute security-design review.  
**Prompt:** Review a design that checks `role === 'owner'` in React before returning all response data from the API.  
**Model answer:** The UI check is not an authority boundary. Define authenticated identity, resource relationship, action/scope policy, purpose-specific API projection, negative tests, and redacted auditing.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Threat reasoning | Assets/boundaries/adversaries explicit | Generic security list | No threat model |
| Access control | Server-enforced action/resource scope | Role check only | UI trust |
| Crypto/data handling | Vetted mechanisms, key/plaintext boundaries | Says “encrypt” | Custom/vague crypto claim |

**Bands:** Ready: 8–10; Developing: 5–7, practise policy and trust boundaries; Foundation needed: below 5.

## Interview and Evidence Preparation

**Question:** “How do encryption and access control relate?”  
**Model answer:** “They solve different problems. Encryption protects data against defined storage/transport or endpoint threats; access control decides who may invoke a read/decrypt action. I design both around assets, trust boundaries, least privilege, audit, and recovery.”

**Truthful evidence prompt:** Use a real project or lab where you handled sensitive data. State the actual classification assumption, the control you implemented or proposed, the limitation, and what you learned.

## Retention and Exit Criteria

- **Misconception:** “An encrypted database guarantees correct access.” Correction: decryption authority and response policy still decide exposure.
- **Flashcard:** What does least privilege minimise? **Answer:** The access and blast radius available to an identity/component.
- **Revision summary:** Start with threat model; authorise server-side; minimise data; use established crypto and explicit key boundaries.
- **I can:** write an action/resource policy and explain why encryption alone cannot prevent over-authorised disclosure.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| OWASP | [Developer Guide](https://owasp.org/www-project-developer-guide/assets/exports/OWASP_Developer_Guide.pdf) | Free, accessed 20 June 2026 | Deeper secure-development and verification guidance. |
| Node.js | [Security best practices](https://nodejs.org/en/learn/getting-started/security-best-practices) | Free, accessed 20 June 2026 | Node-specific threat and dependency guidance. |
