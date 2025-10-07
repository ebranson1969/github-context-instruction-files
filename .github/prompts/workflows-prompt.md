# Workflows Creation Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Workflows Creation Guide](./guides/workflows-prompt-guide.md)*

## Template: Create Workflow

```markdown
## Your Question/Request
I need you to create a new workflow in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Workflow Information:
- Workflow Name: [INSERT WORKFLOW NAME HERE]
- Workflow Description: [INSERT WHAT THIS WORKFLOW ESTABLISHES OR CONTROLS]
- File Location: .github/instructions/workflows/[INSERT-KEBAB-CASE-FILENAME]-workflow.md

Protocol Sections Needed:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]
- [ADD MORE SECTIONS AS NEEDED]

Specific Requirements:
- [INSERT BULLET POINT REQUIREMENTS FOR EACH PROTOCOL SECTION]
- [ADD MORE REQUIREMENTS AS NEEDED]

## Workflow Status
**Should this workflow be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create workflow file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create workflow file only (no reference link)

### If ACTIVE, provide additional information:
- Purpose Description: [INSERT PURPOSE DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]
- Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK - AGENT WORKFLOW REQUIREMENTS or OTHER SECTION]

### Reference Link Format (for ACTIVE workflows):
#### [Workflow Name]
- *[PURPOSE DESCRIPTION IN UPPERCASE]*

- For complete [Reference Description], see: [[Workflow Name]](.github/instructions/workflows/[filename]-workflow.md)

Workflow File Structure:
# [Workflow Name]
*[Workflow Description]*

## [Protocol/Section Name 1]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## [Protocol/Section Name 2]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## Session Management Protocol
**Should this question be logged according to established session management protocols?**

**Default: YES** ✅
- [x] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session management for this question

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

## Additional Context
Session Logging Requirements:
- Log this workflow creation in the current session log
- Document research and reasoning for workflow design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both workflow file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to workflow file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md**

## Expected Deliverables
- New workflow file created in .github/instructions/workflows/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Workflow file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
````
