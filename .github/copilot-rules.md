# Copilot Rules

### Session Context Preservation Rule
*Establishes critical session management protocols that MUST be maintained across all interactions, regardless of token limitations or session failures. These protocols ensure session continuity and context preservation for optimal AI assistant performance.*

**Mandatory Session Logging**
*Ensures all agent interactions are properly documented and preserved for future reference.*
- Session logging MUST be the first and last action for every user request, regardless of the task.
- Session logging is a gating requirement: no other actions (file edits, commits, etc.) may be performed until the session log is updated.
- The agent MUST verify the session log after every user interaction and before ending its turn, ensuring no step is missed.
- All agent interactions must be logged in dedicated project directories
- Session logs must capture: original questions, research reasoning, actions taken, file modifications, git commits
- Logging format must include timestamps, question numbers, and detailed change summaries
- Session logs serve as project history and context for future interactions

**Session Continuity**
*Maintains connection between sessions and preserves project context across interactions.*
- Each logged session must maintain connection to previous sessions through cross-references
- Project context must be preserved across session restarts
- Session logs must be updated throughout the interaction, not just at the end
- Critical protocols must be maintained regardless of session length or complexity

**Context Failure Recovery**
*Provides recovery mechanism when AI context degrades due to token limitations.*
- If session context appears degraded, immediately reference session logs to restore project understanding
- Session logs act as backup context when AI token limits cause instruction degradation
- All critical protocols must be re-established from session logs when context fails
- Optional: Cross-reference to Session Context Alert Protocol for proactive context management

**Status**: ACTIVE
*Core foundational rule that underpins all other protocol operations. Required for all logged sessions.*

---

### Session Management Rule
*Controls when logging begins and where session data is stored for optimal project organization.*

**Session Initiation Protocol**
*Establishes when and how session logging should be started based on user input.*
- The user will explicitly indicate when a session requires logging by providing a project name
- Alternatively, the user may provide a location containing previous conversation history for context continuation
- Sessions should only be logged when explicitly requested by the user (exception: when previous context logging is provided, logging continues automatically)
- All session logging must be associated with a clearly identified project name

**Session Storage Protocol**
*Defines the standardized file structure and naming conventions for session logs.*
- Project logs should be stored under `documents/project-logs/<ProjectName>/`
- The context logging file should be a markdown file named `copilot-session-log.md`
- Each project maintains its own dedicated logging directory and file
- Full file path format: `documents/project-logs/<ProjectName>/copilot-session-log.md`

**Status**: ACTIVE

---

### Question Processing Rule
*Controls what happens after each user question is asked and defines the complete workflow for documenting responses.*

**Question Logging Protocol**
*Establishes how questions are recorded and timestamped in session logs.*
- Session logging MUST be the first and last action for every user question, regardless of the task.
- Session logging is a gating requirement: no other actions (file edits, commits, etc.) may be performed until the session log is updated.
- The agent MUST verify the session log after every user interaction and before ending its turn, ensuring no step is missed.
- Log the timestamp when the question was asked with format: "Month DD, YYYY, HH:MM:SS.mmm"
- Record the user's original question verbatim in the log
- Provide a restatement of the question in your own words for clarity
- Use consistent formatting for question entries in the log
- Log question header, original question, and restatement to session log immediately
- Verify the content was written by checking the end of the log file

**Research and Reasoning Documentation Protocol**
*Ensures all research steps and decision-making rationale are properly documented.*
- Before making any changes or providing solutions, document all research steps taken
- Log the reasoning process, including alternative approaches considered
- Record failed attempts and why they didn't work
- Cache all findings and decision-making rationale in the session log
- Include tool usage and exploration steps taken to understand the problem
- Enhanced Context Requirements:
  - Document alternative approaches considered but not chosen (with reasons why)
  - Record technical constraints or limitations that influenced decisions
  - Note user preference patterns and recurring themes from session history
  - Identify context dependencies (what prior decisions this builds upon)
  - Assess potential impact on other protocol components or future decisions
- Log complete research and reasoning section to session log immediately
- Verify the content was written by checking the end of the log file

**Change Documentation Protocol**
*Documents all file modifications made during sessions for audit trail purposes.*
- Log all file modifications made during the session
- Record which files were created, edited, or deleted
- Include brief summaries of what was changed and why
- Provide file paths and change descriptions for easy reference
- Link changes back to the reasoning documented in Research and Reasoning Protocol
- Use standard file editing tools for reliable and verified operations
- Log actions taken and file modifications to session log immediately
- Verify the content was written by checking the end of the log file

**Git Commit Message Logging Protocol**
*Links git history to session documentation for complete audit trail.*
- After pushing changes to the repository, log the commit message in the session log
- Include the commit hash and full commit message for traceability
- Format: "**Git Commit:** `<hash>` - `<commit message>`"
- This logging action does not require an additional commit cycle
- Links git history to session documentation for complete audit trail
- This protocol always executes last after completing all other protocol actions

