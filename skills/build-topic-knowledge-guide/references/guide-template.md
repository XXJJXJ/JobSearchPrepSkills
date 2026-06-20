# Guide Template

Use this template for Markdown file output. Adapt headings to the topic, but preserve the core structure so the guide stays dense, navigable, and revision-ready.

## Main Guide: `00-study-guide.md`

````markdown
# [Topic] Study and Knowledge Guide

Built for: [target learner and purpose]

## How to Use This Guide

- Read once top to bottom.
- Cover answers and explain them aloud.
- Redo the worked examples or checks from memory.
- Use `99-cheat-sheets-and-checklist.md` for final revision.

## Table of Contents

1. [Foundation or area]
2. [Core mechanism or area]
3. [Operational/procedural area]
4. [Troubleshooting/comparison area]
5. [Applications and readiness]

## Knowledge Map

| Area | Why it matters | Prerequisites | Questions to answer | Practice/check |
|---|---|---|---|---|
| [Area] | [Value] | [Prereqs] | [Q spine] | [Check] |

## Study Sequence

| Order | Section | Outcome | Estimated effort | Exit check |
|---|---|---|---|---|
| 1 | [Section] | [Outcome] | [Time] | [Check] |

---

## 1. [Section Title]

### Mental Model

[Plain-language framing. Define the problem this area solves.]

### Terms to Know First

| Term | Plain meaning | Used for | Boundary |
|---|---|---|---|

### Q1.1 - [Mechanism question]

[Direct answer.]

Step by step:

1. [Step with why it happens.]
2. [Step with input/output.]
3. [Step with verification.]

Example:

```text
[Concrete example, command, formula, scenario, or artifact.]
```

Check:

- [How to verify correctness.]

Key concepts: [short recall list]

### Q1.2 - [Contrast, procedure, or troubleshooting question]

[Use a pattern from `question-patterns.md`.]

### Common Failure Modes

| Symptom | Likely cause | First check | Fix | Prevention |
|---|---|---|---|---|

### Section Recall

- [Flashcard question] -> [Answer]
- [Explain-from-memory prompt]

---

## 2. [Next Section]

[Repeat the section shape.]

## Final Readiness

You are ready when you can:

- [I can statement]
- [I can explain a mechanism]
- [I can diagnose a failure]
- [I can compare alternatives]

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
````

## Cheat Sheet: `99-cheat-sheets-and-checklist.md`

````markdown
# Cheat Sheets and Final Checklist

## High-Yield Recall

| Prompt | Expected answer |
|---|---|

## One-Page Cheat Sheets

### [Cheat Sheet Name]

```text
[Compact commands, formulas, state flow, decision tree, or reference table.]
```

## Diagnostic Paths

| Situation | First checks | Likely fix | Verify |
|---|---|---|---|

## Compare and Choose

| Choice | Pick this when | Avoid when | Caveat |
|---|---|---|---|

## Memory Drills

- Redo: [worked path or command sequence].
- Explain: [mechanism from memory].
- Draw: [flow/state diagram].
- Diagnose: [failure scenario].

## Final Checklist

- [ ] [Concrete readiness action]
- [ ] [Concrete revision action]
- [ ] [Concrete practice action]
````

## Module Files

For broad topics, create additional files such as:

- `01-foundations.md`
- `02-core-mechanisms.md`
- `03-practical-operations.md`
- `04-troubleshooting-and-tradeoffs.md`

Each module must still include mental model, numbered Q&A, examples, checks, failures, and recall.
