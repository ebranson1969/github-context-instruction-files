# Context Degradation Prevention Rule
*Contains critical protocols to maintain .github instruction file context integrity during extended sessions and prevent AI context degradation due to token limitations.*

## Session Restart Alert Protocol
*Proactively manages session length to prevent context degradation in very long sessions.*
- **Question Counting**: Track question count starting from 1 at the beginning of each logged session
- **50-Question Threshold**: When a logged session reaches exactly 50 questions AND after completing the git commit and logging to chat, immediately prompt the user with the following message:
  
  > "⚠️ **Session Context Alert**: You've reached 50 questions in this session. Due to AI token limitations, your `.github` instruction files may begin to lose priority in the context window during very long sessions (100+ questions). Would you like to end this session and start a new one to refresh the full context? This ensures optimal adherence to your copilot instructions and project prompts. (Type 'yes' to restart or 'no' to continue)"

- **One-Time Trigger**: This prompt should only appear ONCE per session when crossing the 50-question threshold
- **Technical Rationale**: AI models have finite context windows (8K-32K tokens). While `.github` files have high priority, extremely long sessions can force foundational context to be pruned due to token competition from conversation history and code outputs
- **User Choice Preservation**: Always allow the user to choose whether to restart - never force a session restart
- **Context Refresh Benefits**: Session restart reloads all `.github` files with full priority, ensuring consistent instruction adherence

## Session Length Thresholds for Reference
*Guidelines for understanding session length impact on context stability.*
- **1-50 questions**: `.github` context remains stable ✅
- **50-100 questions**: Usually retained but may see some truncation ⚠️  
- **100+ questions**: Higher risk of foundational context being pruned ❌

## Status
**ACTIVE** - Addresses context caching behavior analyzed in session logs. Provides proactive solution to prevent instruction degradation. Balances session continuity with context integrity. Ready for implementation in all logged sessions.