**Status**: ACTIVE
*Core operational rule that defines the complete workflow for processing user questions and documenting all actions taken in response. Required for all logged sessions to maintain audit trail and session continuity.*

---

### Context Degradation Prevention Rule
*Contains critical protocols to maintain .github instruction file context integrity during extended sessions and prevent AI context degradation due to token limitations.*

**Session Restart Alert Protocol**
*Proactively manages session length to prevent context degradation in very long sessions.*
- Question Counting: Track question count starting from 1 at the beginning of each logged session
- 50-Question Threshold: When a logged session reaches exactly 50 questions AND after completing the git commit and logging to chat, immediately prompt the user with the following message:
  
  > "⚠️ **Session Context Alert**: You've reached 50 questions in this session. Due to AI token limitations, your `.github` instruction files may begin to lose priority in the context window during very long sessions (100+ questions). Would you like to end this session and start a new one to refresh the full context? This ensures optimal adherence to your copilot instructions and project prompts. (Type 'yes' to restart or 'no' to continue)"

- One-Time Trigger: This prompt should only appear ONCE per session when crossing the 50-question threshold
- Technical Rationale: AI models have finite context windows (8K-32K tokens). While `.github` files have high priority, extremely long sessions can force foundational context to be pruned due to token competition from conversation history and code outputs
- User Choice Preservation: Always allow the user to choose whether to restart - never force a session restart
- Context Refresh Benefits: Session restart reloads all `.github` files with full priority, ensuring consistent instruction adherence

**Session Length Thresholds for Reference**
*Guidelines for understanding session length impact on context stability.*
- 1-50 questions: `.github` context remains stable ✅
- 50-100 questions: Usually retained but may see some truncation ⚠️  
- 100+ questions: Higher risk of foundational context being pruned ❌

**Status**: ACTIVE
*Addresses context caching behavior analyzed in session logs. Provides proactive solution to prevent instruction degradation. Balances session continuity with context integrity. Ready for implementation in all logged sessions.*

---

### README Generation Rule
*Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure.*

**File Format and Structure Requirements**
*Establishes basic requirements for README file creation and format.*
- The README should always be a Markdown file
- When asked to create a README in a directory: Create the README and link all documents in that folder to it
- Give a detailed description of what each document is and what it is to be used for
- All READMEs should have the following format: Title, Description, Links to all documents in the directory presented as a tree structure, Links to parent directory README.md, Links to child README.md files if any, Detailed description of each document in the directory and what it is to be used for

**Parent-Child README Relationships**
*Manages hierarchical README file relationships and cross-linking requirements.*
- If a document is named just `README.md`, it could be a parent to other README files in this directory
- Child documents should have the format `README-<something>.md`
- The parent `README.md` should have links to all child README files in that directory
- Each child README file should have a link back to the parent `README.md` file

**Directory Linking Protocol**
*Ensures proper linking between README files across directory hierarchies.*
- Link the README you just created to the parent directory README
- If there is no parent directory README, create one and link the child README to it
- If there is a parent directory README, add a link to the child README in the parent README
- This rule should be applied whenever a new README is created or an existing README is updated
- All READMEs up to the parent directory should be updated

**Status**: ACTIVE
*Core documentation rule that ensures consistent README file creation and maintenance across all project directories. Required for maintaining organized documentation hierarchy.*

---

### Terminal Usage Protocol
*Determines acceptable use of terminal commands and operations within AI-generated code*

**Bash Terminal Requirements**
*Establishes bash as the standard terminal environment for all AI-generated commands*
- Use only bash commands for all terminal operations
- All terminal-based operations must be compatible with bash shell environment
- Ensure cross-platform compatibility by using standard bash command syntax
- Avoid platform-specific command variations that may not work in bash

**Python Integration Protocol**
*Defines acceptable use of Python within terminal operations*
- Python can be used within bash commands or bash scripts
- Python scripts should be executed through bash using proper command syntax
- Combine Python and bash operations using standard bash piping and command chaining
- Ensure Python code is properly integrated with bash workflow requirements

**Prohibited Terminal Types**
*Explicitly restricts the use of non-bash terminal environments*
- PowerShell commands and syntax are not allowed
- Command Prompt (cmd.exe) specific commands are prohibited
- Zsh-specific features and syntax should not be used
- Fish shell, tcsh, or any other shell-specific commands are not permitted
- All terminal operations must be bash-compatible regardless of underlying system

**Status**: NOT ACTIVE
*Core operational rule that standardizes terminal command usage across all AI-generated code. Required for maintaining consistent command execution across different environments and platforms.*
