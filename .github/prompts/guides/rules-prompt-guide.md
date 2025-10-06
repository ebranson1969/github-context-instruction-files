# Rules Creation Prompt Guide

*This guide explains how to use the Rules Creation Prompt Template to create comprehensive rule files in the modular instruction system, based on real examples from existing rules.*

## Overview

The Rules Creation Prompt Template creates structured rule files that establish detailed protocols, requirements, and verification procedures. Rules follow a standardized format with multiple protocol sections, enhanced sub-requirements, and mandatory status declarations.

## Real-World Rule Analysis

Based on existing rules in the system, here are the actual patterns and structures used:

### README Generation Rule Structure
- **3 Protocol Sections**: File Format Requirements, Parent-Child Relationships, Directory Linking Protocol
- **Detailed Requirements**: Each section has 4-6 specific requirements
- **Cross-linking Logic**: Complex hierarchical relationship management
- **Status**: ACTIVE with detailed justification

### Session Management Protocol Structure  
- **6 Major Protocol Sections**: Initiation, Storage, Mandatory Logging, Continuity, Context Degradation Prevention, Early Warning
- **Complex Sub-requirements**: Nested bullet points with specific thresholds and technical rationale
- **Verification Requirements**: Explicit verification steps and gating requirements
- **Technical Depth**: Includes question counting, threshold management, and user choice preservation

## Template Field Breakdown

### Rule Information Section

**Rule Name**: Clear, descriptive title that indicates the rule's domain
- Examples from existing rules: "README Generation Rule", "Session Management Protocol"
- Use title case and focus on the main function or area controlled

**Rule Description**: Comprehensive description in italics explaining scope and purpose
- Real example: *"Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure."*
- Should explain both what the rule does and why it's important

**File Location**: Follows strict naming convention
- Pattern: `.github/instructions/rules/[kebab-case-name]-rule.md`
- Real examples: `readme-generation-rule.md`, `session-management-protocol.md`

### Protocol Sections Configuration

**Number of Sections**: Real rules have 3-6 major protocol sections
- Simple rules (README): 3 focused sections
- Complex rules (Session Management): 6 comprehensive sections

**Section Names**: Use descriptive, action-oriented titles
- Real examples: "File Format and Structure Requirements", "Mandatory Session Logging", "Context Degradation Prevention"
- Each section should address a distinct aspect of the rule's domain

### Detailed Requirements Structure

Based on actual rules, each protocol section contains:

**Main Requirements**: 4-6 specific, actionable bullet points
- Use clear, direct language
- Include specific technical details when applicable
- Reference exact file paths, formats, or procedures

**Enhanced/Sub-Requirements**: Nested requirements for complex scenarios
- Real example from Session Management: "10-Question Threshold" with detailed sub-bullets
- Use for conditional logic, exceptions, or advanced scenarios

**Verification Steps**: Explicit validation requirements
- Real pattern: "The agent MUST verify..." or "All agent interactions must be logged..."
- Include gating requirements where applicable

## Complete Real-World Examples

### Example 1: Documentation Standards Rule (Based on README Generation Rule)

