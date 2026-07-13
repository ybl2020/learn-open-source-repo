---
name: learn-open-source-repo
description: Turn an open-source repository into a goal-aware, runnable, bilingual course with repository triage, environment setup, real execution evidence, incremental lessons, experiments, evaluation, and transfer to a real or hypothetical project. Use when a user provides or references a GitHub/GitLab repository or local clone and asks to learn it, understand its architecture or technologies, run it from scratch, split it into lessons, continue the next lesson, explain its examples, or adapt its techniques into a personal project.
---

# Learn Open Source Repo

Teach through the repository rather than merely summarizing it or getting it to start. Move the learner from explanation to reading, modification, verification, and transfer.

## Core Rules

- Use actual repository code and actual execution output as the primary evidence.
- Make every runnable lesson independently reproducible: state the working directory, exact command, whether it was actually executed, and the visible signals that prove success.
- Distinguish expected documentation output from locally observed output.
- Preserve English technical terms alongside Chinese explanations when teaching in Chinese.
- Do not treat successful startup as proof of understanding.
- Do not treat a correct LLM answer as proof that retrieval or grounding worked.
- Explain local compatibility fixes and avoid silently changing instructional behavior.
- Give a concise progress update whenever meaningful work has taken about one minute without visible progress.
- Keep moving through setup failures; change approach or recommend a better repository when the current one is a poor teaching vehicle.

## Workflow

### 1. Resolve the Learning Goal

Check the current request, conversation, and available memory for a concrete learning goal.

- If a goal exists, identify the repository technologies relevant to it and emphasize those technologies.
- If no goal exists, inspect the repository, present the major technologies as understandable choices, and ask the user what to emphasize.
- If the user does not know or chooses everything, teach all core technologies in prerequisite order. Do not interpret "all" as a mechanical file-by-file tour.

### 2. Triage the Repository

Read [references/repository-intake.md](references/repository-intake.md). Inspect before installing. Determine project purpose, maintenance state, license, language, framework, dependency manager, entry points, examples, tests, infrastructure, external services, model downloads, secrets, hardware needs, and likely learning value.

Run `scripts/inspect_repository.sh <local-repository-path>` when a local clone exists. Treat its output as orientation, then verify important conclusions by reading the relevant files.

Classify the repository as one of:

- suitable for full learning;
- suitable for selected modules;
- useful as reference but poor to run;
- too abstract or prebuilt for the learner's goal;
- outdated or blocked enough to replace.

### 3. Build the Technical and Runtime Maps

Convert directories into a learning map. Identify entry points, core logic, teaching examples, infrastructure, and tests. Trace one real input through functions, storage, retrieval or processing, and final output.

Do not infer behavior from names alone. Read the implementation that actually runs.

### 4. Establish a Runnable Baseline

Check runtime versions, dependencies, disk space, models, services, environment variables, GPU requirements, and paid APIs. Explain large downloads before starting them. Keep secrets in environment variables.

Run the smallest meaningful example first. Record the command, actual output, elapsed time when useful, errors, and any compatibility adjustments.

### 5. Design the Curriculum

Order lessons by conceptual dependency, normally:

```text
minimal principle -> data preparation -> core mechanism -> complete flow
-> quality improvements -> performance -> testing/evaluation -> transfer
```

Each lesson must add a limited number of concepts and explicitly state which previous problem the new step addresses. Prefer runnable examples over passive documentation tours.

### 6. Teach and Verify Each Lesson

Follow [references/lesson-template.md](references/lesson-template.md). Read the lesson code, its concept notes, the previous lesson, and the next lesson before teaching. Run the example and base the explanation on observed results.

For multiple questions inside one code example, group them by tested behavior:

- If they test the same function, explain one representative question in full and report the remaining actual results briefly.
- If they test different functions or failure modes, explain each one in full.
- Do not reduce the normal explanation of recurring foundational technologies; this compression applies only to repeated questions within an example.

Add a small prediction-and-verification exercise at meaningful milestones. Ask the learner to predict what changing an input or parameter will do, then run and analyze it when they are ready.

### 7. Map the Lesson to a Project

Use this priority:

```text
current real project -> remembered project -> stated career/learning goal
-> persistent hypothetical learning project
```

If no real project maps naturally, create one clearly labeled `Hypothetical Project / 虚拟学习项目`. Keep using the same project across later lessons and extend it as new capabilities appear. Do not invent a new project for every lesson.

### 8. Evaluate Learning and Close the Loop

Use [references/evaluation-rubric.md](references/evaluation-rubric.md) at module boundaries. Evaluate whether the learner can explain, locate, modify, verify, and transfer the technique.

End the repository course with:

- an architecture and data-flow explanation;
- the learner's verified experiments;
- known limitations and design trade-offs;
- a transfer plan for the real or hypothetical project;
- truthful resume and interview phrasing when relevant.

## Failure Handling

- If installation fails, verify runtime and lockfiles, isolate the environment, and try the smallest example.
- If the repository hides all core behavior behind a framework, locate the lower-level call or create a minimal equivalent teaching example beside the original.
- If the repository is huge, teach the goal-relevant slice first and expand later.
- If an example is wrong, show the expected behavior, actual behavior, cause, and scoped fix.
- If a source cannot be run, teach from code only after clearly labeling that the behavior was not locally verified.

## Resources

- [references/repository-intake.md](references/repository-intake.md): repository inspection and learning-scope decisions.
- [references/lesson-template.md](references/lesson-template.md): required bilingual lesson format and example-result rules.
- [references/teaching-rules.md](references/teaching-rules.md): evidence, interaction, experiment, and transfer guidance.
- [references/evaluation-rubric.md](references/evaluation-rubric.md): learning checkpoints and completion criteria.
- `scripts/inspect_repository.sh`: safe, read-only local repository orientation.
