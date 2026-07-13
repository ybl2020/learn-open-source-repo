# Canvasight Cumulative Learning Map

## Purpose

Turn each repository course into one persistent, editable Canvasight Page that grows through lessons and follow-up questions. Preserve the learning journey, not only the first explanation.

## Availability and Integrity

- Use Canvasight only when its graph tools are callable.
- Read the current Page with `get_canvasight_graph_context` before follow-up edits.
- Create the course Page with `write_canvasight_graph` in `append-page` mode only once.
- Use `merge-active-page` with the latest `documentRevision` for lesson additions, questions, revisions, and finalization.
- Preserve unrelated nodes, edges, and user-adjusted positions.
- Never hand-edit `.scatter/scatter.json` or claim a write succeeded without tool evidence.
- Open or refresh the canvas only when the learner wants to inspect it.

When Canvasight is unavailable, keep the lesson digest and question records pending. Clearly state that the canvas was not updated.

## One Course, One Cumulative Page

Use one Page per learned repository, for example:

```text
RAG from Scratch - Learning Map
```

Use stable IDs:

```text
course-root
module-foundations
lesson-01
lesson-01-questions
current-pipeline
open-problems
```

Do not create a new Page for every lesson. Add module and lesson branches to the existing Page.

## Recommended Structure

```text
Course Root
├── Module
│   ├── Lesson
│   └── Questions & Clarifications
├── Current Pipeline
└── Open Problems
```

Keep one primary responsibility per node:

- `Lesson`: compact lesson digest.
- `Questions & Clarifications`: question trail for that lesson.
- `Current Pipeline`: latest accumulated runtime or conceptual flow.
- `Open Problems`: unresolved technical or learning gaps.

Split an important question into its own node only when it becomes an independently useful concept. Avoid one node per minor question.

Use only real relationships:

- module to lesson: `containment`;
- previous lesson to next lesson: `sequence`;
- prerequisite concept to dependent lesson: `dependency`;
- verified experiment to conclusion: `evidence`.

## Lesson Lifecycle

Use three states:

```text
Draft -> Learning -> Completed
```

- `Draft`: initial lesson digest exists; follow-up understanding is not yet captured.
- `Learning`: substantive learner questions or experiments are active.
- `Completed`: questions were consolidated before moving on; unresolved items remain visible.

Completed lessons remain editable. A later retrospective question updates the original lesson and records that it was asked during a later lesson.

## Question Capture

Capture every substantive question about course concepts, code, runtime, results, relationships, or application. Do not treat simple navigation commands as learning questions.

Record:

```text
Question ID
User Question
Confusion Anchor
Missing Understanding
Cause
Clarification
Evidence
Understanding Update
Status
```

Assign IDs by lesson, such as `Q10-01`.

`Confusion Anchor` must identify the most specific known source:

```text
lesson section -> example -> query/result -> concept/function/parameter
```

If the anchor is inferred, label it as inferred. Describe `Cause` as the explanation or material gap that produced the question, not as a learner deficiency.

Example:

```text
Q10-02
Question: Why does RRF use rank instead of similarity score?
Confusion Anchor: Example 3 - RRF score fusion
Missing Understanding: Scores from separate query result lists may not be comparable.
Cause: The lesson introduced the formula before explaining cross-query score scales.
Clarification: RRF uses rank positions to avoid direct score-scale comparison.
Evidence: A document ranked first across three queries receives three RRF contributions.
Status: Resolved
```

## Real-Time Updates

When Canvasight supports live merge operations:

1. Create or update the lesson digest as `Draft` after the initial lesson.
2. On each substantive question, locate the correct lesson, append or revise its question record, and set the lesson to `Learning`.
3. Update the affected lesson explanation when the question exposes a teaching gap.
4. Keep unresolved questions visible.

Do not wait for finalization to preserve questions, and do not mark the lesson complete during the initial explanation.

## Finalize Before the Next Lesson

Treat `continue the next lesson`, `finish this lesson`, and `summarize this lesson` as finalization triggers.

Before starting the next lesson:

1. Read the active Page and latest lesson state.
2. Gather every question assigned to the current lesson.
3. Integrate resolved clarifications into the relevant digest fields.
4. Preserve the question trail and evidence.
5. List unresolved questions without inventing closure.
6. Update `Current Pipeline` and `Open Problems`.
7. Set the lesson to `Completed`.
8. Then start the next lesson as `Draft`.

## Initial Backfill

When Canvasight is first enabled after several lessons are complete:

- create one Page;
- backfill concise lesson digests in lesson order;
- group lessons into real conceptual modules;
- add sequence and containment edges;
- add current pipeline and open problems;
- mark historical states truthfully from available evidence;
- do not invent questions that were not asked.

For Canvasight graph classification, a repository learning map normally fits `organize` or `refine`, primary domain `codebase`, maturity `define`, and output `system-map`. Follow the installed Canvasight Graph Writer's current validation contract when it differs.
