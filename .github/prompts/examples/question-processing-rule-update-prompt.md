# Question Processing Rule Update Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Question Processing Rule Guide](../guides/question-processing-rule-guide.md)*

## Template: Update Question Processing Rule

```markdown
## Your Question/Request
I need you to update the Question Processing Rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Question Processing Rule
- Rule Description: [INSERT WHAT CHANGES OR UPDATES ARE NEEDED]
- File Location: .github/instructions/rules/question-processing-rule.md

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

Rule File Structure (Current):
# Question Processing Rule
*Controls what happens after each user question is asked and defines the complete workflow for documenting responses.*

## Question Logging Protocol
*Establishes how questions are recorded and timestamped in session logs.*

## Research and Reasoning Documentation Protocol
*Ensures all research steps and decision-making rationale are properly documented.*

## Change Documentation Protocol
*Documents all file modifications made during sessions for audit trail purposes.*

## Git Commit Message Logging Protocol
*Links git history to session documentation for complete audit trail.*

## Session Management Requirements
**Should this rule update follow the established Session Management Protocol?**

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
**Should the updated rule be tested for consistency?**

**Default: YES** ✅
- [x] YES - Validate that all rule sections work together cohesively
- [ ] NO - Skip validation testing

### Validation Checklist:
- [x] All section references are correct
- [x] Rule flow is logical and complete
- [x] No contradictions between sections
- [x] All links and references are functional
- [x] Status section reflects current state

## Additional Context
Session Management Requirements (per Session Management Protocol):
- Log this rule update in the current session log
- Document research and reasoning for rule modification decisions
- Track file modifications and their impact
- Log git commit message when changes are pushed to rule file
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/examples/question-processing-rule-update-prompt.md**

Special Considerations for Rule Updates:
- This is a GENERAL RULES rule that affects session documentation workflows
- Changes must maintain consistency with session management protocols
- Updates must be thoroughly documented for future reference
- Consider impact on existing logging and documentation workflows

## Expected Deliverables
- Updated question-processing-rule.md file with requested changes
- Validation of all internal rule consistency
- Updated references in other files if needed
- Complete session management logging of all actions and decisions
- Git commit with detailed change description
- Impact assessment of changes on existing workflows

## Change Documentation Template
For the session log, document:
- Original rule state
- Specific changes made
- Rationale for each change
- Testing/validation performed
- Files modified beyond the main rule file
- Future considerations or follow-up needed
```
