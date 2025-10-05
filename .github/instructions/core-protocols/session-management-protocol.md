# Session Management Protocol
*Comprehensive session management system that ensures context preservation, prevents degradation, and maintains optimal AI assistant performance across all interactions.*

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

## Mandatory Session Logging
*Ensures all agent interactions are properly documented and preserved for future reference.*
- Session logging MUST be the first and last action for every user request, regardless of the task
- Session logging is a gating requirement: no other actions (file edits, commits, etc.) may be performed until the session log is updated
- The agent MUST verify the session log after every user interaction and before ending its turn, ensuring no step is missed
- All agent interactions must be logged in dedicated project directories
- Session logs must capture: original questions, research reasoning, actions taken, file modifications, git commits
- Logging format must include timestamps, question numbers, and detailed change summaries
- Session logs serve as project history and context for future interactions

## Session Continuity
*Maintains connection between sessions and preserves project context across interactions.*
- Each logged session must maintain connection to previous sessions through cross-references
- Project context must be preserved across session restarts
- Session logs must be updated throughout the interaction, not just at the end
- Critical protocols must be maintained regardless of session length or complexity

## Context Degradation Prevention
*Proactively manages session length to prevent context degradation based on observed real-world patterns.*
- **Question Counting**: Track question count starting from 1 at the beginning of each logged session
- **10-Question Threshold**: When a logged session reaches exactly 10 questions AND after completing the git commit and logging to chat, immediately prompt the user with the following message:
  
  > "⚠️ **Session Context Alert**: You've reached 10 questions in this session. Based on observed patterns, AI context begins degrading around 8-10 questions, requiring reminders of previously established information. Would you like to end this session and start a new one to refresh the full context? This ensures optimal adherence to your copilot instructions and project prompts. (Type 'yes' to restart or 'no' to continue)"

- **One-Time Trigger**: This prompt should only appear ONCE per session when crossing the 10-question threshold
- **Technical Rationale**: AI models have finite context windows, and practical experience shows that foundational context (.github files) begins losing priority much earlier than theoretical limits suggest. Context degradation manifests as needing to remind the AI of previously established protocols and information
- **User Choice Preservation**: Always allow the user to choose whether to restart - never force a session restart
- **Context Refresh Benefits**: Session restart reloads all `.github` files with full priority, ensuring consistent instruction adherence and eliminating the need for repeated reminders

## Early Warning Protocol
*Provides additional context awareness for optimal session management.*
- **8-Question Warning**: At question 8, provide a subtle reminder that context may begin degrading soon
- **Signs of Context Degradation**: AI begins asking for reminders of previously established information, forgetting project structure, or not following established protocols consistently
- **Proactive Management**: Users should consider session restart when they notice repeated explanations are needed

## Context Failure Recovery
*Provides recovery mechanism when AI context degrades due to token limitations.*
- If session context appears degraded, immediately reference session logs to restore project understanding
- Session logs act as backup context when AI token limits cause instruction degradation
- All critical protocols must be re-established from session logs when context fails
- Use session restart alert protocol for proactive context management

## Session Length Thresholds for Reference
*Guidelines based on observed real-world context degradation patterns.*
- **1-7 questions**: `.github` context remains fully stable ✅
- **8-10 questions**: Context degradation begins, reminders may be needed ⚠️  
- **10+ questions**: Significant context degradation likely, frequent reminders required ❌

## Status
**ACTIVE** - Core foundational rule that underpins all other protocol operations. Required for all logged sessions. Provides comprehensive session management from initiation through context preservation and degradation prevention.
