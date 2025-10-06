# Rules Creation Prompt Guide

*This guide explains how to use the Rules Creation Prompt Template to create new rule files in the modular instruction system.*

## Overview

The Rules Creation Prompt Template (`rules-prompt.md`) is designed to create new rule files that establish standardized protocols, requirements, or constraints within the GitHub Copilot instruction system. Rules can be either ACTIVE (referenced in the main instructions) or NOT ACTIVE (created but not yet implemented).

## Purpose and Usage

### What This Prompt Creates
- **Rule files** in `.github/instructions/rules/` directory
- **Reference links** in `.github/copilot-instructions.md` (for ACTIVE rules)
- **Standardized rule structure** with consistent formatting
- **Protocol documentation** for specific instruction areas

### When to Use This Prompt
- Creating new protocols that need to be enforced across the system
- Establishing standards for specific types of work or content
- Defining requirements for particular workflows or processes
- Setting up constraints or guidelines for AI interactions

## Template Field Breakdown

### Rule Information Section
This section defines the basic metadata for your new rule:

**Rule Name**: The display name that will appear in documentation
- Use descriptive, clear naming (e.g., "Question Processing Rule", "README Generation Rule")
- Should be title case and descriptive of the rule's purpose

**Rule Description**: Brief explanation of what the rule establishes or controls
- Keep concise but informative
- Explain the scope and purpose of the rule
- Use italicized text format in the actual rule file

**File Location**: Standardized path in kebab-case format
- Always follows pattern: `.github/instructions/rules/[kebab-case-name]-rule.md`
- Examples: `question-processing-rule.md`, `readme-generation-rule.md`

### Protocol Sections Configuration
Define the main sections your rule will contain:

**Protocol/Section Names**: The major areas your rule covers
- Examples: "Processing Requirements", "Validation Steps", "Output Standards"
- Each section should focus on a specific aspect of the rule

**Brief Descriptions**: Short explanation of what each section will address
- Helps organize the rule content logically
- Guides the AI in creating appropriate content for each section

### Specific Requirements
Detail the exact requirements for each protocol section:
- Use bullet points for clarity
- Be specific about what needs to be included
- Consider validation criteria, process steps, output formats, etc.

## Rule Status Configuration

### ACTIVE Rules
**When to choose ACTIVE:**
- Rule is ready for immediate implementation
- You want it referenced in the main copilot instructions
- Rule should be enforced across relevant workflows

**Requirements for ACTIVE rules:**
- **Priority Description**: Uppercase description of the rule's importance
  - Examples: "CONTROLS WORKFLOW", "CRITICAL RULES", "AUTOMATED OPERATIONS"
- **Reference Description**: Text that describes what the rule covers
  - Examples: "Question Processing Rules", "Git Operations Workflow"
- **Location in copilot-instructions.md**: Where to add the reference
  - Options: "CRITICAL RULES SECTION" or "GENERAL RULES SECTION"

### NOT ACTIVE Rules
**When to choose NOT ACTIVE:**
- Rule is being drafted but not ready for implementation
- You want to create the rule file without activating it yet
- Rule needs review before being made active

## Reference Link Format

For ACTIVE rules, the template provides the exact format for adding references to the main instructions:

### Critical Rules Format:
```markdown
#### 🔴 [Rule Name]
- *[PRIORITY DESCRIPTION IN UPPERCASE]*
- For complete [Reference Description], see: [[Rule Name]](./instructions/rules/[filename]-rule.md)
```

### General Rules Format:
```markdown
#### [Rule Name]
- *[PRIORITY DESCRIPTION IN UPPERCASE]*
- For complete [Reference Description], see: [[Rule Name]](./instructions/rules/[filename]-rule.md)
```

## Rule File Structure

The template creates rule files with this standardized structure:

```markdown
# [Rule Name]
*[Rule Description]*

## [Protocol/Section Name 1]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## [Protocol/Section Name 2]
*[Brief description of this protocol section]*
- [Bullet point requirements]
```

### Best Practices for Rule Structure:
1. **Clear section names** that indicate the specific area being addressed
2. **Descriptive introductions** for each section explaining its purpose
3. **Actionable bullet points** that provide specific, implementable requirements
4. **Logical flow** from general concepts to specific implementation details

## Usage Examples

