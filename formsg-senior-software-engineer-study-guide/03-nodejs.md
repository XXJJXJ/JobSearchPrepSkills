# Node.js for a FormSG Senior Software Engineer

## Role Relevance and Outcomes

- **Evidence:** Node.js is the stated backend stack; APIs must handle real traffic.
- **Outcome:** Design a bounded, validated request path that is responsive under concurrent load.
- **Definitions:** The *event loop* runs JavaScript callbacks; *non-blocking I/O* lets the runtime work on other requests while I/O waits; a *worker pool* executes certain expensive operations.

## Beginner Foundations

### Plain-Language Explanation

Node.js excels when each request handler performs small, non-blocking work and delegates I/O. A long synchronous parse, encryption loop, or complex calculation can delay unrelated users. That is a reliability and availability concern for a public service.

### Glossary

- **Handler:** code that receives an HTTP request and returns a response.
- **Backpressure:** slowing or rejecting work when downstream capacity is exhausted.
- **Timeout:** a limit on how long an operation may wait.
- **Cancellation:** stopping work no longer useful after a caller disconnects or a deadline expires.

### Core Concepts and How They Connect

An endpoint needs a clear sequence: authenticate, authorise, validate a bounded payload, execute the smallest necessary work, persist safely, emit a safe response, and record operational signals. Keep expensive CPU work off the event loop; set timeouts for databases and external calls so failure consumes a bounded amount of capacity.

### Worked Example: Bounded Submission Handler

```ts
async function createSubmission(req: Request, res: Response) {
  const actor = await requireActor(req)              // authenticate
  const input = parseSubmission(req.body)            // runtime validation, size-limited
  await requirePermission(actor, 'submission:create', input.formId)
  const result = await submissionService.create(input, req.idempotencyKey)
  res.status(result.created ? 201 : 200).json(toResponse(result))
}
```

The outline omits implementation details but identifies controls. `parseSubmission` must not trust TypeScript declarations alone; `toResponse` must not serialise internal fields by accident.

### Beginner Check With Answer Key

**Check:** Why can a synchronous CPU-heavy operation cause a security problem?  
**Answer:** An attacker may trigger it repeatedly and occupy the event loop or worker pool, preventing normal requests from being handled—a denial-of-service risk.

## Intermediate Application

### Role Workflow

1. Define authentication, authorisation, validation, idempotency, timeout, and error rules before routing.
2. Bound body size, pagination, query complexity, and fan-out.
3. Use deadlines and cancellation for outbound work; distinguish retryable from permanent errors.
4. Return stable error codes without sensitive implementation details.
5. Measure rate, latency, errors, resource saturation, and queue depth per endpoint.

### Guided Role Scenario

PDF generation for a completed form becomes CPU-intensive at peak. Do not run it synchronously in the submission request. Persist the completion, enqueue bounded background work, expose a status, and ensure each job is idempotent. If the receipt must be immediate, strictly cap input/complexity and plan capacity with load evidence.

### Practice Task

Write pseudocode for `POST /submissions` that accepts an idempotency key and is safe when the client retries after a timeout.

### Model Answer or Completed Example Solution

1. Validate key format and actor permissions.
2. Atomically look up/create an idempotency record scoped to actor and operation.
3. If complete, return the original response; if processing, return status/retry guidance; otherwise create submission and store the outcome.
4. Never reuse a key with a different request fingerprint; return a conflict rather than guessing intent.

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| All endpoints slow together | Event loop blocked | Event-loop lag / CPU profile | Remove sync work; offload bounded CPU work |
| Memory rises under load | Unbounded body, list, or queue | Payload and queue metrics | Apply limits, pagination, and backpressure |
| Retries create duplicates | No idempotency persistence | Compare request IDs / records | Persist key + request fingerprint + outcome |

## Advanced Judgment

Concurrency does not remove capacity limits. Tune connection pools, queues, and timeouts as a system, not endpoint-by-endpoint. Retrying a non-idempotent operation can magnify an outage; retries need a budget, jitter, and a decision about side effects. Do not log raw classified form values just to diagnose a production error—correlation IDs and structured, redacted events are usually sufficient.

**Case:** An external payment provider takes 20 seconds. A senior decision is not simply “raise the server timeout.” Define the user outcome, deadline, idempotency, provider callback/status model, rate limits, and a reconciliation path for unknown payment states.

## Practical Deliverable

- **Instructions:** Implement or sketch a Node request path for a submission with runtime validation, permissions, idempotency, timeout, and redacted logs.
- **Expected artifact:** Handler/service boundary plus a table of success and failure responses.
- **Quality criteria:** Every external input is bounded; no blocking CPU path is hidden in the handler; unknown outcome has a recovery path.

## Timed Assessment

**Format:** 45-minute backend practical/design.  
**Prompt:** Diagnose duplicate submissions after clients retry on a 504. Propose code and data changes.  
**Model answer:** Use a scoped idempotency key and request fingerprint, atomically persist/replay the canonical result, and expose “processing/unknown” instead of repeating a side effect. Add tests for concurrent retries.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Correctness | Atomic replay / conflict handling | UI-only prevention | Repeats side effect |
| Runtime judgment | Mentions bounds, timeout, non-blocking work | Generic async wording | No load/failure consideration |
| Observability | Correlation and redacted metrics | Logs only | Sensitive data in logs |

**Bands:** Ready: 8–10; Developing: 5–7, practise idempotency and Node runtime behaviour; Foundation needed: below 5.

## Interview and Evidence Preparation

**Question:** “What does ‘Node is non-blocking’ not mean?”  
**Model answer:** “It does not mean unlimited throughput or that JavaScript cannot block. Event-loop callbacks and worker-pool work must be bounded; CPU-heavy or unbounded work can harm latency and availability.”

**Truthful evidence prompt:** Describe a real performance or reliability issue you investigated. Separate your direct actions from the team’s actions and state how you measured the result.

## Retention and Exit Criteria

- **Misconception:** “`async` makes CPU work non-blocking.” Correction: an async function can still run synchronous CPU work on the event loop.
- **Flashcard:** What is an idempotency key for? **Answer:** Safely associating repeat requests with one intended effect/result.
- **Revision summary:** Bound work, validate at the boundary, make side effects idempotent, and observe redacted signals.
- **I can:** explain event-loop blocking and design a retry-safe submission endpoint.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| Node.js | [Don’t block the Event Loop](https://nodejs.org/en/learn/asynchronous-work/dont-block-the-event-loop) | Free, accessed 20 June 2026 | Verify runtime and worker-pool details. |
| Node.js | [Security best practices](https://nodejs.org/en/learn/getting-started/security-best-practices) | Free, accessed 20 June 2026 | Explore Node-specific threat guidance. |
