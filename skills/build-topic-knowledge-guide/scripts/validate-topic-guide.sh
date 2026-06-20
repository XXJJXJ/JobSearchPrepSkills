#!/usr/bin/env sh

# Validate the structural contract for Markdown guides created by build-topic-knowledge-guide.
# Semantic depth still requires manual review with references/guide-quality-rubric.md.

set -u

guide_dir=${1:-}
min_questions=${TOPIC_GUIDE_MIN_QUESTIONS:-8}

if [ -z "$guide_dir" ] || [ ! -d "$guide_dir" ]; then
  printf '%s\n' "Usage: $0 <knowledge-guide-directory>" >&2
  exit 2
fi

failures=0

require_file() {
  if [ ! -f "$guide_dir/$1" ]; then
    printf '%s\n' "Missing required document: $1" >&2
    failures=$((failures + 1))
  fi
}

require_heading() {
  file=$1
  heading=$2
  if [ ! -f "$file" ] || ! rg -Fq "$heading" "$file"; then
    printf '%s\n' "Missing required heading in $file: $heading" >&2
    failures=$((failures + 1))
  fi
}

main="$guide_dir/00-study-guide.md"
cheats="$guide_dir/99-cheat-sheets-and-checklist.md"

require_file "00-study-guide.md"
require_file "99-cheat-sheets-and-checklist.md"

require_heading "$main" "## How to Use This Guide"
require_heading "$main" "## Table of Contents"
require_heading "$main" "## Knowledge Map"
require_heading "$main" "## Study Sequence"
require_heading "$main" "## Final Readiness"
require_heading "$main" "## References and Further Practice"

require_heading "$cheats" "# Cheat Sheets and Final Checklist"
require_heading "$cheats" "## High-Yield Recall"
require_heading "$cheats" "## One-Page Cheat Sheets"
require_heading "$cheats" "## Diagnostic Paths"
require_heading "$cheats" "## Compare and Choose"
require_heading "$cheats" "## Memory Drills"
require_heading "$cheats" "## Final Checklist"

if [ -f "$main" ]; then
  question_count=$(rg -n '^### Q[0-9]+\.[0-9]+[[:space:]]*-' "$main" | wc -l | tr -d ' ')
  if [ "$question_count" -lt "$min_questions" ]; then
    printf '%s\n' "Expected at least $min_questions numbered Q&A headings in 00-study-guide.md; found $question_count." >&2
    failures=$((failures + 1))
  fi

  if ! rg -Fq "### Common Failure Modes" "$main"; then
    printf '%s\n' "Missing at least one Common Failure Modes section in 00-study-guide.md." >&2
    failures=$((failures + 1))
  fi

  if ! rg -Fq "Key concepts:" "$main"; then
    printf '%s\n' "Missing Key concepts recall line in 00-study-guide.md." >&2
    failures=$((failures + 1))
  fi
fi

if rg -n 'TODO|TBD|\[TODO\]' "$guide_dir" >/dev/null 2>&1; then
  printf '%s\n' "Guide contains TODO/TBD placeholders." >&2
  failures=$((failures + 1))
fi

if [ "$failures" -gt 0 ]; then
  printf '%s\n' "Topic guide validation failed with $failures issue(s)." >&2
  exit 1
fi

printf '%s\n' "Topic guide structure validation passed."
