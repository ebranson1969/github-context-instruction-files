# GitHub Copilot Instructions

## 🔴 CRITICAL: Copilot Session Logging Protocol
**HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS**

### Session Context Preservation Rules
*This section contains critical session management protocols that MUST be maintained across all interactions, regardless of token limitations or session failures.*

## 🔴 CRITICAL: Session Context Preservation Alert Protocol
**HIGHEST PRIORITY - PREVENT CONTEXT DEGRADATION IN LONG SESSIONS**

### Context Degradation Prevention Rules
*This section contains critical protocols to maintain .github instruction file context integrity during extended sessions.*

**RULE: Session Restart Alert Protocol**
- **Question Counting**: Track question count starting from 1 at the beginning of each logged session
- **50-Question Threshold**: When a logged session reaches exactly 50 questions AND after completing the git commit and logging to chat, immediately prompt the user with the following message:
  
  > "⚠️ **Session Context Alert**: You've reached 50 questions in this session. Due to AI token limitations, your `.github` instruction files may begin to lose priority in the context window during very long sessions (100+ questions). Would you like to end this session and start a new one to refresh the full context? This ensures optimal adherence to your copilot instructions and project prompts. (Type 'yes' to restart or 'no' to continue)"

- **One-Time Trigger**: This prompt should only appear ONCE per session when crossing the 50-question threshold
- **Technical Rationale**: AI models have finite context windows (8K-32K tokens). While `.github` files have high priority, extremely long sessions can force foundational context to be pruned due to token competition from conversation history and code outputs
- **User Choice Preservation**: Always allow the user to choose whether to restart - never force a session restart
- **Context Refresh Benefits**: Session restart reloads all `.github` files with full priority, ensuring consistent instruction adherence

**Session Length Thresholds for Reference:**
- **1-50 questions**: `.github` context remains stable ✅
- **50-100 questions**: Usually retained but may see some truncation ⚠️  
- **100+ questions**: Higher risk of foundational context being pruned ❌

**Status: PROTOCOL ACTIVE**
- Addresses context caching behavior analyzed in session logs
- Provides proactive solution to prevent instruction degradation
- Balances session continuity with context integrity
- Ready for implementation in all logged sessions

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

### README Generation Rule

1. The README should always be a Markdown file.
2. When asked to create a README in a directory:
   - Create the README and link all documents in that folder to it.
   - Give a detailed description of what each document is and what it is to be used for.
3. If a document is named just `README.md`, it could be a parent to other README files in this directory:
   - Child documents should have the format `README-<something>.md`.
   - The parent `README.md` should have links to all child README files in that directory.
   - Each child README file should have a link back to the parent `README.md` file.
4. Link the README you just created to the parent directory README.
5. If there is no parent directory README, create one and link the child README to it.
6. If there is a parent directory README, add a link to the child README in the parent README.
7. All READMEs should have the following format:
   - Title
   - Description
   - Links to all the documents in the directory, presented as a tree structure
   - Links to the parent directory `README.md`
   - Links to the child `README.md` files, if any
   - A detailed description of each document in the directory and what it is to be used for
8. This rule should be applied whenever a new README is created or an existing README is updated.
   - All READMEs up to the parent directory should be updated.

### Automatic Git Operations
- At the end of each agent interaction, automatically perform git operations with enhanced verification
- **Execute single command:** `git status --porcelain && git add . && git commit -m "Auto-commit: Changes made by GitHub Copilot" && git push && git status --porcelain`
- **Chat Logging:** Log the successful commit message to chat for confirmation
- **Error handling:** If the command fails, retry once. If it fails again, stop and report the issue for manual resolution
- This should be the very last action performed before ending the agent session

### Manual Git Trigger
- If the user types "PUSH CODE" in all uppercase letters as the only content in their message, immediately execute the automatic git operations from the project directory
- Use the same git command sequence as defined in Automatic Git Operations above
- No other processing should occur when this trigger is detected

### Git Commit Message Format
- Use descriptive commit messages when possible
- For automatic commits, use the format: "Auto-commit: [brief description of changes]"
- Include relevant file names or feature descriptions when appropriate
