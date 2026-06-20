# FormSG Senior Software Engineer — Study Roadmap

**Target:** Senior Software Engineer, FormSG, Open Government Products.  
**Source analysis:** [00-job-analysis.md](00-job-analysis.md), based on the live [job posting](https://careers.open.gov.sg/o/senior-software-engineer-formsg), accessed 20 June 2026.

## Readiness Target

At interview, you should be able to independently design, implement, ship, and explain a security-sensitive form capability in TypeScript, React, Node.js, and MongoDB. The evidence should show product discovery, safe operational judgment, and clear collaboration—not only framework familiarity.

**Assumptions:** The posting does not state an assessment format. This guide therefore prepares for the formats reasonably implied by the role: a coding/practical task, system design discussion, code-review/RFC discussion, and behavioural/product interview. They are study simulations, not predictions of OGP’s hiring process.

## Dependency-Ordered Curriculum

| # | Topic document | Job evidence | Prerequisite | Expected outcome | Practical proof | Likely assessment |
|---:|---|---|---|---|---|---|
| 01 | [TypeScript](01-typescript.md) | Strong TypeScript | JavaScript fundamentals | Model domain and API states safely | Typed submission domain module | Coding / review |
| 02 | [React](02-react.md) | React frontend | 01 | Build accessible, resilient form UI | Multi-step form screen | Coding / UI review |
| 03 | [Node.js](03-nodejs.md) | Node.js backend | 01 | Build a non-blocking, bounded service endpoint | Request handler with validation | Coding / systems |
| 04 | [MongoDB](04-mongodb.md) | MongoDB/NoSQL | 03 | Model and query submissions for real access patterns | Schema and index rationale | Data / system design |
| 05 | [Production APIs](05-production-apis.md) | APIs handling real traffic | 03–04 | Design compatible, idempotent, observable APIs | API contract and failure plan | System design |
| 06 | [Security and data protection](06-security-and-data-protection.md) | Encryption, access control, data handling | 02–05 | Apply a threat model and least privilege | Security design note | System design / review |
| 07 | [High-security system design](07-high-security-system-design.md) | High-security systems is a strong plus | 05–06 | Defend encryption and key-boundary decisions | Architecture decision record | System design |
| 08 | [Reliability and observability](08-reliability-and-observability.md) | Security/reliability; monitoring/testing | 03–05 | Set SLOs and safe failure behaviour | Dashboard / runbook sketch | Operational case |
| 09 | [CI/CD](09-cicd.md) | CI/CD familiarity | 01–08 | Create a quality-gated release path | Pipeline design | Delivery discussion |
| 10 | [Git and code review](10-git-and-code-review.md) | Git workflows; code reviews | 01–09 | Keep changes reviewable and risk-controlled | Review comment / PR plan | Code review |
| 11 | [Infrastructure as code](11-infrastructure-as-code.md) | IaC; maintain infrastructure | 08–10 | Version, review, and roll out infrastructure safely | IaC module plan | Systems / delivery |
| 12 | [Product discovery and technical planning](12-product-discovery-and-technical-planning.md) | Scope messy problems; product outcomes | 01–11 | Turn stakeholder need into a measurable plan | One-page RFC | Product / system design |
| 13 | [Stakeholder communication](13-stakeholder-communication.md) | Explain to non-technical people | 12 | Explain risk, scope, and decisions precisely | Plain-language rollout brief | Behavioural / role-play |
| 14 | [Senior delivery in ambiguity](14-senior-delivery-in-ambiguity.md) | Prototype, ship, iterate; fast-moving environments | 01–13 | Lead a safe end-to-end delivery under uncertainty | End-to-end case-study narrative | Behavioural / architecture |

## Suggested Four-Week Sequence

| Week | Focus | Deliverable |
|---|---|---|
| 1 | 01–04: stack and data foundations | Typed multi-step submission prototype and data-model note |
| 2 | 05–08: production, security, reliability | API contract, threat model, SLO/dashboard and incident plan |
| 3 | 09–11: safe delivery practices | CI/CD proposal, review plan, IaC change and rollback plan |
| 4 | 12–14: senior product execution | One-page RFC, non-technical brief, and rehearsed end-to-end story |

## Capstone Simulation

Design “delegated form completion”: a form owner may invite two respondents, track completion, and submit a single combined response. Treat data as sensitive. Write a 2–3 page RFC, model the primary collections and indexes, draw the API/state flow, identify access-control and encryption boundaries, and define rollout/rollback plus three operational signals. This deliberately mirrors the posting’s multi-respondent workflow, security, scale, delivery, and communication signals without claiming knowledge of FormSG’s implementation.

Use the numbered documents as standalone lessons. External links at the end of each are optional verification and extra practice; all required explanation and exercises are in the documents.
