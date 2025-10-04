# Question Processing Rule
*Controls what happens after each user question is asked and defines the complete workflow for documenting responses.*

## Question Logging Protocol
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

## Research and Reasoning Documentation Protocol
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

## Change Documentation Protocol
*Documents all file modifications made during sessions for audit trail purposes.*
- Log all file modifications made during the session
- Record which files were created, edited, or deleted
- Include brief summaries of what was changed and why
- Provide file paths and change descriptions for easy reference
- Link changes back to the reasoning documented in Research and Reasoning Protocol
- Use standard file editing tools for reliable and verified operations
- Log actions taken and file modifications to session log immediately
- Verify the content was written by checking the end of the log file

## Git Commit Message Logging Protocol
*Links git history to session documentation for complete audit trail.*
- After pushing changes to the repository, log the commit message in the session log
- Include the commit hash and full commit message for traceability
- Format: "**Git Commit:** `<hash>` - `<commit message>`"
- This logging action does not require an additional commit cycle
- Links git history to session documentation for complete audit trail
- This protocol always executes last after completing all other protocol actions

## Status
**ACTIVE** - Core operational rule that defines the complete workflow for processing user questions and documenting all actions taken in response. Required for all logged sessions to maintain audit trail and session continuity.
