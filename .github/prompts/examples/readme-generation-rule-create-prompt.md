# README Generation Rule Creation Prompt Template

*For detailed explanations, examples, and usage instructions, see: [README Generation Rule Guide](../guides/readme-generation-rule-guide.md)*

## Template: Create README Generation Rule

```markdown
## Your Question/Request
I need you to create the README Generation Rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: README Generation Rule
- Rule Description: Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure
- File Location: .github/instructions/rules/readme-generation-rule.md

Protocol Sections Needed:
- File Format and Structure Requirements: Establishes basic requirements for README file creation and format
- Parent-Child README Relationships: Manages hierarchical README file relationships and cross-linking requirements
- Directory Linking Protocol: Ensures proper linking between README files across directory hierarchies

Specific Requirements:
- README should always be a Markdown file
- Create README and link all documents in that folder to it
- Give detailed description of what each document is and what it is to be used for
- All READMEs should have specific format: Title, Description, Links to all documents, Links to parent/child READMEs
- Parent README.md should link to all child README files in directory
- Each child README file should link back to parent README.md file
- Link README to parent directory README and update all READMEs up to parent directory

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create rule file only (no reference link)

### Rule Details:
- Priority Description: AUTOMATED README GENERATION AND MAINTENANCE PROTOCOLS
- Reference Description: README Generation Rule
- Location in copilot-instructions.md: GENERAL RULES SECTION

### Reference Link Format (for ACTIVE rules):
#### README Generation Rule
- *AUTOMATED README GENERATION AND MAINTENANCE PROTOCOLS*

- For complete README Generation Rule, see: [README Generation Rule](.github/instructions/rules/readme-generation-rule.md)

Rule File Structure:
# README Generation Rule
*Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure.*

## File Format and Structure Requirements
*Establishes basic requirements for README file creation and format.*
- Markdown file format requirements
- Document linking and description protocols
- README format standards with title, description, links structure

## Parent-Child README Relationships
*Manages hierarchical README file relationships and cross-linking requirements.*
- Parent README.md identification and linking protocols
- Child README-<something>.md format requirements
- Bidirectional linking between parent and child README files

## Directory Linking Protocol
*Ensures proper linking between README files across directory hierarchies.*
- README linking to parent directory protocols
- Parent directory README creation if missing
- Cascading README updates up to parent directory

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
- **Document prompt source: .github/prompts/examples/readme-generation-rule-create-prompt.md**

## Expected Deliverables
- New readme-generation-rule.md file created in .github/instructions/rules/
- Reference link added to .github/copilot-instructions.md in GENERAL RULES SECTION
- Complete session management logging of all actions and decisions
- Git commit with appropriate message for both files
```
