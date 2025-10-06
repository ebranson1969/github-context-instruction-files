# Rules Creation Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Rules Creation Guide](./guides/rules-prompt-guide.md)*

## Template: Create Rule File

```markdown
## Your Question/Request
I need you to create a new rule file in the modular instruction system.

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

## Expected Deliverables
- New rule file created in .github/instructions/rules/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Rule file only with NOT ACTIVE status

## Common Instructions
*For complete session management protocols, validation requirements, and documentation standards, see: [Master Prompt Instructions](./master-prompt-instructions.md)*
````
