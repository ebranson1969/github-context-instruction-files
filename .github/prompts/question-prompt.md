# Question Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Question Prompt Guide](./guides/question-prompt-guide.md)*

## Template: New Session Question

```markdown
## Your Question/Request
[REPLACE THIS WITH YOUR SPECIFIC QUESTION OR REQUEST]

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

## Project Information
- Project Name: [PROVIDE A DESCRIPTIVE PROJECT NAME BASED ON YOUR QUESTION]
- Session Type: New Session

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
[Add any relevant file paths, existing issues, or background information that will help address your question]

## Expected Deliverables
[Describe what you expect to be delivered, created, or modified]
```

**AUTOMATED WORKFLOW FOR AGENTS:**
When using this prompt for a new session, the agent should automatically create a continuation prompt file at `documents/project-logs/[project-name]/continuation-prompt.md` that copies ALL sections from the original prompt with these specific changes:

1. **Your Question/Request section**: Replace with "[REPLACE THIS WITH YOUR NEW QUESTION - This will be added to the existing session]"
2. **Project Information - Session Type**: Change from "New Session" to "Continuing Session"
3. **ALL OTHER SECTIONS**: Copy exactly as they appear in the original prompt (Project Name, Question Context, Session Management Requirements, PUSH CODE Protocol, Testing and Validation, Additional Context, Expected Deliverables)

This ensures continuation prompts maintain full consistency with the original prompt's settings and context.
