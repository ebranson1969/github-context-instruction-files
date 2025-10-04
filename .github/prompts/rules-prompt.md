# Rules Creation Prompt Template

## Template: Create Rule File

```markdown
## Your Question/Request
I need you to create a new rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: [INSERT RULE NAME HERE]
- Rule Description: [INSERT WHAT THIS RULE ESTABLISHES OR CONTROLS]
- File Location: .github/instructions/rules/[INSERT-KEBAB-CASE-FILENAME]-rule.md

Protocol Sections Needed:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]
- [ADD MORE SECTIONS AS NEEDED]

Specific Requirements:
- [INSERT BULLET POINT REQUIREMENTS FOR EACH PROTOCOL SECTION]
- [ADD MORE REQUIREMENTS AS NEEDED]

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create rule file only (no reference link)

### If ACTIVE, provide additional information:
- Priority Description: [INSERT PRIORITY DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]
- Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK - CRITICAL or GENERAL RULES SECTION]

### Reference Link Format (for ACTIVE rules):
#### 🔴 [Rule Name] (if critical) OR #### [Rule Name] (if general)
- *[PRIORITY DESCRIPTION IN UPPERCASE]*

- For complete [Reference Description], see: [[Rule Name]](./instructions/rules/[filename]-rule.md)

Rule File Structure:
# [Rule Name]
*[Rule Description]*

## [Protocol/Section Name 1]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## [Protocol/Section Name 2]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## Status
**What is the status of this rule?**

- [ ] **ACTIVE** - [Brief description of rule purpose and scope]
- [ ] **NOT ACTIVE** - [Brief description of rule purpose and scope]

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: YES** ✅
- [x] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Additional Context
Session Logging Requirements:
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both rule file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to rule file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md**

## Expected Deliverables
- New rule file created in .github/instructions/rules/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Rule file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```
