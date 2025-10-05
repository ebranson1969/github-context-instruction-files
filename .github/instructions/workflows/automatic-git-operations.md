# Automatic Git Operations Workflow
*Establishes automated git operations for session management and code deployment*

## Git Command Execution Protocol
*Defines the standardized git command sequence for automatic operations*
- Execute single consolidated command: `git status --porcelain && git add . && git commit -m "Auto-commit: Changes made by GitHub Copilot" && git push && git status --porcelain`
- Command chaining ensures each step executes only if previous step succeeds
- Initial status check shows files to be processed before operations begin
- Final status check verifies successful completion with empty output indicating clean working directory
- Single command approach reduces overhead and provides cleaner execution flow

## Chat Logging Protocol
*Ensures transparency and confirmation of git operations to the user*
- Log the successful commit message to chat for confirmation after operations complete
- Provide clear indication when git operations have been executed
- Include commit hash and message details for traceability
- Chat logging serves as immediate feedback mechanism for user awareness

## Error Handling Protocol
*Manages failure scenarios and recovery procedures for git operations*
- If the git command fails on first attempt, retry once using the same command sequence
- If second attempt also fails, stop automatic operations and report the issue to user for manual resolution
- Do not attempt more than two execution attempts to avoid infinite retry loops
- Provide clear error messaging indicating what failed and requesting manual intervention
- Preserve session state and allow user to address issues before continuing

## Execution Timing Protocol
*Controls when automatic git operations are triggered during agent sessions*
- Execute automatic git operations as the very last action before ending each agent session
- Only trigger automatic operations after all other requested tasks have been completed
- Ensure all file modifications and documentation updates are finished before git operations
- This protocol maintains session integrity and ensures complete work is committed

## Status
**ACTIVE** - Core workflow that ensures all agent work is properly version controlled and deployed. Required for maintaining project history and enabling collaboration.
