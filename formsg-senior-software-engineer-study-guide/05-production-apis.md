# Production API Design for FormSG

## Role Relevance and Outcomes

- **Evidence:** The role asks for APIs that handle real traffic and ownership through production.
- **Outcome:** Define APIs that are compatible, authorisation-aware, idempotent, rate-conscious, and observable.
- **Definitions:** An *API contract* is the client/server agreement; *idempotency* means repeat attempts produce one intended effect; *compatibility* means existing clients keep working after a change.

## Beginner Foundations

### Plain-Language Explanation

An API is a product boundary, not a database wrapper. Its contract should describe the user-facing action, validate inputs, enforce permission, return safe outcomes, and remain understandable as clients and traffic grow.

### Glossary

- **Resource/action:** a noun the system manages / a business operation it performs.
- **Status code:** protocol-level signal of outcome; pair it with stable application error codes where useful.
- **Pagination:** returning bounded pages rather than an unbounded list.
- **Rate limiting:** limiting request rate to protect fairness and capacity.

### Core Concepts and How They Connect

Separate transport payload from internal model. Define request constraints (types, size, ranges), response representations, error codes, authz rule, idempotency rule, and observability fields. Version or evolve contracts deliberately: a client may retry an older request long after the server release.

### Worked Example: Finalise Submission

```
POST /v1/form-responses/{id}/submit
Idempotency-Key: opaque-client-generated-key

201 { "receiptId": "R-...", "status": "submitted" }
409 { "code": "IDEMPOTENCY_KEY_REUSED_WITH_DIFFERENT_REQUEST" }
403 { "code": "NOT_ALLOWED_TO_SUBMIT" }
```

The endpoint is an explicit business action. A repeat with the same key and same request returns the prior canonical outcome; a changed request with the same key is rejected rather than merged.

### Beginner Check With Answer Key

**Check:** Is `POST` automatically non-idempotent?  
**Answer:** Its HTTP semantics do not promise idempotency, but an application can make a specific POST operation retry-safe with a persisted idempotency policy.

## Intermediate Application

### Role Workflow

1. Start from user action/outcome and enumerate actors and forbidden actors.
2. Define validation, authorisation, side effects, idempotency, and error model.
3. Add paging/filter bounds, rate limits, timeouts, and correlation ID.
4. Write contract tests for old/new client compatibility and concurrent retries.
5. Instrument request rate, latency, error category, saturation, and dependency outcomes.

### Guided Role Scenario

An agency dashboard asks for all responses. A senior API is paginated, permission-filtered, filterable only through allowed fields, and returns a projection appropriate to the caller. Do not return complete raw submission documents and let the UI “hide” sensitive fields.

### Practice Task

Specify the request/response/error contract for creating a delegated respondent invite. Include who may call it, duplicate behaviour, and expiry constraints.

### Model Answer or Completed Example Solution

- Owner-only action after checking ownership of the form response.
- Request contains recipient reference and bounded expiry; recipient identity is resolved/validated server-side.
- Unique active invite per response/recipient: repeat with same idempotency key replays; a separate active invite returns a domain conflict.
- Response exposes opaque invite ID/status, not more recipient information than the caller is entitled to see.

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| Client breaks after server release | Response changed destructively | Contract diff/client logs | Add fields compatibly; version/migrate intentionally |
| Endpoint leaks data | API returns persistence record | Compare response to caller permissions | Return a purpose-specific projection |
| Load spike overwhelms database | Unbounded list/retry storm | Page size, retries, dependency metrics | Bound requests; add rate/retry budgets |

## Advanced Judgment

Backward compatibility is a security concern: removing an auth field or changing defaults can broaden access for older clients. “Handle real traffic” means formulate capacity assumptions and failure behaviour, not guess a requests-per-second number. Use queues/asynchronous work only when the user outcome tolerates it; a queued API needs status, deduplication, expiry, and operations ownership.

**Case:** A mobile client’s network retries a `submit` request. The right answer includes client timeout ambiguity, persisted idempotency, atomic effect/result, response replay, observability, and a manual support/reconciliation path—not merely an HTTP code.

## Practical Deliverable

- **Instructions:** Write an API contract for the capstone’s invite and final-submit operations.
- **Expected artifact:** Endpoint table, schemas, authz rules, idempotency/rate policy, compatibility note, and six contract tests.
- **Quality criteria:** User outcome is explicit; every operation has a caller rule; duplicates and partial failure have a defined answer.

## Timed Assessment

**Format:** 45-minute system-design/code-review task.  
**Prompt:** Review an endpoint that lists all submissions and returns the raw Mongo document.  
**Model answer:** Identify unbounded response, data-leak risk, stability coupling, and missing authorisation. Replace it with paginated, permission-filtered projection and metrics; explain migration/compatibility.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Contract | Explicit action, errors, version behaviour | Happy path documented | Database wrapper |
| Safety | Authz, bounds, idempotency addressed | Some checks | UI-only / omitted controls |
| Operations | Metrics and failure path | Logging mentioned | No real-traffic plan |

**Bands:** Ready: 8–10; Developing: 5–7, practise contract and retry design; Foundation needed: below 5.

## Interview and Evidence Preparation

**Question:** “How do you design APIs for retries?”  
**Model answer:** “First I distinguish read from side-effecting operation. For side effects I use a scoped key, request fingerprint, atomic result persistence, and a canonical way to report processing/unknown state. I bound retry behaviour and observe it.”

**Truthful evidence prompt:** Identify an API you have built, used, or reviewed. Explain one contract decision and the user or operational failure it prevented.

## Retention and Exit Criteria

- **Misconception:** “The frontend can enforce API permissions.” Correction: the server must authorise every action and shape each response.
- **Flashcard:** Why store a request fingerprint with an idempotency key? **Answer:** To reject accidental reuse of the key for a different intended operation.
- **Revision summary:** Design for client compatibility, permissions, bounded capacity, retry ambiguity, and operational visibility.
- **I can:** specify a retry-safe, authorisation-aware endpoint and defend its failure behaviour.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| Node.js | [Security best practices](https://nodejs.org/en/learn/getting-started/security-best-practices) | Free, accessed 20 June 2026 | Additional application-security considerations. |
