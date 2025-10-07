# Master Prompt Instructions

*This file contains all the common instructions and protocols that are shared across all prompts in the system. These instructions should be included in or referenced by every prompt template.*

*For detailed explanations, examples, and usage instructions, see: [Master Prompt Instructions Guide](./guides/master-prompt-instructions-guide.md)*

## Common Instructions for All Prompts

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Session Management Protocol
**Should this task follow the established Session Management Protocol?**

**Default: YES** ✅
- [x] YES - Follow complete Session Management Protocol as defined in [Session Management Protocol](.github/instructions/core-protocols/session-management-protocol.md)
- [ ] NO - Skip session management requirements for this question

*Note: Session Management Protocol includes logging, context preservation, and degradation prevention requirements.*

### Session Start or Restart
**Is this session a START, RESTART, or CONTINUING?**

**Default: START** ✅
- [x] START - This is a new session
- [ ] RESTART - This is a restarted session (context and logs must be preserved)
- [ ] CONTINUING - This is a continuing conversation in an active session (no session management changes needed)

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Testing and Validation
**Should this be tested for consistency?**

**Default: YES** ✅
- [x] YES - Validate that all sections work together cohesively
- [ ] NO - Skip validation testing

### Validation Checklist:
- [x] All section references are correct
- [x] Flow is logical and complete
- [x] No contradictions between sections
- [x] All links and references are functional
- [x] Status section reflects current state

## Additional Context
Session Management Requirements (per Session Management Protocol):
- Log this action in the current session log
- Document research and reasoning for decisions
- Track file modifications and their impact
- Log git commit message when changes are pushed to files
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/[SOURCE-FILE-NAME].md**

## Expected Deliverables
- Updated file with requested changes
- Validation of all internal consistency
- Updated references in other files if needed
- Complete session management logging of all actions and decisions
- Git commit with detailed change description
- Impact assessment of changes on existing workflows
- **🚨 CRITICAL REQUIREMENT: Automatic project name generation**
  - When user provides a question but no project name, automatically generate a descriptive project name based on the question content
  - Project name format: Use kebab-case (lowercase with hyphens) suitable for git branch creation
  - Examples: "fix-authentication-bug", "add-user-dashboard", "refactor-payment-processing"
  - Replace any project name placeholder with the generated name in all prompt files created
- **🚨 CRITICAL REQUIREMENT: Automated continuation prompt creation for new sessions**
  0. **Git Branch Management for New Sessions:**
     a. If the user says they are starting a new conversation, PUSH CODE first
     b. Check if the current branch matches the project name
     c. If it does not match: switch to develop, pull down the latest, and create a branch based on the project name
     d. If it is a continuation or restart: just make sure we are on the correct branch
  1. Copy ALL sections from original prompt with only these modifications:
     a. "Your Question/Request" section: Replace with "[REPLACE THIS WITH YOUR NEW QUESTION - This will be added to the existing session]"
     b. ALL OTHER SECTIONS: Copy exactly as they appear in the original prompt
     c. If the user provided a prompt file, copy that prompt verbatim instead
     d. If the AI automatically generated a project name, ensure the generated project name replaces any project name placeholder in both documents
  2. Create continuation prompt file at `documents/project-logs/[project-name]/continuation-prompt.md`
     a. It should be an exact copy of the original prompt with the "Your Question/Request" section replaced with "[REPLACE THIS WITH YOUR NEW QUESTION - This will be added to the existing session]"
     b. If the user provided a prompt file, copy that prompt verbatim
     c. The continuation prompt should be set to RESTART instead of START in the Session Management Protocol
     d. If the AI automatically generated a project name, ensure the generated project name is used in both the file path and within the prompt content
  3. This ensures session continuity and prompt consistency across all interactions
  4. Copy the complete contents of master-prompt-instructions.md into both prompts you create instead of using the link reference

## Change Documentation Template
For the session log, document:
- Original state
- Specific changes made
- Rationale for each change
- Testing/validation performed
- Files modified beyond the main file
- Future considerations or follow-up needed