### Example 1: Creating a Critical Workflow Rule
```markdown
Rule Information:
- Rule Name: Session Management Protocol
- Rule Description: Establishes comprehensive session management including logging, context preservation, and degradation prevention
- File Location: .github/instructions/rules/session-management-protocol-rule.md

Protocol Sections Needed:
- Logging Requirements: Define what must be logged in each session
- Context Preservation: Specify how to maintain context across sessions
- Degradation Prevention: Establish protocols to prevent session quality loss

Rule Status: ACTIVE
Priority Description: HIGHEST PRIORITY - COMPREHENSIVE SESSION MANAGEMENT
Reference Description: Session Management Protocol
Location: CRITICAL RULES SECTION
```

### Example 2: Creating a Content Standards Rule
```markdown
Rule Information:
- Rule Name: README Generation Rule
- Rule Description: Automated README generation and maintenance protocols
- File Location: .github/instructions/rules/readme-generation-rule.md

Protocol Sections Needed:
- Content Requirements: Define required sections and formatting
- Update Triggers: Specify when READMEs should be regenerated
- Validation Standards: Establish quality criteria for generated content

Rule Status: ACTIVE
Priority Description: AUTOMATED README GENERATION AND MAINTENANCE PROTOCOLS
Reference Description: README Generation Rule
Location: GENERAL RULES SECTION
```

### Example 3: Creating a Draft Rule
```markdown
Rule Information:
- Rule Name: Code Review Standards
- Rule Description: Establishes comprehensive code review requirements and processes
- File Location: .github/instructions/rules/code-review-standards-rule.md

Protocol Sections Needed:
- Review Criteria: Define what aspects must be reviewed
- Process Requirements: Establish the review workflow
- Documentation Standards: Specify required documentation for reviews

Rule Status: NOT ACTIVE
(No additional information needed for NOT ACTIVE rules)
```

## Integration with Master Instructions

This prompt template leverages the Master Prompt Instructions for:
- **Session Management Protocol**: Logging and documentation requirements
- **PUSH CODE Protocol**: Automatic git operations
- **Testing and Validation**: Consistency checking procedures
- **Change Documentation**: Standardized logging format

Only rule-specific deliverables are defined in this template:
- Creation of the rule file in the correct location
- Addition of reference links for ACTIVE rules
- Proper status management (ACTIVE/NOT ACTIVE)

## File Management

### Directory Structure
Rules are organized in a dedicated directory:
```
.github/instructions/rules/
├── session-management-protocol-rule.md
├── readme-generation-rule.md
├── question-processing-rule.md
└── [new-rule-name]-rule.md
```

### Naming Conventions
- **File names**: Use kebab-case with `-rule.md` suffix
- **Rule names**: Use title case, descriptive names
- **Section names**: Use clear, action-oriented headings

### Activation Process
1. **Create rule file** using this prompt template
2. **Review content** for completeness and accuracy
3. **Add reference link** to `.github/copilot-instructions.md` (if ACTIVE)
4. **Test integration** to ensure rule works with existing instructions
5. **Document changes** in session logs

## Troubleshooting

### Common Issues
1. **Unclear rule scope**: Be specific about what the rule covers and doesn't cover
2. **Missing protocol sections**: Ensure all necessary areas are addressed
3. **Inconsistent formatting**: Follow the standardized rule file structure
4. **Incorrect reference links**: Use exact format provided in template

### Validation Checklist
- [ ] Rule name is descriptive and clear
- [ ] File location follows kebab-case naming convention
- [ ] All protocol sections have clear descriptions
- [ ] Requirements are specific and actionable
- [ ] ACTIVE status includes all required information
- [ ] Reference link format is correct (if ACTIVE)
- [ ] Rule content follows standardized structure

## Related Files

- **Rules Creation Prompt**: `../rules-prompt.md` (this guide's subject)
- **Master Prompt Instructions**: `../master-prompt-instructions.md`
- **Session Management Protocol**: `../instructions/core-protocols/session-management-protocol.md`
- **Main Copilot Instructions**: `../copilot-instructions.md`

## Maintenance and Updates

### When to Update Rules
- When new requirements are identified
- When existing protocols need modification
- When rules conflict with other instructions
- When workflow changes require rule updates

### Update Process
1. **Modify rule file** with necessary changes
2. **Update reference links** if rule name or location changes
3. **Document changes** in session logs
4. **Validate integration** with other instructions
5. **Test implementation** to ensure rules work as expected

## Version History

- **v2.0** (October 2025): Complete guide redesign with comprehensive examples and detailed field explanations
- Integrated with Master Prompt Instructions system
- Added troubleshooting and maintenance sections
- Enhanced with practical usage examples and best practices
