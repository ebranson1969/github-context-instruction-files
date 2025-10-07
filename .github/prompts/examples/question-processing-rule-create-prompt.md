# Question Processing Rule Creation Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Question Processing Rule Guide](../guides/question-processing-rule-guide.md)*

## Template: Create Question Processing Rule

```markdown
## Your Question/Request
I need you to create the Question Processing Rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Question Processing Rule
- Rule Description: Controls what happens after each user question is asked and defines the complete workflow for documenting responses
- File Location: .github/instructions/rules/question-processing-rule.md

Protocol Sections Needed:
- Question Logging Protocol: Establishes how questions are recorded and timestamped in session logs
- Research and Reasoning Documentation Protocol: Ensures all research steps and decision-making rationale are properly documented
- Change Documentation Protocol: Documents all file modifications made during sessions for audit trail purposes
- Git Commit Message Logging Protocol: Links git history to session documentation for complete audit trail

Specific Requirements:
- Session logging must be first and last action for every user question
- Gating requirement: no other actions until session log is updated
- Agent must verify session log after every interaction
- Document all research steps and decision-making rationale
- Log all file modifications with paths and change descriptions
- Record git commit messages with hash and full message for traceability

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create rule file only (no reference link)

### Rule Details:
- Priority Description: CONTROLS WORKFLOW FOR DOCUMENTING RESPONSES AFTER EACH USER QUESTION
- Reference Description: Question Processing Rules
- Location in copilot-instructions.md: GENERAL RULES SECTION

### Reference Link Format (for ACTIVE rules):
#### Question Processing Rules
- *CONTROLS WORKFLOW FOR DOCUMENTING RESPONSES AFTER EACH USER QUESTION*

- For complete Question Processing Rules, see: [Question Processing Rule](.github/instructions/rules/question-processing-rule.md)

Rule File Structure:
# Question Processing Rule
*Controls what happens after each user question is asked and defines the complete workflow for documenting responses.*

## Question Logging Protocol
*Establishes how questions are recorded and timestamped in session logs.*
- Session logging requirements and gating protocols
- Timestamp formatting and question recording standards
- Verification requirements for session log updates

## Research and Reasoning Documentation Protocol
*Ensures all research steps and decision-making rationale are properly documented.*
- Research documentation requirements before making changes
- Decision-making rationale and alternative approach recording
- Enhanced context requirements for comprehensive documentation

## Change Documentation Protocol
*Documents all file modifications made during sessions for audit trail purposes.*
- File modification logging requirements
- Change summaries and reasoning linkage
- Standard file editing tool usage protocols

## Git Commit Message Logging Protocol
*Links git history to session documentation for complete audit trail.*
- Commit message logging after repository pushes
- Hash and message formatting requirements
- Execution order as final protocol action

## Session Management Requirements
**Should this rule creation follow the established Session Management Protocol?**

**Default: YES** ✅
- [x] YES - Follow complete Session Management Protocol as defined in [Session Management Protocol](.github/instructions/core-protocols/session-management-protocol.md)
- [ ] NO - Skip session management requirements for this question

*Note: Session Management Protocol includes logging, context preservation, and degradation prevention requirements.*

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Additional Context
Session Management Requirements (per Session Management Protocol):
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- Log git commit message when changes are pushed to both rule file and copilot-instructions.md
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/examples/question-processing-rule-create-prompt.md**

## Expected Deliverables
- New question-processing-rule.md file created in .github/instructions/rules/
- Reference link added to .github/copilot-instructions.md in GENERAL RULES SECTION
- Complete session management logging of all actions and decisions
- Git commit with appropriate message for both files
```
