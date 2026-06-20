# TypeScript for a FormSG Senior Software Engineer

## Role Relevance and Outcomes

- **Evidence:** The posting explicitly requires strong TypeScript across the stack.
- **Outcome:** Model form, submission, API, and error states so illegal or unhandled states are hard to introduce.
- **Minimum definitions:** A *type* describes allowed values; a *union* is a value that may be one of several shapes; *narrowing* proves which shape is present before use.

## Beginner Foundations

### Plain-Language Explanation

TypeScript adds compile-time checks to JavaScript. It does not validate untrusted network input by itself; it catches mistakes in code that the compiler can see. At a sensitive form boundary, use TypeScript to make intended states explicit, then validate external data at runtime.

### Glossary

- **Structural typing:** compatibility is based on a value’s shape, not a declared class hierarchy.
- **Discriminated union:** a union with a shared tag such as `status`, enabling safe branching.
- **`unknown`:** a value whose shape is not trusted yet; safer than `any` at input boundaries.
- **Exhaustiveness check:** compile-time proof that every union case has been considered.

### Core Concepts and How They Connect

Prefer narrow domain types over broadly optional objects. `SubmissionDraft` and `Submitted` have different valid fields; expressing that distinction prevents code from treating an incomplete draft as a final response. Use readonly data where mutation would create surprising UI or persistence bugs.

### Worked Example: Submission State

```ts
type Submission =
  | { status: 'draft'; id: string; fields: Record<string, unknown> }
  | { status: 'submitted'; id: string; submittedAt: Date; receiptId: string }

function receiptFor(s: Submission): string {
  if (s.status === 'submitted') return s.receiptId
  throw new Error('A draft has no receipt')
}
```

The status tag narrows the union. `receiptId` cannot accidentally be read from a draft without the compiler highlighting the missing case.

### Beginner Check With Answer Key

**Check:** Why is `any` unsuitable for an HTTP request body?  
**Answer:** It disables the compiler’s checks, so code may assume a property exists or has a safe type when an attacker or buggy client supplied something else. Receive it as `unknown`, validate it, then convert to a typed domain value.

## Intermediate Application

### Role Workflow

1. List the domain states and transitions before writing a component or handler.
2. Define input, internal-domain, and output types separately.
3. Validate untrusted input at runtime; convert only validated values to the domain type.
4. Use unions for mutually exclusive states and exhaustive switches for decisions with security or money impact.
5. Keep API response types stable; avoid leaking persistence records directly.

### Guided Role Scenario

A user retries a payment-backed submission after a connection timeout. The client needs a clear state: `pending`, `confirmed`, or `unknown`. Do not represent all three as optional booleans, because `pending: true` and `confirmed: true` could coexist.

```ts
type PaymentState =
  | { kind: 'pending'; attemptId: string }
  | { kind: 'confirmed'; receiptId: string }
  | { kind: 'unknown'; retryAfterSeconds: number }
```

### Practice Task

Define `InviteState` for a multi-respondent form. It must distinguish an active invite, a completed invite, and a revoked invite. Include only fields valid in each state.

### Model Answer or Completed Example Solution

```ts
type InviteState =
  | { kind: 'active'; inviteId: string; expiresAt: Date }
  | { kind: 'completed'; inviteId: string; completedAt: Date }
  | { kind: 'revoked'; inviteId: string; revokedReason: 'owner_action' | 'expiry' }
```

A switch over `kind` lets each branch access only state-valid fields. Add a `default` branch assigning to `never` when the transition is safety-critical.

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| Compiler accepts unsafe request properties | `any` entered at boundary | Search request/body types | Use `unknown` plus runtime schema validation |
| UI state contradicts itself | Independent booleans model a state machine | List all boolean combinations | Replace with a discriminated union |
| A new status silently gets a bad fallback | Non-exhaustive branching | Inspect `switch` default | Add an exhaustive `never` assertion |

## Advanced Judgment

Types improve local correctness, not security by themselves. A runtime validator may accept a value that is type-correct but forbidden by an authorisation policy; enforce policy separately. Do not create elaborate generic abstractions before the form domain is understood—explicit types are often safer and easier to review. Public API types need compatibility discipline: adding an optional field is generally less disruptive than changing a field’s meaning or removing it.

**Case:** A team proposes a shared `Record<string, any>` “form payload” everywhere to ship faster. Reject it for security-sensitive system boundaries. Permit flexible raw values only in a narrow validated layer; transform into typed field definitions and role-specific response views before business logic.

## Practical Deliverable

- **Instructions:** Create `domain.ts` for the delegated-completion capstone. Model form lifecycle, invite lifecycle, and submission outcome with unions.
- **Expected artifact:** Types plus three transition functions and an exhaustive test/example for each.
- **Quality criteria:** No `any`; untrusted input is `unknown`; illegal state combinations cannot be constructed without an explicit escape hatch; names communicate business meaning.

## Timed Assessment

**Format and relevance:** 35-minute TypeScript coding/review task; strong TypeScript is explicit job evidence.  
**Prompt:** Refactor `{ isLoading, error?, result? }` for a submission request so it cannot show a result and an error together.  
**Model answer:** Use `{ kind: 'idle' | 'loading' | 'success' | 'failure' }` union variants. The success variant contains the receipt; failure contains a safe user-facing error code.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| State model | Mutually exclusive, typed payloads | Mostly correct but permits an invalid combination | Optional-property bag remains |
| Boundary judgment | Notes runtime validation and safe errors | Mentions validation only | Treats types as runtime security |
| Clarity | Small, idiomatic, readable types | Over-generic or unclear | Incomprehensible / uses `any` |

**Bands:** Ready: 8–10/10; Developing: 5–7, practise unions and input boundaries; Foundation needed: below 5, revisit narrowing and object types.

## Interview and Evidence Preparation

**Question:** “Where does TypeScript help most in a secure form service?”  
**Model answer:** “It makes application states and contracts explicit, which reduces accidental misuse during refactoring. I use it with runtime validation at inputs, authorisation checks for actions, and tests for behaviour; the compiler is one control, not the control.”

**Truthful evidence prompt:** Choose a real feature where a type or interface prevented a defect. State the prior ambiguity, the type change you personally made, the observed result, and its limitation.

## Retention and Exit Criteria

- **Misconception:** “TypeScript validates JSON.” Correction: it emits JavaScript; validate runtime inputs separately.
- **Flashcard:** What turns a union into a discriminated union? **Answer:** A shared literal tag used to narrow each variant.
- **Revision summary:** Model state transitions explicitly; receive external data as unknown; validate, transform, and branch exhaustively.
- **I can:** explain type-system limits, implement a discriminated union, and model a form workflow without contradictory flags.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| Microsoft / TypeScript | [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/intro.html) | Free, accessed 20 June 2026 | Verify language features and explore advanced type patterns. |
