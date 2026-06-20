#!/usr/bin/env sh

# Validate the non-negotiable structure of a novice-complete Markdown study guide.
# Semantic depth is evaluated with references/lesson-depth-quality-gates.md.

set -u

guide_dir=${1:-}

if [ -z "$guide_dir" ] || [ ! -d "$guide_dir" ]; then
  printf '%s\n' "Usage: $0 <study-guide-directory>" >&2
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
  if ! rg -Fq "$heading" "$file"; then
    printf '%s\n' "Missing required heading in $file: $heading" >&2
    failures=$((failures + 1))
  fi
}

require_file "00-study-roadmap.md"
require_file "00-requirement-coverage-map.md"

if ! find "$guide_dir" -maxdepth 1 -type f -name '[0-9][0-9]-*foundation*.md' | grep -q .; then
  printf '%s\n' "Missing a numbered foundation lesson (expected a filename containing 'foundation')." >&2
  failures=$((failures + 1))
fi

topic_list=$(mktemp)
trap 'rm -f "$topic_list"' EXIT HUP INT TERM

find "$guide_dir" -maxdepth 1 -type f -name '[0-9][0-9]-*.md' ! -name '00-*.md' -print > "$topic_list"
sort -o "$topic_list" "$topic_list"

topic_count=0
while IFS= read -r topic_file; do
  [ -n "$topic_file" ] || continue
  topic_count=$((topic_count + 1))
  require_heading "$topic_file" "## Role Relevance and Outcomes"
  require_heading "$topic_file" "## Learner Readiness and Concept Map"
  require_heading "$topic_file" "## Beginner Foundations"
  require_heading "$topic_file" "## Worked Path 1: Guided Baseline"
  require_heading "$topic_file" "## Worked Path 2: Failure, Edge Case, or Trade-off"
  require_heading "$topic_file" "## Intermediate Application"
  require_heading "$topic_file" "## Advanced Judgment"
  require_heading "$topic_file" "## Practical Deliverable"
  require_heading "$topic_file" "## Timed Assessment"
  require_heading "$topic_file" "## Interview and Evidence Preparation"
  require_heading "$topic_file" "## Retention and Exit Criteria"
  require_heading "$topic_file" "## References and Further Practice"
done < "$topic_list"

if [ "$failures" -gt 0 ]; then
  printf '%s\n' "Study-guide validation failed with $failures issue(s)." >&2
  exit 1
fi

printf '%s\n' "Study-guide structure validation passed."
