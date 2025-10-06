# Master Prompt Template Guide

*This guide provides detailed explanations, examples, and usage instructions for the Master Prompt Template system.*

## Overview

The Master Prompt Template serves as the foundation for all prompt templates in the system. It defines the common structure and elements that should be included across all prompt templates to ensure consistency and proper session management.

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
- Session Management Protocol: YES ✅
- PUSH CODE Protocol: YES ✅
- Testing and Validation: YES ✅
- All Validation Checklist items: ✅ (pre-checked)

## Usage Instructions

1. **Copy this master template** as the foundation for any new prompt template
2. **Replace all bracketed variables** with specific values for your use case
3. **Add template-specific sections** (Rule Status for creates, Update Type for updates)
4. **Customize the component-specific content** while keeping the standard protocols intact
5. **Keep all the default YES checkboxes** to maintain consistency across templates

## Template Types

### General Templates
Use the Common Template Structure for general-purpose templates like:
- Question prompts
- General assistance requests
- Documentation requests

### Component Creation Templates
Add the "Create Template Specific Sections" for templates that create system components like:
- Rules creation
- Workflows creation
- Protocols creation

### Component Update Templates
Add the "Update Template Specific Sections" for templates that modify existing components like:
- Rules updates
- Workflows updates
- Protocols updates

## Best Practices

### Template Consistency
- Always include the Session Management Protocol section
- Maintain the same default settings (YES ✅) across all templates
- Use the standardized validation checklist
- Include proper session logging requirements

### Variable Usage
- Replace ALL bracketed variables with appropriate values
- Be specific and descriptive in variable replacements
- Maintain consistency in naming conventions
- Reference the correct file paths and locations

### Section Organization
- Follow the established order of sections
- Include all required protocol sections
- Add template-specific sections after the common sections
- Maintain consistent formatting and structure

## Examples

### Creating a Bug Report Template
```markdown
# Bug Report Prompt Template

## Template: Report Bug

## Your Question/Request
I need you to help me analyze and document a bug in the system.

## Session Management Protocol
**Should this bug report follow the established Session Management Protocol?**
...
```

### Creating a Feature Request Template
```markdown
# Feature Request Prompt Template

## Template: Request Feature

## Your Question/Request
I need you to help me design and implement a new feature.

## Session Management Protocol
**Should this feature request follow the established Session Management Protocol?**
...
```

## Troubleshooting

### Common Issues
- **Missing sections**: Ensure all required sections from the master template are included
- **Inconsistent defaults**: Verify all checkboxes match the standard defaults
- **Variable placeholders**: Check that all [BRACKETED] variables have been replaced
- **Section order**: Maintain the established section order for consistency

### Validation Steps
1. Compare against the master template structure
2. Verify all protocol sections are present
3. Check that defaults match the standard settings
4. Ensure proper variable replacement
5. Validate section formatting and organization
