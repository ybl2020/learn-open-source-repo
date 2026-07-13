# Bilingual Lesson Template

Use all sections unless one is genuinely inapplicable. Keep English technical terminology alongside Chinese when the learner uses Chinese.

## 1. 本节目标 / Lesson Goal

State the concept, observable outcome, and reason it is introduced now.

## 2. 上一课回顾 / Previous Lesson Review

Review only the prior behavior needed to understand the new increment.

## 3. 本节新增了什么 / What This Lesson Adds

Show a before-and-after flow and name the previous problem now addressed.

## 4. 当前完整流程 / Current End-to-End Flow

Show the complete accumulated flow, not only the new component. Use text or Mermaid when it improves clarity.

## 5. 核心概念 / Core Concepts

Explain what each new concept is, why it exists, what happens without it, and how it relates to existing components.

## 6. 代码关键点 / Key Code

Identify input, core functions, important parameters, data structures, and output. Do not translate every line. Preserve English identifiers and add concise Chinese comments when useful.

## 7. 实际运行方式 / How to Run

Provide a reproducible run record, not only a command. Include:

```text
运行状态 / Verification Status: actually run, inferred, or not run
运行环境 / Environment: relevant runtime, model, service, or database
工作目录 / Working Directory: absolute local path when available
前置依赖 / Prerequisites: required files, packages, variables, and services
运行命令 / Command: the exact verified command
成功判断 / Success Signals: the important lines or behavior that prove it worked
失败排查 / Troubleshooting: likely blockers specific to this lesson
```

When the environment and prerequisites are unchanged from prior lessons, summarize them briefly but still provide the working directory, exact command, verification status, and success signals.

The user may not see terminal tool output. Relay the meaningful command output in the lesson instead of saying only that execution succeeded. Mention local adaptations and distinguish commands actually executed from commands provided only for the learner to try.

## 8. 跑通后的结果 / Execution Results

Use actual output. Organize results by code example and tested behavior.

For one representative question, report:

```text
问题 / Query
使用技术 / Techniques Used
处理过程 / Processing Flow
关键中间结果 / Key Intermediate Results
最终结果 / Final Result
结果原因 / Why This Result
合理性判断 / Evaluation
```

When one example contains several questions testing the same behavior, fully explain only the most representative one. Briefly report each remaining query, top result or final result, relevant score, and whether it matched expectations.

When questions test different techniques, branches, edge cases, or failure modes, fully explain each one.

This compression rule applies only to repeated questions inside an example. Keep the normal treatment of Embedding, Vector Store, Top-K, and other recurring foundational technologies unchanged.

## 9. 结果精炼讲解 / Concise Result Explanation

Summarize in plain language what the program just proved. Keep this short.

## 10. 目前还存在什么问题 / Remaining Problems

Inspect actual output for noise, wrong classification, weak thresholds, hallucination, missing grounding, unrealistic test data, performance issues, or discrepancies between claims and implementation.

## 11. 下一课解决什么 / Next Lesson Preview

State the current problem, next technique, and how it is expected to address that problem. Verify the repository's real lesson order before promising the next topic.

## 12. 对你的项目有什么用 / Application

Map to the learner's current real project, remembered project, or stated goal. If none exists, create and clearly label one persistent `Hypothetical Project / 虚拟学习项目`; reuse and extend it in subsequent lessons.

## 13. 一句话总结 / One-Sentence Summary

Provide one accurate sentence suitable for review or interview recall.
