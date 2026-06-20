# Lesson Depth Quality Gates

Use this file during final review after applying `study-guide-rubric.md`. These gates test instructional sufficiency; passing headings alone is not enough.

## 1. Guide-Level Gates

- **Coverage:** Every job requirement has one distinct role lesson in `00-requirement-coverage-map.md`.
- **Dependency:** Every concept needed to read a role lesson has a mapped foundation lesson or an explicit recap before first use.
- **Sequence:** Foundations precede dependent applications; the roadmap makes the dependency visible.
- **Self-containment:** Removing optional references does not block explanation, practice, answer checking, or assessment.

## 2. Beginner Gate

Trace the lesson from its first sentence as a person with no role-specific knowledge. Reject it when a term, abbreviation, notation, code feature, data field, or process step appears before its explanation.

For each major concept, verify purpose, definition, parts, mechanism, decision rule, boundary, and a reasoned check. “Use an index,” “validate the input,” “write an RFC,” or “use a hook” is insufficient unless the lesson teaches what that instruction means and how the learner performs it.

## 3. Worked-Path Gate

Verify two complete paths exist:

1. The guided baseline has concrete inputs, numbered actions, results, explanation, and a check.
2. The second path changes a real condition, explains the failure or trade-off mechanism, diagnoses it, completes the correction/alternative, and verifies prevention.

Reject examples that jump from prompt to conclusion, omit the completed artefact, or treat a warning as an edge case.

## 4. Intermediate Gate

Attempt the practice without external material. The document must provide setup, starting material, task, method, constraints, deliverable, success criteria, verification, completed solution, and troubleshooting. Reject an exercise that says “build,” “design,” or “research” without enough inputs and process for a novice to begin.

## 5. Advanced-Judgment Gate

Verify the lesson teaches a decision, not a preference. The role case must state facts and assumptions, compare at least two credible options, name the selection criteria, justify a choice, state consequences and residual risk, and name evidence that would change the choice.

## 6. Manual Scoring

Score each gate as pass or revise. A lesson passes only when every gate passes.

| Failure signal | Required revision |
|---|---|
| Undefined prerequisite | Add or map a foundation lesson; recap before use |
| Unexplained code/data/process | Annotate the mechanism, inputs, outputs, and check |
| Outline-only solution | Add a completed artefact and decision-by-decision reasoning |
| Unsupported practice | Supply setup/materials, method, verification, and solution |
| One-option “advanced” advice | Add credible alternatives, criteria, consequences, and reversal evidence |
| Essential external link | Move the required teaching into the document |

## 7. Markdown Structure Check

For a Markdown guide, run:

```sh
sh scripts/validate-study-guide.sh <guide-directory>
```

This script verifies required files, foundation naming, and lesson headings. It does not replace the manual gates above.
