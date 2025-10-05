# Question Prompt Template - Continuing Conversation

*For detailed explanations, examples, and usage instructions, see: [Question Prompt Guide](./guides/question-prompt-guide.md)*

## Template: Continuing Conversation Question

```markdown
## Your Question/Request
[REPLACE THIS WITH YOUR NEW QUESTION - This template is for continuing an existing conversation/session]

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Project Information
- Project Name: [KEEP EXISTING PROJECT NAME FROM CURRENT SESSION]
- Session Type: Continuing Session

## Question Context
- Question Type: [Feature Request, Bug Fix, Documentation, Code Review, Refactoring, etc.]
- Project Area: [Describe the specific area or component being addressed]
- Priority Level: [High, Medium, Low]

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
[Add any relevant file paths, previous decisions, or context from earlier in the session that relates to this new question]

## Expected Deliverables
[Describe what you expect to be delivered, created, or modified for this specific question]

## Continuing Session Instructions
**FOR CONTINUING SESSIONS:** When using this prompt to continue an existing session, the agent should:
1. Continue using the existing project directory under `documents/project-logs/[existing-project-name]/`
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
- **Document prompt source: .github/prompts/question-prompt-continuing.md**
````

---

## Usage Instructions

### For Continuing Sessions:
1. Replace `[REPLACE THIS WITH YOUR NEW QUESTION]` with your new question
2. Keep the same project name from your current session
3. Fill in the question context details for this specific question
4. Reference any previous work or context from earlier questions
5. The agent will add this to your existing session log

### Important Notes:
- This template is specifically for adding questions to existing sessions
- For new sessions, use `.github/prompts/question-prompt.md`
- The agent will increment question counters and maintain session continuity
- Previous context and decisions will be preserved and referenced
