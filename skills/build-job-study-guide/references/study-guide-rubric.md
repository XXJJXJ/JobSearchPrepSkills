# Content-First Study Guide Rubric

Use this rubric for every `$build-job-study-guide` output. The guide must teach the role requirements directly; external resources may deepen or verify learning but must never carry essential instruction.

## 1. Guide Set

### 1.1 Study Roadmap

Create `00-study-roadmap.md` or its DOCX equivalent. Include:

- Target role, source job analysis, and stated assumptions.
- A short readiness summary: the outcomes, responsibilities, and assessment expectations being prepared for.
- A dependency-ordered table with topic document number, job evidence, prerequisite, expected outcome, practical proof, and likely assessment format.
- An explicit note when an assessment type is inferred rather than stated in the job material.
- A sequence that starts with foundational concepts and ends with role simulation and interview rehearsal.

### 1.2 Topic Documents

Create one numbered standalone document for every required and preferred requirement. Split a compound job statement into separate learnable competencies; do not merge requirements merely because they use related tools or workflows.

Each document must define unfamiliar terms and teach every prerequisite idea needed to follow its examples. It may reference an earlier topic document for extended practice, but it must include enough explanation to be understood without an external link.

Use this document shape.

```markdown
# [Topic] for [Target Role]

## Role Relevance And Outcomes
- Job requirement and responsibility evidence:
- What the learner will be able to explain, do, and demonstrate:
- Prerequisites and minimum definitions:

## Beginner Foundations
### Plain-Language Explanation
### Glossary
### Core Concepts And How They Connect
### Worked Example
### Beginner Check With Answer Key

## Intermediate Application
### Role Workflow
### Guided Role Scenario
### Practice Task
### Model Answer or Completed Example Solution
### Troubleshooting And Common Failure Modes

## Advanced Judgment
### Trade-offs, Constraints, And Edge Cases
### Quality, Scale, Risk, Or Compliance Considerations
### Advanced Role Case And Recommended Reasoning

## Practical Deliverable
- Instructions:
- Expected artifact:
- Quality criteria:

## Timed Assessment
- Assessment format and why it is relevant:
- Instructions and time limit:
- Questions or scenario:
- Model answer or completed example solution:
- Scoring rubric:
- Result bands and remediation:

## Interview And Evidence Preparation
### Technical Or Role Question With Model Answer
### Truthful evidence prompt

## Retention And Exit Criteria
### Common Misconceptions
### Flashcards
### Final Revision Summary
### I can... Exit Criteria

## References And Further Practice
| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
```

## 2. Lesson Quality Rules

### Beginner Foundations

- Explain the topic in plain language before using specialist terms.
- Define each abbreviation, concept, input, output, and decision rule that matters to the role.
- Use a small worked example with inputs, steps, result, and an explanation of why the result is correct.
- Include answer-keyed checks that test understanding rather than recall alone.

### Intermediate Application

- Convert theory into a repeatable workflow the learner can use in the target role.
- Include a realistic scenario, constraints, and a guided task with enough detail to begin without another tutorial.
- Show a completed solution or give specific, observable evaluation criteria when several solutions are valid.
- Explain common mistakes, how to detect them, and how to correct them.

### Advanced Judgment

- Explain relevant trade-offs, alternatives, failure modes, and the reasons a choice changes with context.
- Cover the scale, performance, reliability, security, cost, quality, regulatory, or stakeholder concerns that apply to the subject.
- Use a role-relevant case that requires prioritization or judgment, then show the recommended reasoning—not only the conclusion.
- Increase emphasis on ownership, ambiguity, communication, and decision-making for senior roles.

### Practical Deliverable And Retention

- Define a practical artifact that demonstrates the competency: analysis, implementation, briefing, workflow, design, checklist, or role-play output.
- State the quality bar and how the learner can review their own work.
- Include misconceptions, flashcards, a concise revision summary, and observable `I can...` exit criteria.

## 3. Assessment Selection And Design

Select only assessment types supported by the job requirements or reasonably implied by the role. Label inferred formats clearly.

| Role signal | Appropriate preparation |
|---|---|
| Build, program, automate, or debug | Timed coding or practical implementation task; code review and trade-off discussion. |
| Query, analyse, model, or report data | Timed SQL/data exercise; interpretation, validation, and stakeholder explanation. |
| Design systems, platforms, or architecture | System-design case; requirements clarification, trade-offs, diagram, and failure modes. |
| Strategize, research, optimize, or advise | Written or verbal case study; prioritization, evidence, recommendation, and risks. |
| Communicate with customers or stakeholders | Role-play or writing sample; clarity, discovery, expectation-setting, and escalation. |
| Operate, assure quality, or manage risk | Practical scenario; triage, controls, incident response, and documentation. |

Every selected assessment must include:

1. A statement of the competency being assessed.
2. Clear instructions, constraints, allowed assumptions, and a realistic time limit.
3. Questions, task data, or a complete scenario.
4. A model answer or completed example solution that explains the reasoning.
5. A Scoring rubric with observable criteria and result bands.
6. Remediation steps linked to the specific scoring weaknesses.

Do not provide answers to a live assessment, impersonate the learner, or make personal claims for them.

## 4. Source Synthesis And References

- Use current, authoritative sources to check facts, terminology, tool behavior, and time-sensitive details.
- Write original explanations and examples. Do not reproduce long source passages.
- Resolve conflicting sources in the lesson; state meaningful uncertainty when it affects a recommendation.
- Put provider, URL, access status, access date when freshness matters, and a concise purpose note only in `References And Further Practice`.
- Treat every reference as optional. If removing the reference would make the lesson incomplete, move the missing explanation into the lesson.

## 5. Completeness Checklist

Before delivering a guide set, confirm:

- [ ] Every required and preferred requirement has one full topic document.
- [ ] The roadmap orders all documents by prerequisite and explains the expected proof of competence.
- [ ] Every topic includes Beginner Foundations, Intermediate Application, and Advanced Judgment.
- [ ] Every major concept has a direct explanation, role-relevant example, and practice check.
- [ ] Every exercise has a completed solution, answer key, or concrete evaluation rubric.
- [ ] Every topic has a practical deliverable and clear exit criteria.
- [ ] Every assessment has a time limit, model answer or completed example solution, Scoring rubric, result bands, and remediation.
- [ ] Every interview or behavioral prompt is truthful, using supplied background or placeholders only.
- [ ] References are optional further practice rather than required learning steps.
- [ ] Markdown and DOCX contain the same roadmap and topic-document content.
