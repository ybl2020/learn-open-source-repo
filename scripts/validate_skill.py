#!/usr/bin/env python3
"""Validate the repository's distributable Codex skill using the standard library."""

from __future__ import annotations

import re
import sys
from pathlib import Path


REQUIRED_PATHS = (
    "SKILL.md",
    "agents/openai.yaml",
    "references/repository-intake.md",
    "references/lesson-template.md",
    "references/teaching-rules.md",
    "references/evaluation-rubric.md",
    "scripts/inspect_repository.sh",
)


def fail(message: str) -> None:
    print(f"ERROR: {message}", file=sys.stderr)
    raise SystemExit(1)


def main() -> None:
    skill_dir = Path(sys.argv[1] if len(sys.argv) > 1 else "skill").resolve()
    if not skill_dir.is_dir():
        fail(f"skill directory does not exist: {skill_dir}")

    for relative_path in REQUIRED_PATHS:
        if not (skill_dir / relative_path).is_file():
            fail(f"missing required file: {relative_path}")

    skill_text = (skill_dir / "SKILL.md").read_text(encoding="utf-8")
    match = re.match(r"^---\n(.*?)\n---\n", skill_text, re.DOTALL)
    if not match:
        fail("SKILL.md must begin with YAML frontmatter")

    frontmatter = match.group(1)
    if not re.search(r"^name:\s*learn-open-source-repo\s*$", frontmatter, re.MULTILINE):
        fail("SKILL.md has an unexpected or missing name")
    if not re.search(r"^description:\s*\S.+$", frontmatter, re.MULTILINE):
        fail("SKILL.md must contain a non-empty description")

    all_text = "\n".join(
        path.read_text(encoding="utf-8")
        for path in skill_dir.rglob("*")
        if path.is_file() and path.suffix in {".md", ".yaml", ".sh"}
    )
    if "[TODO" in all_text or re.search(r"\bTODO:\s", all_text):
        fail("unfinished TODO placeholder found")

    openai_yaml = (skill_dir / "agents/openai.yaml").read_text(encoding="utf-8")
    if 'display_name: "从零开始学习开源项目"' not in openai_yaml:
        fail("agents/openai.yaml has an unexpected display name")
    if "$learn-open-source-repo" not in openai_yaml:
        fail("default prompt must mention $learn-open-source-repo")

    print(f"Skill validation passed: {skill_dir}")


if __name__ == "__main__":
    main()
