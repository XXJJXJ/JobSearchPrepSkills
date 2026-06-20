# Reliability, Monitoring, and Testing for FormSG

## Role Relevance and Outcomes

- **Evidence:** The posting requires security and reliability at scale, and names monitoring and testing practices.
- **Outcome:** Define measurable service health and make failure safe, visible, and recoverable.
- **Definitions:** An *SLO* is a target level of service; an *SLI* is its measurement; an *error budget* is the tolerated unreliability within the objective.

## Beginner Foundations

### Plain-Language Explanation

Reliability means a user can complete a critical task correctly, not that every server process is technically alive. Observe user outcomes—successful, timely, correct submission—alongside infrastructure signals. Instrument enough context to investigate without recording sensitive form content.

### Glossary

- **Availability:** proportion of valid requests served successfully.
- **Latency:** time until an outcome; use percentiles rather than averages.
- **Alert:** actionable signal requiring response, not a dashboard decoration.
- **Runbook:** a concise, tested response procedure.

### Core Concepts and How They Connect

Start with a service journey and failure modes. Set an SLI such as “percentage of final-submission attempts that receive a confirmed receipt within 10 seconds, excluding client cancellation.” Then collect rate, error, duration, saturation, and dependency signals. Tests catch anticipated regressions; monitoring detects real production behaviour; both need safe release/rollback.

### Worked Example: Submission SLO

**Objective:** 99.9% of valid final-submission requests return a confirmed canonical state within 10 seconds per 30 days.  
**Signals:** request count, outcome category, p50/p95/p99 latency, MongoDB dependency latency, idempotency replay rate, queue lag.  
**Safe diagnostics:** correlation ID, form version, operation/result category—not raw answers or tokens.

### Beginner Check With Answer Key

**Check:** Why is average latency a poor primary user signal?  
**Answer:** A small number of very slow requests can severely harm users while barely moving the average. Percentiles reveal the slow tail.

## Intermediate Application

### Role Workflow

1. Identify user-critical journeys and data correctness criteria.
2. Set SLO/SLI and alert threshold connected to a response action.
3. Add structured, redacted logs; traces/metrics with correlation.
4. Test unit invariants, integration boundaries, and end-to-end critical journeys.
5. Deploy progressively; monitor a defined window; rollback or mitigate on explicit conditions.

### Guided Role Scenario

After an invite feature release, completion rates drop while API success remains high. The monitoring plan should distinguish UI validation/permission errors, invitation delivery, recipient open rate, submission flow, and backend latency. A 200 response alone does not prove the product outcome.

### Practice Task

Define three alerts for the capstone and give each an owner response.

### Model Answer or Completed Example Solution

| Alert | Condition | Response |
|---|---|---|
| Submission confirmation errors | Error SLI breaches short burn threshold | Halt rollout, inspect dependency and recent deploy, enable rollback |
| Queue lag grows | Lag exceeds delivery deadline | Protect intake, add capacity only if safe, investigate consumer/dependency |
| Authz-denied spike | Unexpected rate/type | Check deployment/config/attack signals; do not log payloads; escalate per runbook |

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| Alert fatigue | Alerts lack action/threshold | Last alert outcomes | Remove or tune; attach runbook |
| Incident cannot be correlated | Ad hoc logs | Request-to-dependency IDs | Use consistent correlation identifiers |
| Canary looks healthy but users fail | Technical-only metric | Journey/outcome metrics | Add product SLI and staged cohorts |

## Advanced Judgment

Reliability needs prioritisation. A read-only status page may be preferable to accepting writes whose outcome cannot be determined. Avoid false success: returning “submitted” before durable state is known harms user trust. Chaos/load testing is useful only with safety boundaries, hypotheses, and response plans. For a government platform, incident communication and auditability are part of the service quality.

**Case:** Database latency rises. A senior response protects the final-submit path, applies timeouts/backpressure, avoids retry storms, uses idempotent status/recovery flows, and communicates user impact. It does not merely add retries or scale blindly.

## Practical Deliverable

- **Instructions:** Produce a reliability plan for delegated completion.
- **Expected artifact:** Critical journeys, SLOs/SLIs, dashboard/alert table, test matrix, rollout/rollback trigger, one runbook.
- **Quality criteria:** User outcome metrics; redacted observability; alert response is executable; unknown outcome is recoverable.

## Timed Assessment

**Format:** 40-minute operational incident case.  
**Prompt:** Submissions return 504s after a dependency degradation; users retry.  
**Model answer:** Establish scope from signals, limit amplification, preserve/reconcile idempotent outcomes, decide rollback/feature flag, communicate status, and document follow-up.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Triage | Uses user/system signals and scope | Reads logs only | Guesses root cause |
| Safety | Prevents retry/data-loss amplification | Restarts service | Repeats unsafe writes |
| Learning | Runbook/monitoring improvement | Generic postmortem | No follow-up |

**Bands:** Ready: 8–10; Developing: 5–7, practise SLOs and failure modes; Foundation needed: below 5.

## Interview and Evidence Preparation

**Question:** “What would you monitor for a submission service?”  
**Model answer:** “I start with successful, timely, correct submission outcome. I pair it with rate, error category, latency percentiles, saturation, dependency health, and idempotency/unknown-state signals, while redacting sensitive content.”

**Truthful evidence prompt:** Describe one alert, dashboard, test, or incident practice you improved. State exactly what signal changed or what learning followed.

## Retention and Exit Criteria

- **Misconception:** “More logs always improves observability.” Correction: unstructured/sensitive logs can obscure signals and introduce data risk.
- **Flashcard:** What makes an alert good? **Answer:** It signals meaningful impact and has an owner action/runbook.
- **Revision summary:** Measure user outcomes, protect capacity, test failure paths, and make recovery transparent.
- **I can:** define a submission SLO and a safe response to a dependency-driven timeout incident.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| Node.js | [Don’t block the Event Loop](https://nodejs.org/en/learn/asynchronous-work/dont-block-the-event-loop) | Free, accessed 20 June 2026 | Runtime-capacity context for Node services. |
