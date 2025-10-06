# Master Prompt Instructions

*This file contains all the common instructions and protocols that are shared across all prompts in the system. These instructions should be included in or referenced by every prompt template.*

*For detailed explanations, examples, and usage instructions, see: [Master Prompt Instructions Guide](./guides/master-prompt-template-guide.md)*

## Common Instructions for All Prompts

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Session Management Protocol
**Should this task follow the established Session Management Protocol?**

**Default: YES** ✅
- [x] YES - Follow complete Session Management Protocol as defined in [Session Management Protocol](../instructions/core-protocols/session-management-protocol.md)
- [ ] NO - Skip session management requirements for this question

*Note: Session Management Protocol includes logging, context preservation, and degradation prevention requirements.*

### Session Start or Restart
**Is this session a START or RESTART?**

**Default: START** ✅
- [x] START - This is a new session
- [ ] RESTART - This is a restarted session (context and logs must be preserved)

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

## Change Documentation Template
For the session log, document:
- Original state
- Specific changes made
- Rationale for each change
- Testing/validation performed
- Files modified beyond the main file
- Future considerations or follow-up needed
