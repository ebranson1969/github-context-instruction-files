# Session Context Preservation Rule
*Establishes critical session management protocols that MUST be maintained across all interactions, regardless of token limitations or session failures. These protocols ensure session continuity and context preservation for optimal AI assistant performance.*

## Mandatory Session Logging
*Ensures all agent interactions are properly documented and preserved for future reference.*
- Session logging MUST be the first and last action for every user request, regardless of the task.
- Session logging is a gating requirement: no other actions (file edits, commits, etc.) may be performed until the session log is updated.
- The agent MUST verify the session log after every user interaction and before ending its turn, ensuring no step is missed.
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

## Context Failure Recovery
*Provides recovery mechanism when AI context degrades due to token limitations.*
- If session context appears degraded, immediately reference session logs to restore project understanding
- Session logs act as backup context when AI token limits cause instruction degradation
- All critical protocols must be re-established from session logs when context fails
- Optional: Cross-reference to Session Context Alert Protocol for proactive context management

## Status
**ACTIVE** - Core foundational rule that underpins all other protocol operations. Required for all logged sessions.
