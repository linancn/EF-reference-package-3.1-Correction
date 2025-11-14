# Change Log Workflow

1. Make your changes inside `EF-Reference-Package` and commit them as usual.
2. Run `change-log/update_changelog.sh <commit>` (defaults to `HEAD`). The script:
   - Ensures the commit touches `EF-Reference-Package`.
   - Extracts the date, subject, first paragraph of the message body, and the touched files.
   - Appends a new entry to `change-log/change-log.md` unless that commit hash already exists.
3. Review and commit the updated changelog alongside your other changes.

The script can be wired into your CLI workflow (for example as a `post-commit` hook) by invoking it automatically after each successful commit.
