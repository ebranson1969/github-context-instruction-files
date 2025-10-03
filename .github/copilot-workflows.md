# Copilot Workflows

### Automatic Git Operations Workflow
*Establishes automated git operations for session management and code deployment*

**Git Command Execution Protocol**
*Defines the standardized git command sequence for automatic operations*
- Execute single consolidated command: `git status --porcelain && git add . && git commit -m "Auto-commit: Changes made by GitHub Copilot" && git push && git status --porcelain`
- Command chaining ensures each step executes only if previous step succeeds
- Initial status check shows files to be processed before operations begin
- Final status check verifies successful completion with empty output indicating clean working directory
- Single command approach reduces overhead and provides cleaner execution flow

**Chat Logging Protocol**
*Ensures transparency and confirmation of git operations to the user*
- Log the successful commit message to chat for confirmation after operations complete
- Provide clear indication when git operations have been executed
- Include commit hash and message details for traceability
- Chat logging serves as immediate feedback mechanism for user awareness

**Error Handling Protocol**
*Manages failure scenarios and recovery procedures for git operations*
- If the git command fails on first attempt, retry once using the same command sequence
- If second attempt also fails, stop automatic operations and report the issue to user for manual resolution
- Do not attempt more than two execution attempts to avoid infinite retry loops
- Provide clear error messaging indicating what failed and requesting manual intervention
- Preserve session state and allow user to address issues before continuing

**Execution Timing Protocol**
*Controls when automatic git operations are triggered during agent sessions*
- Execute automatic git operations as the very last action before ending each agent session
- Only trigger automatic operations after all other requested tasks have been completed
- Ensure all file modifications and documentation updates are finished before git operations
- This protocol maintains session integrity and ensures complete work is committed

**Status**: ACTIVE
*Core workflow that ensures all agent work is properly version controlled and deployed. Required for maintaining project history and enabling collaboration.*

---

### Manual Git Trigger Workflow
*Provides user-initiated git operations through standardized trigger phrase*

**Trigger Recognition Protocol**
*Defines the exact conditions that activate manual git operations*
- Activate when user types "PUSH CODE" in all uppercase letters as the only content in their message
- Trigger must be the complete message content with no additional text or characters
- Case sensitivity is enforced - only uppercase "PUSH CODE" will activate the workflow
- Immediate recognition and execution without confirmation prompts or delays

**Command Execution Protocol**
*Ensures consistent git operations for manual triggers*
- Use identical git command sequence as defined in Automatic Git Operations workflow
- Execute: `git status --porcelain && git add . && git commit -m "Auto-commit: Changes made by GitHub Copilot" && git push && git status --porcelain`
- Maintain same error handling and retry logic as automatic operations
- Provide git operation results and status reporting without session logging

**Processing Restriction Protocol**
*Prevents other operations when manual trigger is detected*
- No other processing should occur when "PUSH CODE" trigger is detected
- Skip normal question analysis, research, and documentation workflows
- Skip session logging protocols for manual git triggers
- Focus exclusively on git operations without additional agent actions
- Return control to user immediately after git operations complete

**Status**: ACTIVE
*Provides immediate git operations capability for users who want to deploy changes on demand. Complements automatic workflow by giving users direct control over deployment timing without session overhead.*

---

### Manual Context Sync Workflow (COMMIT CONTEXT)
*Provides user-initiated complete project synchronization by replacing project content with .github directory contents and standardized README template*

**Trigger Recognition Protocol**
*Defines the exact conditions that activate manual context sync operations*
- Activate when user types `COMMIT CONTEXT` in all uppercase letters as the only content in their message
- Trigger must be the complete message content with no additional text or characters
- Case sensitivity is enforced - only uppercase `COMMIT CONTEXT` will activate the workflow
- Immediate recognition and execution without confirmation prompts or delays

**Project Reset Protocol**
*Completely resets project to .github directory contents*
- Delete all files and directories in the project root EXCEPT the .github directory
- This includes removing: documents/, instructions/, prompts/, README.md, and all context files in root
- Preserve only the .github directory and its contents during the deletion phase
- Ensure complete project cleanup before synchronization begins

**README Template Replacement Protocol**
*Creates standardized template repository README in project root from stored template*
- Copy the README-template.md file from .github directory to project root as README.md
- This replaces any existing README.md with the standardized template repository documentation
- Template content explains branch strategy, usage instructions, deployment workflow, and development notes
- README content is sourced from .github/README-template.md to ensure consistency and maintainability
- This step occurs after deletion but before .github directory synchronization

**Complete Synchronization Protocol**
*Copies all .github contents to project root excluding README files and removes .github directory*
- Copy ALL files from .github directory to the parent directory EXCEPT README.md files
- Copy ALL subdirectories and their contents from .github to the parent directory EXCEPT README.md files
- Exclude all README.md files from the synchronization process (preserves the template README created in previous step)
- Maintain exact file structure and permissions during the copy operation
- After successful copy, delete the entire .github directory and all its contents
- Verify the copy by checking that all original .github files (except READMEs) now exist in the parent directory

**Validation and Execution Protocol**
*Validates complete sync and controls git execution*
- Verify that .github directory no longer exists after the operation
- Verify that all original .github files (except README.md files) now exist in the project root
- Verify that the template README.md file exists in project root with correct content
- If validation passes, execute the `PUSH CODE` command (Manual Git Trigger Workflow)
- If validation fails, report the issue to the user and do not execute `PUSH CODE`
- Do not attempt more than two execution attempts to avoid infinite retry loops
- Provide clear error messaging indicating what failed and request manual intervention if needed

**Command Execution Protocol**
*Executes git operations after successful complete sync*
- Use identical git command sequence as defined in Automatic Git Operations workflow
- Ensure all file modifications and project restructuring are finished before git operations
- Maintain session integrity and ensure complete restructured project is committed

**Processing Restriction Protocol**
*Restricts agent actions during manual context sync*
- No other processing should occur when `COMMIT CONTEXT` trigger is detected
- Skip normal question analysis, research, and documentation workflows
- Focus exclusively on complete project sync and git operations without additional agent actions
- Return control to user immediately after operations complete

**Status**: ACTIVE
*Provides complete project synchronization capability that replaces entire project structure with .github directory contents and standardized template README. This workflow ensures consistent deployment-ready structure with proper template repository documentation.*
