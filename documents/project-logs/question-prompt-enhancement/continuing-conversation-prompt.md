## Your Question/Request
[REPLACE THIS WITH YOUR NEW QUESTION - This will be added to the existing session]
I need you to update .github/prompts/prompt-creation-prompt.md. Whn you create the continuing-conversation-prompt.md, I 
want you to copy some sections from the original prompt message exactly as they are.
1. Project Information, except for Session Type, that should remain Continuing Session
2. Everythin except for Your Question/Request, it should start with [REPLACE THIS WITH YOUR NEW QUESTION - This will be added to the existing session]

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Project Information
- Project Name: Question Prompt Enhancement
- Session Type: Continuing Session

## Question Context
- Question Type: Feature Request, Documentation
- Project Area: Fixing and enhancing question-prompt.md
- Priority Level: High

## Session Management Requirements
**Should this question follow the established Session Management Protocol?**

**Default: YES** ✅
- [x] YES - Follow complete Session Management Protocol as defined in [Session Management Protocol](../instructions/core-protocols/session-management-protocol.md)
- [ ] NO - Skip session management requirements for this question

*Note: Session Management Protocol includes logging, context preservation, and degradation prevention requirements.*

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Testing and Validation
**Should the response be validated for completeness?**

**Default: YES** ✅
- [x] YES - Validate that the solution addresses all aspects of the question
- [ ] NO - Skip validation testing

### Validation Checklist:
- [x] All requirements from the question are addressed
- [x] Solution is complete and functional
- [x] No contradictions or conflicts introduced
- [x] All links and references are functional
- [x] Documentation is updated if needed

## Additional Context
.github/prompts/question-prompt.md
.github/prompts

[Add any additional context relevant to your new question]

## Expected Deliverables
Updated files as necessary to address the new question

## Continuing Session Instructions
**FOR CONTINUING SESSIONS:** When using this prompt to continue the existing session, the agent should:
1. Continue using the existing project directory: `documents/project-logs/question-prompt-enhancement/`
2. Add this new question to the existing session log file
3. Increment the question counter in the session log
4. Reference previous context and decisions from earlier questions in the session
5. Do NOT create new project directories or session log files

## Research and Documentation Requirements
Session Management Requirements (per Session Management Protocol):
- Log this question in the EXISTING session log (do not create new project directory)
- Document research and reasoning for all decisions made
- Track any file modifications and their impact
- Log git commit message if changes are pushed
- **Continue existing session log - increment question number**
- **Document prompt source: continuation-prompt.md from project logging directory**