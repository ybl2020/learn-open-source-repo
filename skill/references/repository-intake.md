# Repository Intake

## Purpose

Inspect an unfamiliar repository before installation and turn it into a justified learning scope.

## 1. Confirm the Source

- Record the repository URL or absolute local path.
- Identify the default branch and current revision when available.
- Read the README, license, contribution notes, and release or maintenance signals.
- Avoid assuming a folder name represents its real behavior.

## 2. Identify the Technical Surface

Inspect high-signal files first:

| Area | Common evidence |
|---|---|
| Language | file extensions, runtime manifests |
| Dependencies | package.json, pyproject.toml, requirements.txt, go.mod, Cargo.toml |
| Runtime | .nvmrc, .python-version, Dockerfile, toolchain files |
| Entry points | scripts, main modules, CLI declarations, server startup |
| Examples | examples/, demo/, notebooks/, tutorials/ |
| Tests | test/, tests/, spec/, CI workflows |
| Configuration | example env files, config schemas, compose files |
| Infrastructure | databases, queues, vector stores, cloud services |
| AI dependencies | model names, model size, API provider, embedding model |

## 3. Assess Learning Value

Answer these questions:

1. Is the core technique implemented visibly or hidden behind a library?
2. Are examples incremental and runnable?
3. Can important behavior be observed through output or tests?
4. Does the project require paid services, credentials, large models, or special hardware?
5. Does it match the learner's current level and goal?
6. Is there a smaller module or repository that teaches the same idea more clearly?

Return one recommendation: full course, selected modules, reference only, or replace.

## 4. Resolve the Learning Scope

Use existing context first. When no learning goal is available, present technologies as choices with a one-sentence learning outcome for each.

Example:

```text
1. RAG: learn how external knowledge enters an LLM answer.
2. Vector Database: learn storage and semantic retrieval.
3. Agent: learn planning and tool invocation.
4. Evaluation: learn how to measure answer quality.
```

If the learner cannot choose, include all core technologies and order them by prerequisites. Compress supporting infrastructure without omitting its role.

## 5. Build Two Maps

Create a technical map:

```text
module -> technology -> problem solved -> prerequisites
```

Create a runtime map:

```text
input -> entry point -> core functions -> storage/services -> output
```

These maps determine the curriculum; directory order alone does not.

## 6. Establish the Baseline Safely

- Inspect install and startup scripts before executing them.
- Prefer project-local environments.
- Never write secrets into tracked configuration.
- Explain large downloads and external costs first.
- Start with the smallest representative example.
- Record expected versus actual behavior.
- Explain compatibility shims, symlinks, version pins, and local patches.

## 7. Decide When to Switch

Recommend another project or a minimal teaching implementation when repeated setup work reveals that:

- the maintained runtime is no longer available;
- core logic is inaccessible;
- examples cannot demonstrate the advertised technique;
- dependencies are unsafe or irreparably broken;
- setup cost is disproportionate to learning value.