```markdown
Rule Information:
- Rule Name: README Generation Rule
- Rule Description: Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure
- File Location: .github/instructions/rules/readme-generation-rule.md

Protocol Sections Needed:
- File Format and Structure Requirements: Basic README creation and format standards
- Parent-Child README Relationships: Hierarchical file relationships and cross-linking
- Directory Linking Protocol: Cross-directory README linking requirements

Detailed Requirements for Each Protocol Section:

### File Format and Structure Requirements
- Main Requirements:
  - The README should always be a Markdown file
  - When asked to create a README in a directory: Create the README and link all documents in that folder to it
  - Give a detailed description of what each document is and what it is to be used for
  - All READMEs should have the following format: Title, Description, Links to all documents in the directory presented as a tree structure, Links to parent directory README.md, Links to child README.md files if any, Detailed description of each document in the directory and what it is to be used for
- Enhanced/Sub-Requirements (if applicable):
  - Tree structure presentation must be hierarchical and logical
  - Document descriptions must explain both purpose and usage
- Verification Steps (if applicable):
  - Verify all documents in directory are linked and described

### Parent-Child README Relationships
- Main Requirements:
  - If a document is named just README.md, it could be a parent to other README files in this directory
  - Child documents should have the format README-<something>.md
  - The parent README.md should have links to all child README files in that directory
  - Each child README file should have a link back to the parent README.md file
- Enhanced/Sub-Requirements (if applicable):
  - Maintain bidirectional linking between parent and child files
  - Update parent README when new child READMEs are created
- Verification Steps (if applicable):
  - Verify bidirectional links are functional and current

### Directory Linking Protocol
- Main Requirements:
  - Link the README you just created to the parent directory README
  - If there is no parent directory README, create one and link the child README to it
  - If there is a parent directory README, add a link to the child README in the parent README
  - This rule should be applied whenever a new README is created or an existing README is updated
  - All READMEs up to the parent directory should be updated
- Enhanced/Sub-Requirements (if applicable):
  - Cascade updates through the entire directory hierarchy
  - Maintain consistency across all levels of documentation
- Verification Steps (if applicable):
  - Verify entire directory chain is properly linked and updated

Rule Status: ACTIVE
Priority Description: AUTOMATED README GENERATION AND MAINTENANCE PROTOCOLS
Reference Description: README Generation Rule
Location: GENERAL RULES SECTION
Status Description: Core documentation rule that ensures consistent README file creation and maintenance across all project directories. Required for maintaining organized documentation hierarchy.
```

### Example 2: Critical System Protocol (Based on Session Management Protocol)

```markdown
Rule Information:
- Rule Name: Session Management Protocol
- Rule Description: Comprehensive session management system that ensures context preservation, prevents degradation, and maintains optimal AI assistant performance across all interactions
- File Location: .github/instructions/core-protocols/session-management-protocol.md

Protocol Sections Needed:
- Session Initiation Protocol: When and how session logging should be started
- Session Storage Protocol: Standardized file structure and naming conventions
- Mandatory Session Logging: Documentation requirements for all interactions
- Session Continuity: Maintaining connection between sessions
- Context Degradation Prevention: Proactive session length management
- Early Warning Protocol: Additional context awareness for optimal management

Detailed Requirements for Each Protocol Section:

### Session Initiation Protocol
- Main Requirements:
  - The user will explicitly indicate when a session requires logging by providing a project name
  - Alternatively, the user may provide a location containing previous conversation history for context continuation
  - Sessions should only be logged when explicitly requested by the user
  - All session logging must be associated with a clearly identified project name
- Enhanced/Sub-Requirements (if applicable):
  - Exception: when previous context logging is provided, logging continues automatically
  - Project name identification is mandatory for all logged sessions
- Verification Steps (if applicable):
  - Verify project name is clearly identified before starting session logging

### Context Degradation Prevention
- Main Requirements:
  - Question Counting: Track question count starting from 1 at the beginning of each logged session
  - 10-Question Threshold: When a logged session reaches exactly 10 questions AND after completing the git commit and logging to chat, immediately prompt the user
  - One-Time Trigger: This prompt should only appear ONCE per session when crossing the 10-question threshold
  - User Choice Preservation: Always allow the user to choose whether to restart - never force a session restart
- Enhanced/Sub-Requirements (if applicable):
  - Technical Rationale: AI models have finite context windows, and practical experience shows that foundational context begins losing priority much earlier than theoretical limits suggest
  - Context Refresh Benefits: Session restart reloads all .github files with full priority, ensuring consistent instruction adherence
  - Specific prompt message: "⚠️ **Session Context Alert**: You've reached 10 questions in this session. Based on observed patterns, AI context begins degrading around 8-10 questions, requiring reminders of previously established information. Would you like to end this session and start a new one to refresh the full context?"
- Verification Steps (if applicable):
  - The agent MUST verify question count after every user interaction
  - Verify the threshold prompt is triggered exactly once at question 10

Rule Status: ACTIVE
Priority Description: HIGHEST PRIORITY - COMPREHENSIVE SESSION MANAGEMENT INCLUDING LOGGING, CONTEXT PRESERVATION, AND DEGRADATION PREVENTION
Reference Description: Session Management Protocol
Location: CRITICAL RULES SECTION
Status Description: Critical protocol that maintains optimal AI performance through proactive context management, mandatory logging, and degradation prevention. Essential for consistent instruction adherence across all interactions.
```

