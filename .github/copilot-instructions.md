# GitHub Copilot Instructions

---
### 🔴 CRITICAL RULES SECTION

#### 🔴 Session Logging Protocol
- *HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS*

- For complete Session Context Preservation Rules, see: [Session Context Preservation Rule](./copilot-rules.md#session-context-preservation-rule)

#### 🔴 Context Preservation Alert Protocol
- *HIGHEST PRIORITY - PREVENT CONTEXT DEGRADATION IN LONG SESSIONS*

- For complete Context Degradation Prevention Rules, see: [Context Degradation Prevention Rule](./copilot-rules.md#context-degradation-prevention-rule)

#### 🔴 Terminal Usage Protocol
- *HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS*

- For complete Terminal Usage Protocol, see: [Terminal Usage Protocol](./copilot-rules.md#terminal-usage-protocol)

### 🔴 GENERAL RULES SECTION

#### Session Management Rules
- *CONTROLS WHEN LOGGING BEGINS AND WHERE SESSION DATA IS STORED*

- For complete Session Management Rules, see: [Session Management Rule](./copilot-rules.md#session-management-rule)

#### Question Processing Rules
- *CONTROLS WORKFLOW FOR DOCUMENTING RESPONSES AFTER EACH USER QUESTION*

- For complete Question Processing Rules, see: [Question Processing Rule](./copilot-rules.md#question-processing-rule)

#### README Generation Rule
- *AUTOMATED README GENERATION AND MAINTENANCE PROTOCOLS*

- For complete README Generation Rule, see: [README Generation Rule](./copilot-rules.md#readme-generation-rule)


## Agent Workflow Requirements

#### Automatic Git Operations
- *AUTOMATED GIT OPERATIONS FOR SESSION MANAGEMENT AND CODE DEPLOYMENT*

- For complete Automatic Git Operations Workflow, see: [Automatic Git Operations Workflow](./copilot-workflows.md#automatic-git-operations-workflow)

#### Manual Git Trigger
- *USER-INITIATED GIT OPERATIONS THROUGH STANDARDIZED TRIGGER PHRASE*

- For complete Manual Git Trigger Workflow, see: [Manual Git Trigger Workflow](./copilot-workflows.md#manual-git-trigger-workflow)

#### Manual Context Sync Workflow (COMMIT CONTEXT)
- *USER-INITIATED CONTEXT FILE SYNCHRONIZATION AND GIT OPERATIONS THROUGH STANDARDIZED TRIGGER PHRASE*

- For complete Manual Context Sync Workflow (COMMIT CONTEXT), see: [Manual Context Sync Workflow (COMMIT CONTEXT)](./copilot-workflows.md#manual-context-sync-workflow-commit-context)

#### Git Commit Message Format
- *STANDARDIZED COMMIT MESSAGE FORMAT AND CONTENT FOR CONSISTENCY AND TRACEABILITY*

- For complete Git Commit Message Formatting Workflow, see: [Git Commit Message Formatting Workflow](./copilot-workflows.md#git-commit-message-formatting-workflow)

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
