# Master Prompt Instructions Guide

*This guide explains how to use the Master Prompt Instructions file and integrate its common protocols into your prompts.*

## Overview

The Master Prompt Instructions file (`master-prompt-instructions.md`) contains standardized instructions and protocols that should be included in every prompt within the modular instruction system. Rather than being a template to fill out, it serves as a repository of common instructions that ensure consistency across all prompts.

## Purpose and Usage

### What This File Contains
- **Common protocols** that apply to all prompts
- **Standardized checkboxes** for session management decisions
- **Consistent validation requirements** for all tasks
- **Universal documentation standards** for session logging

### How to Use These Instructions
1. **Include by reference**: Link to this file in your specific prompts
2. **Copy relevant sections**: Include the exact protocols needed for your prompt
3. **Maintain consistency**: Use the same checkbox formats and defaults across all prompts

## Section Breakdown

### Critical Session Logging
Every prompt starts with the critical requirement for proper session management:
```markdown
**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.
```

**Purpose**: Ensures all AI interactions are properly documented for continuity and accountability.

### Session Management Protocol
Controls whether the full session management protocol should be followed for each task.

**Default Setting**: YES ✅
- Most tasks should follow the complete protocol
- Only skip for very simple, low-impact tasks

**Key Components**:
- Logging requirements
- Context preservation
- Degradation prevention

### Session Start or Restart
Determines how to handle session context and logging.

**Default Setting**: START ✅
- Use START for new sessions
- Use RESTART when continuing from previous context

**Impact**: 
- START: Creates new session log entries
- RESTART: Preserves and continues existing logs

### PUSH CODE Protocol
Controls automatic git operations when tasks are complete.

**Default Setting**: YES ✅
- Automatically commits and pushes changes
- Ensures work is immediately saved and backed up

**When to Use NO**:
- When changes need manual review before pushing
- When working on experimental features
- When multiple related changes need to be grouped

### Testing and Validation
Ensures all work is validated for consistency and correctness.

**Default Setting**: YES ✅
- Validates internal consistency
- Checks for contradictions
- Verifies all references work

**Validation Checklist Components**:
- Section references accuracy
- Logical flow verification
- Contradiction detection
- Link functionality
- Status reflection accuracy

### Additional Context Requirements
Specifies the mandatory documentation requirements for session management.

**Key Requirements**:
- Log all actions in session log
- Document reasoning for decisions
- Track file modifications
- Log git commit messages
- **Copy complete prompt used in chat**
- **Document prompt source file**

### Expected Deliverables
Standard outcomes expected from every prompt execution.

**Universal Deliverables**:
- Updated files with requested changes
- Internal consistency validation
- Updated cross-references
- Complete session logging
- Detailed git commit
- Impact assessment

### Change Documentation Template
Standardized format for documenting all changes in session logs.

**Required Documentation**:
- Original state description
- Specific changes made
- Rationale for each change
- Testing/validation performed
- Additional files modified
- Future considerations

## Integration Examples

### Basic Prompt Structure
```markdown
# [Specific Task] Prompt

## Your Question/Request
[Specific task description here]

## Common Instructions
*For complete protocols, see: [Master Prompt Instructions](.github/prompts/master-prompt-instructions.md)*

**CRITICAL**: This session must be properly logged according to established protocols...

[Include relevant sections from master instructions]
```

### Reference-Only Approach
```markdown
# [Specific Task] Prompt

## Your Question/Request
[Specific task description here]

## Session Management
**All common protocols apply**: Follow instructions in [Master Prompt Instructions](.github/prompts/master-prompt-instructions.md)

[Only task-specific additional instructions here]
```

## Best Practices

### When Creating New Prompts
1. **Always include the CRITICAL logging requirement**
2. **Use the same checkbox formats and defaults**
3. **Reference the master instructions file**
4. **Only override defaults when necessary**
5. **Document any deviations from standard protocols**

### Maintaining Consistency
- Use identical wording for common sections
- Keep the same default settings unless specifically needed
- Maintain the same validation checklist structure
- Follow the same documentation template format

### Customization Guidelines
- **Add task-specific requirements** without removing common ones
- **Override defaults only when justified** and document why
- **Extend validation checklists** with task-specific items
- **Add additional context** specific to the task domain

## File Maintenance

### When to Update Master Instructions
- When new common protocols are established
- When validation requirements change
- When session management procedures are updated
- When git workflow protocols are modified

### Impact of Changes
- Updates affect ALL prompts that reference this file
- Changes should be backward-compatible when possible
- Major changes require updating dependent prompts
- Version changes should be documented in session logs

## Troubleshooting

### Common Issues
1. **Inconsistent checkbox defaults**: Always use the master file defaults unless specifically overridden
2. **Missing validation steps**: Include all items from the validation checklist
3. **Incomplete documentation**: Follow the change documentation template exactly
4. **Git workflow confusion**: Default to YES for PUSH CODE unless manually managing commits

### Validation Failures
- Check that all referenced files exist
- Verify link targets are correct
- Ensure checkbox formatting is consistent
- Confirm all required sections are present

## Related Files

- **Master Prompt Instructions**: `.github/prompts/master-prompt-instructions.md` (this guide's subject)
- **Session Management Protocol**: `.github/instructions/core-protocols/session-management-protocol.md`
- **Automatic Git Operations**: `.github/instructions/workflows/automatic-git-operations.md`
- **Manual Git Trigger**: `.github/instructions/workflows/manual-git-trigger.md`

## Version History

- **v1.0** (October 2025): Initial guide creation for updated Master Prompt Instructions
- Transitioned from template approach to common instructions repository
- Removed placeholder variables in favor of generic, reusable content
- Clarified purpose as shared instruction source rather than fillable template
