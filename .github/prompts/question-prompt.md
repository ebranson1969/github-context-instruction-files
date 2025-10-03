# Question Prompt Template

## Instructions
Use this template when asking questions that may require session logging and/or code changes that need to be pushed to the repository.

---

## Your Question/Request
[Replace this section with your actual question or request]

---

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: YES** ✅
- [ ] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session logging for this question

*Note: Session logging includes documenting the question, research and reasoning, actions taken, and file modifications in the project session log.*

---

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [ ] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

*Note: If YES is selected, the Manual Git Trigger Workflow will be executed automatically after all changes are completed. If NO is selected, you will need to manually run the git operations or use the PUSH CODE trigger phrase when ready.*

---

## Additional Context
[Optional: Add any additional context, constraints, or specific requirements for your question]

---

## Expected Deliverables
[Optional: List what you expect as the outcome - files to be modified, tasks to be completed, etc.]

---

**Template Usage Instructions:**
1. Replace the "Your Question/Request" section with your actual question
2. Check the appropriate boxes for Session Logging and PUSH CODE protocols (defaults are pre-selected)
3. Add any additional context or expected deliverables
4. Submit the prompt

**Default Behavior:**
- Session Logging: YES (will be logged in project session log)
- PUSH CODE: YES (changes will be automatically pushed when complete)

---

## Real-World Examples

### Example 1: File Organization Question
```markdown
## Your Question/Request
Can you help me move copilot-rules.md and copilot-workflows.md to .github/instructions/ directory? I want to better organize the GitHub context files by grouping all detailed documentation together.

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: YES** ✅
- [x] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Additional Context
Need to update any reference links in copilot-instructions.md that point to these files after moving them.

## Expected Deliverables
- Move copilot-rules.md to .github/instructions/
- Move copilot-workflows.md to .github/instructions/
- Update relative path references in copilot-instructions.md
- Session log entry documenting the reorganization
```

### Example 2: New Feature Implementation with Manual Push
```markdown
## Your Question/Request
Can you create a new prompt template for bug analysis that includes sections for reproduction steps, expected vs actual behavior, environment details, and severity assessment?

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: YES** ✅
- [x] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [ ] YES - Execute PUSH CODE workflow when all changes are complete
- [x] NO - Do not push changes automatically (I will manually push when ready)

## Additional Context
This template should follow the same format as the existing question-prompt.md file and be placed in .github/prompts/ directory. I want to review the template before pushing to ensure it meets our team's bug reporting standards.

## Expected Deliverables
- New file: .github/prompts/bug-analysis-prompt.md
- Template sections for reproduction, environment, severity
- Integration with existing session logging protocols
- Session log entry documenting the new template creation
```

### Example 3: Quick Documentation Update (No Session Logging)
```markdown
## Your Question/Request
Can you fix a typo in the README.md file? Change "GitHub Context Organization" to "GitHub Context Instruction Files" in the main heading.

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: YES** ✅
- [ ] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [x] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Additional Context
This is a simple typo fix that doesn't require detailed session documentation.

## Expected Deliverables
- Updated README.md with corrected heading
- Changes pushed to repository
```

---

## Copy This Template

**For a typical question with full logging and auto-push:**
```markdown
## Your Question/Request
[Your actual question here]

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: YES** ✅
- [x] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Additional Context
[Optional: Any additional context or constraints]

## Expected Deliverables
[Optional: What you expect as the outcome]
```
