# Context Degradation Prevention Rule
*Contains critical protocols to maintain .github instruction file context integrity during extended sessions and prevent AI context degradation due to token limitations.*

## Session Restart Alert Protocol
*Proactively manages session length to prevent context degradation based on observed real-world patterns.*
- **Question Counting**: Track question count starting from 1 at the beginning of each logged session
- **10-Question Threshold**: When a logged session reaches exactly 10 questions AND after completing the git commit and logging to chat, immediately prompt the user with the following message:
  
  > "⚠️ **Session Context Alert**: You've reached 10 questions in this session. Based on observed patterns, AI context begins degrading around 8-10 questions, requiring reminders of previously established information. Would you like to end this session and start a new one to refresh the full context? This ensures optimal adherence to your copilot instructions and project prompts. (Type 'yes' to restart or 'no' to continue)"

- **One-Time Trigger**: This prompt should only appear ONCE per session when crossing the 10-question threshold
- **Technical Rationale**: AI models have finite context windows, and practical experience shows that foundational context (.github files) begins losing priority much earlier than theoretical limits suggest. Context degradation manifests as needing to remind the AI of previously established protocols and information.
- **User Choice Preservation**: Always allow the user to choose whether to restart - never force a session restart
- **Context Refresh Benefits**: Session restart reloads all `.github` files with full priority, ensuring consistent instruction adherence and eliminating the need for repeated reminders

## Early Warning Protocol
*Provides additional context awareness for optimal session management.*
- **8-Question Warning**: At question 8, provide a subtle reminder that context may begin degrading soon
- **Signs of Context Degradation**: AI begins asking for reminders of previously established information, forgetting project structure, or not following established protocols consistently
- **Proactive Management**: Users should consider session restart when they notice repeated explanations are needed

## Session Length Thresholds for Reference
*Guidelines based on observed real-world context degradation patterns.*
- **1-7 questions**: `.github` context remains fully stable ✅
- **8-10 questions**: Context degradation begins, reminders may be needed ⚠️  
- **10+ questions**: Significant context degradation likely, frequent reminders required ❌

## Status
**ACTIVE** - Updated based on real-world observation of context degradation patterns. Provides proactive solution to prevent instruction degradation at the actual observed threshold rather than theoretical limits.
