# Session Management Rule
*Controls when logging begins and where session data is stored for optimal project organization.*

## Session Initiation Protocol
*Establishes when and how session logging should be started based on user input.*
- The user will explicitly indicate when a session requires logging by providing a project name
- Alternatively, the user may provide a location containing previous conversation history for context continuation
- Sessions should only be logged when explicitly requested by the user (exception: when previous context logging is provided, logging continues automatically)
- All session logging must be associated with a clearly identified project name

## Session Storage Protocol
*Defines the standardized file structure and naming conventions for session logs.*
- Project logs should be stored under `documents/project-logs/<ProjectName>/`
- The context logging file should be a markdown file named `copilot-session-log.md`
- Each project maintains its own dedicated logging directory and file
- Full file path format: `documents/project-logs/<ProjectName>/copilot-session-log.md`

## Status
**ACTIVE**