## Template Usage Guidelines

### When to Create New Rules

**Create rules for:**
- Standardizing complex multi-step processes
- Establishing verification requirements for critical workflows
- Managing system-wide protocols that affect multiple components
- Implementing quality control measures

**Don't create rules for:**
- Simple one-time instructions
- Highly specific, non-repeatable tasks
- Temporary or experimental procedures

### Rule Complexity Levels

**Simple Rules (3-4 sections)**: Focus on straightforward processes with clear requirements
- Example: File format standards, basic linking protocols

**Complex Rules (5-6 sections)**: Handle sophisticated workflows with nested logic
- Example: Session management, context degradation prevention

**Critical Protocols**: Rules that affect system stability or user experience
- Require enhanced verification steps and detailed technical rationale

### Required Elements for All Rules

1. **Italicized rule description** explaining scope and purpose
2. **Multiple protocol sections** (minimum 3, typically 4-6)
3. **Specific, actionable requirements** in each section
4. **Enhanced sub-requirements** for complex scenarios
5. **Verification steps** where validation is critical
6. **Mandatory Status section** with ACTIVE designation and detailed description

## Integration with Master Instructions

This prompt template integrates with Master Prompt Instructions for:
- Session management and logging protocols
- Git operations and commit procedures  
- Validation and testing requirements
- Documentation standards

Rule-specific elements handled by this template:
- Complex protocol section structure
- Enhanced sub-requirements and verification steps
- ACTIVE/NOT ACTIVE status management
- Reference link generation for copilot-instructions.md

## Best Practices from Real Rules

### Writing Effective Requirements
- Use specific, actionable language ("The agent MUST verify..." not "Consider verifying...")
- Include technical details when relevant (file paths, formats, thresholds)
- Provide rationale for complex requirements (especially in enhanced sub-requirements)

### Structuring Protocol Sections
- Each section should focus on one distinct aspect of the rule
- Use descriptive section names that indicate the specific area being addressed
- Organize from general concepts to specific implementation details

### Verification and Validation
- Include explicit verification steps for critical requirements
- Use gating language where appropriate ("MUST verify before proceeding")
- Specify what constitutes successful validation

## Troubleshooting Real-World Issues

### Common Rule Creation Problems
1. **Insufficient detail in requirements**: Real rules need specific, actionable bullet points
2. **Missing verification steps**: Critical workflows require explicit validation requirements  
3. **Unclear protocol boundaries**: Each section should address a distinct functional area
4. **Inadequate status description**: Must explain both what the rule does and why it's required

### Validation Checklist Based on Real Rules
- [ ] Rule has 3-6 well-defined protocol sections
- [ ] Each section has 4-6 specific requirements
- [ ] Enhanced sub-requirements address complex scenarios
- [ ] Verification steps are included where critical
- [ ] Status section includes ACTIVE designation and detailed description
- [ ] Technical rationale provided for complex requirements
- [ ] File naming follows kebab-case convention with -rule.md suffix

## Related Files and Dependencies

- **Rules Creation Prompt**: `../rules-prompt.md` 
- **Master Prompt Instructions**: `../master-prompt-instructions.md`
- **Existing Rules Directory**: `../instructions/rules/`
- **Core Protocols Directory**: `../instructions/core-protocols/`
- **Main Copilot Instructions**: `../copilot-instructions.md`

## Version History

- **v3.0** (October 2025): Complete guide rewrite based on analysis of real existing rules
- Added examples directly derived from README Generation Rule and Session Management Protocol
- Enhanced with actual complexity patterns and verification requirements from production rules
- Integrated real-world troubleshooting based on existing rule structures
