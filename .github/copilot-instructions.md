# GitHub Copilot Instructions

## 🔴 CRITICAL: Copilot Session Logging Protocol
**HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS**

### Session Context Preservation Rules
*This section contains critical session management protocols that MUST be maintained across all interactions, regardless of token limitations or session failures.*

**RULE 1: Session Initiation Protocol**
- The user will explicitly indicate when a session requires logging by providing a project name
- Alternatively, the user may provide a location containing previous conversation history for context continuation
- Sessions should only be logged when explicitly requested by the user (exception: when previous context logging is provided, logging continues automatically)
- All session logging must be associated with a clearly identified project name

**RULE 2: Session Storage Protocol**
- Project logs should be stored under `documents/project-logs/<ProjectName>/`
- The context logging file should be a markdown file named `copilot-session-log.md`
- Each project maintains its own dedicated logging directory and file
- Full file path format: `documents/project-logs/<ProjectName>/copilot-session-log.md`

**RULE 3: Question Logging Protocol**
- Log the timestamp when the question was asked with format: "Month DD, YYYY, HH:MM:SS.mmm"
- Record the user's original question verbatim in the log
- Provide a restatement of the question in your own words for clarity
- Use consistent formatting for question entries in the log

**RULE 4: Research and Reasoning Documentation Protocol**
- Before making any changes or providing solutions, document all research steps taken
- Log the reasoning process, including alternative approaches considered
- Record failed attempts and why they didn't work
- Cache all findings and decision-making rationale in the session log
- Include tool usage and exploration steps taken to understand the problem

**RULE 5: Change Documentation Protocol**
- Log all file modifications made during the session
- Record which files were created, edited, or deleted
- Include brief summaries of what was changed and why
- Provide file paths and change descriptions for easy reference
- Link changes back to the reasoning documented in Rule 4

**RULE 6: Git Commit Message Logging Protocol**
- After pushing changes to the repository, log the commit message in the session log
- Include the commit hash and full commit message for traceability
- Format: "**Git Commit:** `<hash>` - `<commit message>`"
- This logging action does not require an additional commit cycle
- Links git history to session documentation for complete audit trail

**Status: PROTOCOL ACTIVE**
- Protocol framework established
- Rule 1 implemented
- Rule 2 implemented
- Rule 3 implemented
- Rule 4 implemented
- Rule 5 implemented
- Rule 6 implemented
- Ready for additional rules

---

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

## Agent Workflow Requirements

### Automatic Git Operations
- At the end of each agent interaction, automatically perform git operations
- Add, commit, and push all changed or created files in one command
- Use the command: `git add . && git commit -m "Auto-commit: Changes made by GitHub Copilot" && git push`
- Report the results of the git operations in the chat response
- This should be the very last action performed before ending the agent session

### Manual Git Trigger
- If the user types "PUSH CODE" in all uppercase letters as the only content in their message, immediately execute the automatic git operations from the project directory
- Use the same git command sequence as defined in Automatic Git Operations above
- No other processing should occur when this trigger is detected

### Git Commit Message Format
- Use descriptive commit messages when possible
- For automatic commits, use the format: "Auto-commit: [brief description of changes]"
- Include relevant file names or feature descriptions when appropriate
