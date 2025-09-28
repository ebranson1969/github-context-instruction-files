# GitHub Copilot Instructions

## 🔴 CRITICAL: Copilot Session Logging Protocol
**HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS**

### Session Context Preservation Rules
*This section contains critical session management protocols that MUST be maintained across all interactions, regardless of token limitations or session failures.*

**RULE: Mandatory Session Logging**
- All agent interactions must be logged in dedicated project directories
- Session logs must capture: original questions, research reasoning, actions taken, file modifications, git commits
- Logging format must include timestamps, question numbers, and detailed change summaries
- Session logs serve as project history and context for future interactions

**RULE: Session Continuity**
- Each logged session must maintain connection to previous sessions through cross-references
- Project context must be preserved across session restarts
- Session logs must be updated throughout the interaction, not just at the end
- Critical protocols must be maintained regardless of session length or complexity

**RULE: Context Failure Recovery**
- If session context appears degraded, immediately reference session logs to restore project understanding
- Session logs act as backup context when AI token limits cause instruction degradation
- All critical protocols must be re-established from session logs when context fails

#### Session Management Rules
*These rules control when logging begins and where session data is stored.*

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

#### Question Processing Rules
*These rules control what happens after each user question is asked and define the complete workflow for documenting responses.*

**RULE 1: Question Logging Protocol**
- Log the timestamp when the question was asked with format: "Month DD, YYYY, HH:MM:SS.mmm"
- Record the user's original question verbatim in the log
- Provide a restatement of the question in your own words for clarity
- Use consistent formatting for question entries in the log
- **After Rule 1:** Log question header, original question, and restatement to session log immediately
- **After Rule 1:** Verify the content was written by checking the end of the log file

**RULE 2: Research and Reasoning Documentation Protocol**
- Before making any changes or providing solutions, document all research steps taken
- Log the reasoning process, including alternative approaches considered
- Record failed attempts and why they didn't work
- Cache all findings and decision-making rationale in the session log
- Include tool usage and exploration steps taken to understand the problem
- **Enhanced Context Requirements:**
  - Document alternative approaches considered but not chosen (with reasons why)
  - Record technical constraints or limitations that influenced decisions
  - Note user preference patterns and recurring themes from session history
  - Identify context dependencies (what prior decisions this builds upon)
  - Assess potential impact on other protocol components or future decisions
- **After Rule 2:** Log complete research and reasoning section to session log immediately
- **After Rule 2:** Verify the content was written by checking the end of the log file

**RULE 3: Change Documentation Protocol**
- Log all file modifications made during the session
- Record which files were created, edited, or deleted
- Include brief summaries of what was changed and why
- Provide file paths and change descriptions for easy reference
- Link changes back to the reasoning documented in Rule 2
- **For all files:** Use standard file editing tools for reliable and verified operations
- **After Rule 3:** Log actions taken and file modifications to session log immediately
- **After Rule 3:** Verify the content was written by checking the end of the log file

**RULE FINAL: Git Commit Message Logging Protocol**
- After pushing changes to the repository, log the commit message in the session log
- Include the commit hash and full commit message for traceability
- Format: "**Git Commit:** `<hash>` - `<commit message>`"
- This logging action does not require an additional commit cycle
- Links git history to session documentation for complete audit trail
- **This rule always executes last after completing all other protocol actions**

**RULE OPTIMIZE: Fast Terminal-Based Logging Protocol**
- After all Question Processing Rules complete, append optimized summary to log using terminal commands
- Use echo/cat commands for faster file operations than file editing tools
- Template format: `Q[N] | [Timestamp] | [Brief Summary] | [Commit Hash if applicable]`
- Append to end of log file using: `echo "[template]" >> [log-file-path]`
- Maintains audit trail while providing faster logging performance
- **This rule executes after RULE FINAL for performance optimization only**

**Status: PROTOCOL ACTIVE**
- Protocol framework established and restored from git history
- Session Management Rules 1-2 implemented
- Question Processing Rules 1-3 implemented  
- Rule Final implemented
- Rule Optimize implemented
- Complete audit trail and logging workflow restored

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
