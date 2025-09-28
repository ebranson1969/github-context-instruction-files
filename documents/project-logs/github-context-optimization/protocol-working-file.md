# GitHub Copilot Session Logging Protocol - Working File

## Current Protocol Status: ACTIVE
*Framework established and tested - Ready for enhancement and optimization*

## Core Protocol Rules (Implemented)

### Session Management Rules
*These rules control when logging begins and where session data is stored.*

### RULE 1: Session Initiation Protocol
- The user will explicitly indicate when a session requires logging by providing a project name
- Alternatively, the user may provide a location containing previous conversation history for context continuation
- Sessions should only be logged when explicitly requested by the user (exception: when previous context logging is provided, logging continues automatically)
- All session logging must be associated with a clearly identified project name

### RULE 2: Session Storage Protocol
- Project logs should be stored under `documents/project-logs/<ProjectName>/`
- The context logging file should be a markdown file named `copilot-session-log.md`
- Each project maintains its own dedicated logging directory and file
- Full file path format: `documents/project-logs/<ProjectName>/copilot-session-log.md`

### Question Processing Rules
*These rules control what happens after each user question is asked and define the complete workflow for documenting responses.*

### RULE 3: Question Logging Protocol
- Log the timestamp when the question was asked with format: "Month DD, YYYY, HH:MM:SS.mmm"
- Record the user's original question verbatim in the log
- Provide a restatement of the question in your own words for clarity
- Use consistent formatting for question entries in the log

### RULE 4: Research and Reasoning Documentation Protocol
- Before making any changes or providing solutions, document all research steps taken
- Log the reasoning process, including alternative approaches considered
- Record failed attempts and why they didn't work
- Cache all findings and decision-making rationale in the session log
- Include tool usage and exploration steps taken to understand the problem

### RULE 5: Change Documentation Protocol
- Log all file modifications made during the session
- Record which files were created, edited, or deleted
- Include brief summaries of what was changed and why
- Provide file paths and change descriptions for easy reference
- Link changes back to the reasoning documented in Rule 4

### RULE FINAL: Git Commit Message Logging Protocol
- After pushing changes to the repository, log the commit message in the session log
- Include the commit hash and full commit message for traceability
- Format: "**Git Commit:** `<hash>` - `<commit message>`"
- This logging action does not require an additional commit cycle
- Links git history to session documentation for complete audit trail
- **This rule always executes last after completing all other protocol actions**

## Protocol Development History
- Initial framework established in copilot-protocol-development project
- Successfully tested and validated through 13 question iterations
- Protocol proven effective for maintaining context across sessions
- Ready for continued enhancement and optimization

## Current Development Focus
- Optimizing GitHub context instruction files in `.github` directory
- Improving AI assistant interaction patterns
- Developing better context preservation methods
- Enhancing session continuity protocols

## Next Protocol Enhancements (Proposed)
- Rule 6: Cross-project context linking
- Rule 7: Session archival and retrieval protocols
- Rule 8: Automated session summary generation
- Rule 9: Context validation and integrity checks
- Rule 10: Multi-session project tracking

## Working Notes
- Protocol working file created for github-context-optimization project
- Context successfully transferred from copilot-protocol-development session
- Ready to continue protocol development work within github context optimization scope
