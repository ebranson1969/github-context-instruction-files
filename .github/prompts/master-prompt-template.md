# Master Prompt Template

*This template contains all the common elements found across all prompt templates in the system. Use this as a foundation for creating new prompt templates.*

*For detailed explanations, examples, and usage instructions, see: [Master Prompt Template Guide](./guides/master-prompt-template-guide.md)*

## Common Template Structure

```markdown
## Your Question/Request
I need you to [ACTION DESCRIPTION] in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Session Management Protocol
**Should this [ACTION] follow the established Session Management Protocol?**

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
**Should the [COMPONENT] be tested for consistency?**

**Default: YES** ✅
- [x] YES - Validate that all [COMPONENT] sections work together cohesively
- [ ] NO - Skip validation testing

### Validation Checklist:
- [x] All section references are correct
- [x] [COMPONENT] flow is logical and complete
- [x] No contradictions between sections
- [x] All links and references are functional
- [x] Status section reflects current state

## Additional Context
Session Management Requirements (per Session Management Protocol):
- Log this [ACTION] in the current session log
- Document research and reasoning for [COMPONENT] [ACTION] decisions
- Track file modifications and their impact
- Log git commit message when changes are pushed to [COMPONENT] file
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/[SOURCE-FILE-NAME].md**

## Expected Deliverables
- [ACTION RESULT] [COMPONENT] file with requested changes
- Validation of all internal [COMPONENT] consistency
- Updated references in other files if needed
- Complete session management logging of all actions and decisions
- Git commit with detailed change description
- Impact assessment of changes on existing workflows

## Change Documentation Template
For the session log, document:
- Original [COMPONENT] state
- Specific changes made
- Rationale for each change
- Testing/validation performed
- Files modified beyond the main [COMPONENT] file
- Future considerations or follow-up needed
````
