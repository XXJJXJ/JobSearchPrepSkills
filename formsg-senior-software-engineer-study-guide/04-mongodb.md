# MongoDB and NoSQL Data Modelling for FormSG

## Role Relevance and Outcomes

- **Evidence:** The posting requires MongoDB or similar NoSQL experience and APIs that serve real traffic.
- **Outcome:** Design collections, indexes, and consistency boundaries from actual access patterns.
- **Definitions:** A *document* is a JSON-like persisted record; an *index* is a data structure that accelerates selected queries; an *access pattern* is the query or update the product repeatedly needs.

## Beginner Foundations

### Plain-Language Explanation

MongoDB stores documents rather than rows, but data modelling still begins with relationships, correctness, and query needs. “Schema flexible” is not “schema absent.” Sensitive submission systems require validation, explicit ownership, retention decisions, and deliberate indexes.

### Glossary

- **Embedding:** storing related data inside one document.
- **Referencing:** storing a related document’s identifier instead of its full contents.
- **Compound index:** an index across ordered multiple fields.
- **Cardinality:** how many related records may exist, for example one form to many submissions.

### Core Concepts and How They Connect

Choose embedding when related data is bounded, read together, and updated together. Choose references when it is unbounded, independently protected, or independently updated. Start with known reads and writes, then propose indexes. Each index costs write throughput and storage, so measure rather than index every field.

### Worked Example: Submission Lookup

The owner needs a recent-submissions list per form, and a particular submission by receipt ID.

```js
// Collection: submissions
{ _id, formId, receiptId, status, submittedAt, encryptedPayloadRef }

db.submissions.createIndex({ formId: 1, submittedAt: -1 })
db.submissions.createIndex({ receiptId: 1 }, { unique: true })
```

The first index matches the list’s filter and sort. The unique receipt index makes lookup fast and prevents accidental duplicate receipt IDs. Do not index plaintext sensitive answers merely for convenience.

### Beginner Check With Answer Key

**Check:** Why is a wildcard “index every field” approach risky?  
**Answer:** It increases storage and write cost, may make sensitive-field queries easier than intended, and still may not match the product’s important query shape. Index the verified access patterns.

## Intermediate Application

### Role Workflow

1. List reads, writes, retention, actors, and expected volume for each entity.
2. Mark sensitive fields and decide whether business logic needs them searchable.
3. Choose document boundaries and unique constraints/invariants.
4. Add indexes that match filters and sort order; inspect query plans and real metrics.
5. Plan migrations, backfills, and rollback before a schema change reaches production.

### Guided Role Scenario

Delegated completion introduces many respondent invites per form but one submission per form response. Store bounded invite metadata with the response only if the confidentiality and growth bounds are clear. Otherwise use an `invites` collection keyed by response/form and recipient, with a unique active-invite invariant and minimal data exposed to owners.

### Practice Task

For `invites(formResponseId, recipientId, status, expiresAt)`, propose indexes for: (a) owner sees active invites for a response; (b) recipient opens an invite; (c) expiry worker locates expired active invites.

### Model Answer or Completed Example Solution

- `{ formResponseId: 1, status: 1 }` for owner view.
- `{ recipientId: 1, status: 1 }` for recipient view; include a separate opaque invite token lookup if that is the access method.
- `{ status: 1, expiresAt: 1 }` for bounded expiry scans.
- Add a carefully designed unique constraint/index for the actual business invariant, for example one active invite for the same response/recipient, if product rules require it. Explain why status changes affect the constraint design.

### Troubleshooting and Common Failure Modes

| Symptom | Likely cause | First check | Correction |
|---|---|---|---|
| List query slows as data grows | Missing/misaligned index | Query plan and scanned documents | Add measured compound index |
| Document nears size/latency limits | Unbounded embedding | Cardinality and document growth | Reference independent/unbounded data |
| Duplicate logical record | Invariant only in application code | Concurrent write test | Add atomic operation / unique constraint |

## Advanced Judgment

Transactions can protect multi-document invariants, but they are not a substitute for a coherent model and may have cost/operational implications. Sensitive data drives boundaries: encrypt or isolate payload according to the threat model; minimise replicas of sensitive values; decide access at query and response layers. For evolving form definitions, store the version used for a submission so historical answers retain their meaning.

**Case:** Product asks to search all free-text answers to help agencies find cases. Do not immediately index response content. Clarify legal authority, actor permissions, retention, auditability, encryption/search trade-off, and whether a narrower metadata search solves the outcome.

## Practical Deliverable

- **Instructions:** Produce a one-page data design for the capstone: collection boundaries, fields, access rules, invariants, three queries, and indexes.
- **Expected artifact:** Diagram/table plus query explanations and migration plan.
- **Quality criteria:** Each index has an access-pattern reason; sensitive values are not unnecessarily indexed/logged; historical form version is preserved.

## Timed Assessment

**Format:** 40-minute data/system-design exercise.  
**Prompt:** A recent-submissions page becomes slow after 20× growth. Diagnose and propose a safe index rollout.  
**Model answer:** Capture the exact filter/sort and query-plan evidence; add an index matching the query; assess build impact; monitor latency/write cost; roll out/rollback with an operational plan.  

| Criterion | Strong | Partial | Missing |
|---|---|---|---|
| Model | Access-pattern-driven | Generic collection design | Treats NoSQL as schema-free |
| Performance | Query-plan/index rationale | Says “add index” | No evidence or cost awareness |
| Security | Identifies sensitive fields/boundaries | Mentions encryption only | Indexes/logs data indiscriminately |

**Bands:** Ready: 8–10; Developing: 5–7, practise compound indexes and invariants; Foundation needed: below 5.

## Interview and Evidence Preparation

**Question:** “How do you decide whether to embed or reference in MongoDB?”  
**Model answer:** “I start with boundedness, read/write co-location, ownership/security boundary, and query patterns. I then validate the choice against growth, update frequency, and required consistency—not an abstract rule about document databases.”

**Truthful evidence prompt:** Select a database design you made or studied. Explain the access pattern, the trade-off, and what evidence would make you change it.

## Retention and Exit Criteria

- **Misconception:** “NoSQL means no schema design.” Correction: application/schema validation and domain invariants remain essential.
- **Flashcard:** What determines a good compound-index order? **Answer:** The actual filter, sort, and selectivity needs of the query.
- **Revision summary:** Model for reads and invariants; index measured queries; protect sensitive values and historical meaning.
- **I can:** defend collection/index choices for a multi-respondent submission system.

## References and Further Practice

| Provider | Resource | Access | Why it is optional |
|---|---|---|---|
| MongoDB | [MongoDB documentation](https://www.mongodb.com/docs/) | Free, accessed 20 June 2026 | Verify driver, modelling, security, and operational details. |
| MongoDB | [Index types](https://www.mongodb.com/docs/current/core/indexes/index-types/) | Free, accessed 20 June 2026 | Practise current indexing options. |
