# Prompt Creation Prompt Template

*For detailed explanations, examples, and usage instructions, see: [Prompt Creation Guide](./guides/prompt-creation-prompt-guide.md)*

## Template: Create New Prompt

```markdown
## Your Question/Request
[Describe what type of prompt you want to create - e.g., "Create a prompt template for code review", "Create a bug report prompt", "Create a feature request template"]

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: NO** ❌
- [ ] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [x] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

## Prompt Specifications
**What type of prompt are you creating?**
- [ ] Question/Request Template
- [ ] Bug Analysis Template
- [ ] Feature Request Template
- [ ] Code Review Template
- [ ] Documentation Template
- [ ] Workflow Template
- [ ] Other: [specify]

**Target Audience:**
- [ ] Developers
- [ ] Project Managers
- [ ] QA Testers
- [ ] Documentation Writers
- [ ] General Users
- [ ] Other: [specify]

**File Location:**
.github/prompts/[INSERT-KEBAB-CASE-FILENAME].md

**Template Structure:**
[Describe the sections and structure the new prompt should have]

## Additional Context
[Optional: Any specific requirements, constraints, or formatting preferences]

## Expected Deliverables
- New prompt template file created in .github/prompts/
- Template follows established formatting standards
- Template includes appropriate session logging and push code sections
```
