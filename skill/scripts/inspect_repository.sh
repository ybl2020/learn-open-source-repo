#!/usr/bin/env bash
set -eu

root="${1:-.}"

if [ ! -d "$root" ]; then
  printf 'Repository path does not exist: %s\n' "$root" >&2
  exit 1
fi

root="$(cd "$root" && pwd)"

printf 'Repository: %s\n' "$root"
if git -C "$root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf 'Branch: %s\n' "$(git -C "$root" branch --show-current 2>/dev/null || true)"
  printf 'Revision: %s\n' "$(git -C "$root" rev-parse --short HEAD 2>/dev/null || true)"
fi
printf 'Size: %s\n' "$(du -sh "$root" 2>/dev/null | awk '{print $1}')"

printf '\nHigh-signal files:\n'
find "$root" -maxdepth 2 -type f \
  \( -iname 'readme*' -o -iname 'license*' -o -name 'package.json' \
  -o -name 'pyproject.toml' -o -name 'requirements*.txt' -o -name 'go.mod' \
  -o -name 'Cargo.toml' -o -name 'Dockerfile*' -o -name 'docker-compose*.yml' \
  -o -name 'compose*.yml' -o -name '.nvmrc' -o -name '.python-version' \
  -o -name '.env.example' -o -name '*.example.env' \) \
  -print | sed "s#^$root/##" | sort | head -80

printf '\nTop-level structure:\n'
find "$root" -mindepth 1 -maxdepth 2 \
  \( -path '*/.git' -o -path '*/node_modules' -o -path '*/.venv' -o -path '*/venv' \) -prune \
  -o -print | sed "s#^$root/##" | sort | head -120

printf '\nLikely examples and tests:\n'
find "$root" -maxdepth 3 \
  \( -type d \( -name .git -o -name node_modules -o -name .venv -o -name venv -o -name dist -o -name build \) -prune \) \
  -o \( -type d \( -iname 'examples' -o -iname 'example' -o -iname 'demo' \
  -o -iname 'tutorials' -o -iname 'tests' -o -iname 'test' -o -iname 'spec' \) \
  -o -type f \( -iname '*test*' -o -iname '*spec*' \) \) \
  -print | sed "s#^$root/##" | sort | head -100

printf '\nCommon source file counts:\n'
find "$root" -type d \( -name .git -o -name node_modules -o -name .venv -o -name venv -o -name dist -o -name build \) -prune \
  -o -type f -print | awk '
    function ext(path) {
      n = split(path, parts, ".")
      return n > 1 ? tolower(parts[n]) : "[none]"
    }
    { counts[ext($0)]++ }
    END { for (kind in counts) print counts[kind], kind }
  ' | sort -nr | head -20
