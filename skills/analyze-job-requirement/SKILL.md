---
name: analyze-job-requirement
description: Analyze job requirements and job descriptions from pasted text, files, or URLs. Use when Codex needs to extract and explain a role's purpose, responsibilities, required and preferred qualifications, skills, domain knowledge, tools, seniority level, hiring priorities, candidate-fit signals, or gaps from a job posting or role description.
---

# Analyze Job Requirement

## Overview

Analyze a job posting into a structured, evidence-aware brief that separates what the posting explicitly says from reasonable inferences. Support both pasted job text and URLs supplied by the user.

Read [job-analysis-rubric.md](references/job-analysis-rubric.md) when producing a full analysis, comparing a candidate profile against a role, or when the user asks for a structured output.

## Workflow

1. Acquire the job description.
   - If the user provides pasted text, use it as the primary source.
   - If the user provides a URL, browse or fetch the page and extract the job title, company, location, employment type, compensation if present, responsibilities, qualifications, and application context.
   - If URL content is inaccessible, state the access issue and ask the user for pasted text or a file.
   - If both pasted text and a URL are provided, prefer pasted text for analysis and use the URL only to verify context unless the user says otherwise.

2. Clean and preserve evidence.
   - Remove navigation, cookie notices, repeated boilerplate, unrelated job recommendations, and generic company marketing unless it affects role expectations.
   - Preserve exact phrasing for important requirements, but quote sparingly.
   - Track whether each major point is explicit, implied, or uncertain.

3. Classify the role.
   - Identify the role family, likely seniority, business function, reporting or collaboration context, and primary outcomes.
   - Infer seniority from ownership scope, decision authority, stakeholder level, ambiguity, years of experience, and required depth.
   - Do not overstate seniority when the posting is vague.

4. Extract role responsibilities.
   - Group responsibilities by workstream rather than copying bullet order.
   - Distinguish core daily work, strategic ownership, cross-functional collaboration, leadership or mentorship, operational duties, and measurable outcomes.
   - Note responsibilities that imply hidden expectations, such as customer-facing work, production support, travel, compliance, or deadline pressure.

5. Extract qualifications and required knowledge.
   - Separate must-have qualifications from preferred or nice-to-have qualifications.
   - Identify required technical skills, domain knowledge, methodologies, credentials, soft skills, language requirements, tools, platforms, and regulatory or industry knowledge.
   - Flag requirements that appear unusually broad, ambiguous, inflated, or potentially negotiable.

6. Produce a structured answer.
   - Use concise headings and tables when useful.
   - Include "Evidence" or "Why this matters" notes for high-impact claims.
   - Include uncertainty notes when the posting lacks detail.
   - Tailor depth to the user's goal: quick summary, candidate fit, interview prep, resume targeting, or hiring calibration.

## Output Shape

For a standard analysis, include:

- Role snapshot: title, company, location/work mode, level, role type, likely team, and overall purpose.
- Responsibilities: grouped themes with practical interpretation.
- Required qualifications: hard must-haves and likely screening criteria.
- Preferred qualifications: differentiators that may strengthen a candidate.
- Knowledge and skills map: technical, domain, process, tool, and interpersonal skills.
- Seniority and scope: expected autonomy, ownership, stakeholder complexity, and delivery expectations.
- Hiring priorities: what the employer appears to value most.
- Ambiguities or risks: missing information, vague requirements, possible workload signals, or contradictions.
- Candidate preparation notes when relevant: resume keywords, portfolio evidence, interview topics, or learning gaps.

## URL Handling

Use live browsing when a URL is provided because job posts change or expire. Cite the URL used and mention the access date when helpful. If the page includes structured job data, prefer it for metadata but still inspect visible page content for context and caveats.

Do not invent requirements that are not in the source. When using inference, label it clearly, such as "likely", "implied by", or "not stated, but suggested by".

## Quality Checks

Before responding:

- Verify that responsibilities and qualifications are not mixed together.
- Verify that must-have and preferred qualifications are separated.
- Verify that inferred points are labeled as inference.
- Verify that the analysis answers the user's stated use case, not just the default schema.
- If the posting is thin, say so and explain which details are missing.
