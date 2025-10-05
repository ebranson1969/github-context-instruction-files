# Question Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Question Prompt Guide](./guides/question-prompt-guide.md)*

## Template: General Question

```markdown
## Your Question/Request
I want you to start a session to address the following question: I want to enhance question-prompt.md. For now I just 
want you to start the logging. Create a copy of this prompt question file in the logging directory as well as create an exact copy but it 
will address the existing conversation and the only thing that will change is the question.

I also want you to change the prompt so that if it is a New Session you will copy the prompt I put in the chat and create a md file and put it with the logging directory.
s well as create an exact copy but it
will address the existing conversation and the only thing that will change is the question.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Project Information
- Project Name: This of a good one based on hte question
- Session Type: New Session

## Question Context
- Question Type: [Feature Request, Documentation]
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

## Expected Deliverables
files updated

## Research and Documentation Requirements
Session Management Requirements (per Session Management Protocol):
- Log this question in the current session log
- Document research and reasoning for all decisions made
- Track any file modifications and their impact
- Log git commit message if changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/question-prompt.md**
````
