# Manual Git Trigger Workflow
*Provides user-initiated git operations through standardized trigger phrase*

## Trigger Recognition Protocol
*Defines the exact conditions that activate manual git operations*
- Activate when user types "PUSH CODE" in all uppercase letters as the only content in their message
- Trigger must be the complete message content with no additional text or characters
- Case sensitivity is enforced - only uppercase "PUSH CODE" will activate the workflow
- Immediate recognition and execution without confirmation prompts or delays

## Command Execution Protocol
*Ensures consistent git operations for manual triggers*
- Use identical git command sequence as defined in Automatic Git Operations workflow
- Execute: `git status --porcelain && git add . && git commit -m "Auto-commit: Changes made by GitHub Copilot" && git push && git status --porcelain`
- Maintain same error handling and retry logic as automatic operations
- Provide git operation results and status reporting without session logging

## Processing Restriction Protocol
*Prevents other operations when manual trigger is detected*
- No other processing should occur when "PUSH CODE" trigger is detected
- Skip normal question analysis, research, and documentation workflows
- Skip session logging protocols for manual git triggers
- Focus exclusively on git operations without additional agent actions
- Return control to user immediately after git operations complete

## Status
**ACTIVE** - Provides immediate git operations capability for users who want to deploy changes on demand. Complements automatic workflow by giving users direct control over deployment timing without session overhead.
