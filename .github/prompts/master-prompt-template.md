# Master Prompt Template

*This template contains all the common elements found across all prompt templates in the system. Use this as a foundation for creating new prompt templates.*

## Common Template Structure

```markdown
# [TEMPLATE NAME] Prompt Template

*For detailed explanations, examples, and usage instructions, see: [[TEMPLATE NAME] Guide](./guides/[template-name]-guide.md)*

## Template: [ACTION] [COMPONENT NAME]

```markdown
## Your Question/Request
I need you to [ACTION DESCRIPTION] in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

[COMPONENT TYPE] Information:
- [COMPONENT TYPE] Name: [INSERT NAME]
- [COMPONENT TYPE] Description: [INSERT DESCRIPTION]
- File Location: [INSERT FILE PATH]

[SECTIONS BLOCK - VARIES BY TEMPLATE TYPE]

## [TEMPLATE-SPECIFIC SECTIONS]
[This varies by template - could be Rule Status, Update Type, etc.]

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

Special Considerations for [COMPONENT TYPE] [ACTION]:
- [INSERT COMPONENT-SPECIFIC CONSIDERATIONS]
- [INSERT IMPACT CONSIDERATIONS]
- [INSERT COMPATIBILITY CONSIDERATIONS]

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
```

## Template Variables Reference

### **Universal Variables (Used in All Templates):**
- `[TEMPLATE NAME]` - Name of the specific template (e.g., "Question Processing Rule Creation")
- `[ACTION]` - What's being done (Create, Update)
- `[COMPONENT NAME]` - What's being worked on (Question Processing Rule, Session Management Protocol)
- `[COMPONENT TYPE]` - Type of component (Rule, Protocol, Workflow)
- `[SOURCE-FILE-NAME]` - The filename of the prompt template

### **Create Template Specific Sections:**
```markdown
## [COMPONENT] Status
**Should this [COMPONENT] be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create [COMPONENT] file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create [COMPONENT] file only (no reference link)

### [COMPONENT] Details:
- Priority Description: [INSERT PRIORITY DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]
- Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK]

### Reference Link Format (for ACTIVE [COMPONENTS]):
#### [COMPONENT NAME]
- *[PRIORITY DESCRIPTION IN UPPERCASE]*

- For complete [Reference Description], see: [[COMPONENT NAME]](./instructions/[path]/[filename].md)
```

### **Update Template Specific Sections:**
```markdown
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
```

## Standard Protocol Defaults

**All templates use these defaults:**
- Session Management Requirements: YES ✅
- Reference Updates Required: YES ✅ 
- PUSH CODE Protocol: YES ✅
- Testing and Validation: YES ✅
- All Validation Checklist items: ✅ (pre-checked)

## Usage Instructions

1. **Copy this master template** as the foundation for any new prompt template
2. **Replace all bracketed variables** with specific values for your use case
3. **Add template-specific sections** (Rule Status for creates, Update Type for updates)
4. **Customize the component-specific content** while keeping the standard protocols intact
5. **Keep all the default YES checkboxes** to maintain consistency across templates
