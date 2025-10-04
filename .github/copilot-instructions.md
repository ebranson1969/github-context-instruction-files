# GitHub Copilot Instructions

---
### 🔴 CRITICAL RULES SECTION

#### 🔴 Session Logging Protocol
- *HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS*

- For complete Session Context Preservation Rules, see: [Session Context Preservation Rule](./instructions/rules/session-context-preservation-rule.md)

#### 🔴 Context Preservation Alert Protocol
- *HIGHEST PRIORITY - PREVENT CONTEXT DEGRADATION IN LONG SESSIONS*

- For complete Context Degradation Prevention Rules, see: [Context Degradation Prevention Rule](./instructions/rules/context-degradation-prevention-rule.md)

#### 🔴 Terminal Usage Protocol
- *HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS*

- For complete Terminal Usage Protocol, see: [Terminal Usage Protocol](./instructions/rules/terminal-usage-protocol.md)

### 🔴 GENERAL RULES SECTION

#### Session Management Rules
- *CONTROLS WHEN LOGGING BEGINS AND WHERE SESSION DATA IS STORED*

- For complete Session Management Rules, see: [Session Management Rule](./instructions/rules/session-management-rule.md)

#### Question Processing Rules
- *CONTROLS WORKFLOW FOR DOCUMENTING RESPONSES AFTER EACH USER QUESTION*

- For complete Question Processing Rules, see: [Question Processing Rule](./instructions/rules/question-processing-rule.md)

#### README Generation Rule
- *AUTOMATED README GENERATION AND MAINTENANCE PROTOCOLS*

- For complete README Generation Rule, see: [README Generation Rule](./instructions/rules/readme-generation-rule.md)


## Agent Workflow Requirements

#### Automatic Git Operations
- *AUTOMATED GIT OPERATIONS FOR SESSION MANAGEMENT AND CODE DEPLOYMENT*

- For complete Automatic Git Operations Workflow, see: [Automatic Git Operations Workflow](./instructions/workflows/automatic-git-operations.md)

#### Manual Git Trigger
- *USER-INITIATED GIT OPERATIONS THROUGH STANDARDIZED TRIGGER PHRASE*

- For complete Manual Git Trigger Workflow, see: [Manual Git Trigger Workflow](./instructions/workflows/manual-git-trigger.md)

#### Manual Context Sync Workflow (COMMIT CONTEXT)
- *USER-INITIATED CONTEXT FILE SYNCHRONIZATION AND GIT OPERATIONS THROUGH STANDARDIZED TRIGGER PHRASE*

- For complete Manual Context Sync Workflow (COMMIT CONTEXT), see: [Manual Context Sync Workflow (COMMIT CONTEXT)](./instructions/workflows/manual-context-sync.md)

#### Git Commit Message Format
- *STANDARDIZED COMMIT MESSAGE FORMAT AND CONTENT FOR CONSISTENCY AND TRACEABILITY*

- For complete Git Commit Message Formatting Workflow, see: [Git Commit Message Formatting Workflow](./instructions/workflows/git-commit-message-format.md)

## Coding Style Preferences

### General Principles
- Write clean, readable, and maintainable code
- Use descriptive variable and function names
- Include meaningful comments for complex logic
- Follow DRY (Don't Repeat Yourself) principles
- Prefer explicit over implicit code

### Python Standards
- Follow PEP 8 style guidelines
- Use type hints where appropriate
- Include docstrings for functions and classes
- Use meaningful variable names (avoid single letters except for loops)
- Prefer list/dict comprehensions for simple operations

### Documentation Standards
- Use Markdown for all documentation files
- Include code examples in documentation
- Maintain consistent formatting and structure
- Keep README files up to date
- Document all public APIs and functions

## Framework-Specific Patterns

### File Organization
- Group related functionality in dedicated directories
- Use clear, descriptive file names
- Maintain consistent directory structure
- Separate configuration from implementation

### Error Handling
- Use appropriate exception types
- Include meaningful error messages
- Log errors appropriately
- Handle edge cases gracefully

## Libraries and Dependencies

### Preferred Libraries
- Use standard library when possible
- Choose well-maintained, popular libraries
- Document all external dependencies
- Keep dependencies up to date

### Code Patterns to Follow
- Use context managers for resource management
- Implement proper logging instead of print statements
- Follow single responsibility principle
- Use appropriate data structures for the task

## Code Patterns to Avoid
- Avoid global variables when possible
- Don't use bare except clauses
- Avoid deep nesting (prefer early returns)
- Don't ignore error conditions
- Avoid magic numbers and strings

## Project-Specific Naming Conventions

### Files and Directories
- Use lowercase with hyphens for directory names
- Use lowercase with underscores for Python files
- Use descriptive names that indicate purpose
- Group related files in appropriate directories

### Variables and Functions
- Use snake_case for Python variables and functions
- Use UPPER_CASE for constants
- Use descriptive names that explain purpose
- Prefix private methods/variables with underscore

## Architecture Patterns to Maintain

### Modular Design
- Separate concerns into different modules
- Use clear interfaces between components
- Keep modules loosely coupled
- Design for testability and maintainability

### Documentation Structure
- Maintain guides in documents/guides/
- Keep context files in .github/ structure
- Use consistent formatting across all docs
- Include examples and practical guidance
