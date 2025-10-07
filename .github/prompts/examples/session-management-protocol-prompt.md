# Session Management Protocol Update Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Session Management Protocol Guide](./guides/session-management-protocol-guide.md)*

## Template: Update Session Management Protocol

```markdown
## Your Question/Request
I need you to update the Session Management Protocol file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Protocol Information:
- Protocol Name: Session Management Protocol
- Protocol Description: [INSERT WHAT CHANGES OR UPDATES ARE NEEDED]
- File Location: .github/instructions/core-protocols/session-management-protocol.md

Protocol Sections to Update:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION OF CHANGES]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION OF CHANGES]
- [ADD MORE SECTIONS AS NEEDED]

Specific Requirements:
- [INSERT BULLET POINT REQUIREMENTS FOR EACH PROTOCOL SECTION UPDATE]
- [ADD MORE REQUIREMENTS AS NEEDED]

## Update Type
**What type of update is this?**

- [x] **ENHANCEMENT** - Adding new functionality or improving existing protocols
- [ ] **BUG FIX** - Correcting errors or issues in existing protocols
- [ ] **CLARIFICATION** - Improving documentation or clarity without changing functionality
- [ ] **RESTRUCTURE** - Reorganizing sections or improving structure

### Update Details:
- Change Description: [INSERT DESCRIPTION OF WHAT IS BEING CHANGED]
- Rationale: [INSERT WHY THIS CHANGE IS NEEDED]
- Impact Assessment: [INSERT HOW THIS AFFECTS EXISTING WORKFLOWS]

Protocol File Structure (Current):
# Session Management Protocol
*Comprehensive session management system that ensures context preservation, prevents degradation, and maintains optimal AI assistant performance across all interactions.*

## Session Initiation Protocol
## Session Storage Protocol
## Mandatory Session Logging
## Session Continuity
## Context Degradation Prevention
## Early Warning Protocol
## Context Failure Recovery
## Session Length Thresholds for Reference
## Status

## Session Management Requirements
**Should this protocol update follow the established Session Management Protocol?**

**Default: YES** ✅
- [x] YES - Follow complete Session Management Protocol as defined in [Session Management Protocol](.github/instructions/core-protocols/session-management-protocol.md)
- [ ] NO - Skip session management requirements for this question

*Note: Session Management Protocol includes logging, context preservation, and degradation prevention requirements.*

## Reference Updates Required
**Does this update require changes to references in other files?**

**Default: YES** ✅
- [x] YES - Update references following the existing prompt template structure patterns
- [ ] NO - No reference updates needed

*Note: Follow the established patterns used in other .github/prompts/ templates for consistency.*

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Testing and Validation
**Should the updated protocol be tested for consistency?**

**Default: YES** ✅
- [x] YES - Validate that all protocol sections work together cohesively
- [ ] NO - Skip validation testing

### Validation Checklist:
- [x] All section references are correct
- [x] Protocol flow is logical and complete
- [x] No contradictions between sections
- [x] All links and references are functional
- [x] Status section reflects current state

## Additional Context
Session Management Requirements (per Session Management Protocol):
- Log this protocol update in the current session log
- Document research and reasoning for protocol modification decisions
- Track file modifications and their impact
- Log git commit message when changes are pushed to protocol file
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/session-management-protocol-prompt.md**

Special Considerations for Protocol Updates:
- This is a CRITICAL RULES protocol that affects all other operations
- Changes must maintain backward compatibility where possible
- Updates must be thoroughly documented for future reference
- Consider impact on existing sessions and workflows

## Expected Deliverables
- Updated session-management-protocol.md file with requested changes
- Validation of all internal protocol consistency
- Updated references in other files if needed
- Complete session management logging of all actions and decisions
- Git commit with detailed change description
- Impact assessment of changes on existing workflows

## Change Documentation Template
For the session log, document:
- Original protocol state
- Specific changes made
- Rationale for each change
- Testing/validation performed
- Files modified beyond the main protocol file
- Future considerations or follow-up needed
````
