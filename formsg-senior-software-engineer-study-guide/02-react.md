# React for a FormSG Senior Software Engineer

## Role Relevance and Outcomes

- **Evidence:** FormSG’s frontend uses React and TypeScript; the product is a form platform.
- **Outcome:** Build accessible, predictable multi-step form UI that handles asynchronous submission safely.
- **Definitions:** A *component* is a reusable UI function; *props* are inputs; *state* is data a component remembers between renders.

## Beginner Foundations

### Plain-Language Explanation

React renders a user interface from state. A form is not a collection of DOM mutations; it is a representation of the current field values, validation results, permissions, and request state. Keep the source of truth clear so a retry or browser refresh does not invent a misleading UI state.

### Glossary

- **Controlled input:** an input whose value is driven by React state.
- **Render purity:** rendering should calculate UI, not initiate network requests or mutate outside state.
- **Lift state up:** put shared state in the nearest common parent.
- **Accessibility (a11y):** making the application usable with keyboard, screen reader, zoom, and varied assistive technology.

### Core Concepts and How They Connect

Use small components around meaningful form boundaries: `QuestionField`, `StepNavigation`, `SubmissionStatus`. Keep server state (submission result) distinct from editable draft state. Derive values when possible rather than storing copies that can diverge.

### Worked Example: Accessible Error

```tsx
function EmailField({ value, error, onChange }: {
  value: string; error?: string; onChange: (v: string) => void
}) {
  const errorId = 'email-error'
  return <label>Email
    <input value={value} onChange={e => onChange(e.target.value)}
      aria-invalid={Boolean(error)} aria-describedby={error ? errorId : undefined} />
    {error && <p id={errorId} role="alert">{error}</p>}
  </label>
}
```

The visual error, programmatic error state, and input are connected. A user is not expected to infer an error from colour alone.

### Beginner Check With Answer Key

**Check:** Why should a component not call `fetch` while rendering?  
**Answer:** Rendering may occur more than once and should remain predictable. Trigger network work from an event handler or a carefully designed effect, then render from the result state.

## Intermediate Application

### Role Workflow

1. Identify the user goal and each form state: editing, validating, submitting, succeeded, recoverable failure.
2. Decide which state is local, shared, server-derived, or URL/persistence state.
3. Design validation feedback and keyboard/focus behaviour before styling.
4. Prevent duplicate submit UI, but rely on backend idempotency for correctness.
5. Test success, network loss, server validation error, expired session, and assistive-technology flow.

### Guided Role Scenario

A public officer assigns a respondent a section. The owner must see “waiting”, “completed”, or “invite expired” without overwriting their own draft. Make the server authoritative for invite status and represent a refreshable status view; do not infer completion solely from a stale button click.

### Practice Task

Sketch component boundaries and request state for a three-step application form where the final step may time out after the user clicks Submit.

### Model Answer or Completed Example Solution

- `FormShell` owns draft and current step; `StepFields` receives typed fields and errors.
- `SubmitButton` receives a discriminated `RequestState`, disables only while a request is in flight, and shows a retry path for known safe failures.
- On timeout, show “We could not confirm submission; check status” rather than “Not submitted.” Query the canonical submission status using an attempt ID.

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| Typed value appears in wrong field | Unstable list key | Inspect list keys | Use a stable domain ID, not array index |
| User submits twice | UI is only control | Check server request logs | Add backend idempotency; retain UI guard |
| Screen reader misses error | Visual-only treatment | Keyboard / screen-reader test | Associate error text and move focus appropriately |

## Advanced Judgment

Forms hold sensitive data. Minimise browser retention, avoid putting secrets or full answers in URLs/logs, and clear data only when the product and recovery needs allow it. Optimise render performance after measurement; splitting every state atom can make a critical workflow less understandable. Accessibility is a correctness requirement: a technically successful form that blocks keyboard or assistive users fails the product outcome.

**Case:** A designer requests immediate validation for every field. Recommend validating on meaningful interaction (blur, submit, or domain-safe checkpoints) and use clear, non-destructive feedback. Aggressive validation can obscure errors while a user is still typing and may expose sensitive rules unnecessarily.

## Practical Deliverable

- **Instructions:** Build the UI slice of delegated completion: owner view, invite status, and a respondent section with validation.
- **Expected artifact:** Component diagram, code, and a five-case manual test script.
- **Quality criteria:** Logical state ownership, no side effect in render, accessible error/focus behaviour, timeout state does not misrepresent submission outcome.

## Timed Assessment

**Format:** 45-minute frontend practical; this is inferred from React and form-platform work.  
**Prompt:** Implement a typed, accessible submission status component for idle/loading/success/recoverable error.  
**Model solution:** Render from a union state; use `aria-live`/associated error text where appropriate; retry only with the same idempotency key or a status check.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| State/UI fidelity | Each state is clear and exclusive | Handles happy path only | Contradictory / misleading state |
| Accessibility | Labels, errors, keyboard path considered | Some semantic HTML | Purely visual UI |
| Failure judgment | Does not declare timeout a failure | Generic error only | Permits unsafe repeated submit |

**Bands:** Ready: 8–10; Developing: 5–7, practise async/error UI; Foundation needed: below 5, review controlled inputs and state.

## Interview and Evidence Preparation

**Question:** “How do you make a form reliable for users, not just the backend?”  
**Model answer:** “I model explicit request and validation states, make errors accessible and actionable, preserve recovery context, and avoid claiming a submission failed until the authoritative server state confirms it. Then I test keyboard, network, and retry paths.”

**Truthful evidence prompt:** Describe a UI workflow you improved. Use your actual user signal, the accessibility or error-handling change, and the outcome; use a project example if no production data exists.

## Retention and Exit Criteria

- **Misconception:** “Disabled Submit prevents duplicates.” Correction: it improves UX, but only a server-side idempotency policy enforces correctness.
- **Flashcard:** What should render do? **Answer:** Calculate UI from state without starting effects.
- **Revision summary:** Keep state ownership explicit; connect errors semantically; represent unknown outcomes honestly.
- **I can:** implement an accessible typed form state machine and explain the client/server boundary for duplicate submissions.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| React | [Describing the UI](https://react.dev/learn/describing-the-ui) | Free, accessed 20 June 2026 | Verify current component and render-model guidance. |
| React | [Adding Interactivity](https://react.dev/learn/adding-interactivity) | Free, accessed 20 June 2026 | Extra state and event practice. |
