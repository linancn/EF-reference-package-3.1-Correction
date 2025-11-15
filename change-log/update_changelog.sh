#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="EF-Reference-Package"
LOG_FILE="change-log/change-log.md"
COMMIT_REF="${1:-HEAD}"

if [ ! -f "$LOG_FILE" ]; then
  cat <<'HDR' > "$LOG_FILE"
# EF Reference Package Change Log

_All entries reflect commits that touch the `EF-Reference-Package` directory._
HDR
fi

if ! git rev-parse --verify "$COMMIT_REF" >/dev/null 2>&1; then
  echo "Commit $COMMIT_REF not found" >&2
  exit 1
fi

changed_files=$(git diff-tree --no-commit-id --name-only -r "$COMMIT_REF" -- "$TARGET_DIR" || true)
if [ -z "$changed_files" ]; then
  echo "Commit $COMMIT_REF does not touch $TARGET_DIR; nothing to do." >&2
  exit 0
fi

short_hash=$(git rev-parse --short "$COMMIT_REF")
commit_date=$(git show -s --format=%cs "$COMMIT_REF")
subject=$(git show -s --format=%s "$COMMIT_REF")
body=$(git show -s --format=%b "$COMMIT_REF" | sed '/^$/q')
file_list=$(printf '%s\n' "$changed_files" | sed "s#^$TARGET_DIR/##" | paste -sd ', ' -)

if grep -q "$short_hash" "$LOG_FILE"; then
  echo "Entry for $short_hash already exists in $LOG_FILE; skipping." >&2
  exit 0
fi

echo >> "$LOG_FILE"
printf '## %s\n' "$commit_date" >> "$LOG_FILE"
printf -- '- %s\n' "$subject" >> "$LOG_FILE"
if [ -n "$body" ]; then
  printf -- '- %s\n' "$body" >> "$LOG_FILE"
fi
printf -- '- Files: %s\n' "$file_list" >> "$LOG_FILE"

echo "Changelog updated for commit $short_hash"
