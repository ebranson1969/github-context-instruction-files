# Prompt Creation Template

## Instructions
Use this template when creating new prompt files or templates. This template is designed for prompt development work where you want changes pushed but don't necessarily need detailed session logging.

---

## Your Question/Request
[Describe what type of prompt you want to create - e.g., "Create a prompt template for code review", "Create a bug report prompt", "Create a feature request template"]

---

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: NO** ❌
- [ ] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [x] NO - Skip session logging for this question

*Note: Session logging is defaulted to NO for prompt creation tasks since these are typically iterative development work that doesn't require full documentation.*

---

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manually push when ready)

*Note: PUSH CODE is defaulted to YES for prompt creation so your new templates are immediately available in the repository.*

---

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

**Required Sections:** [List the sections your prompt should include]
- [ ] Problem Description
- [ ] Steps to Reproduce
- [ ] Expected Behavior
- [ ] Actual Behavior
- [ ] Environment Details
- [ ] Priority/Severity
- [ ] Attachments
- [ ] Other: [specify]

---

## File Details
**File Name:** [e.g., bug-report-prompt.md, feature-request-template.md]
**File Location:** [default: .github/prompts/]
**File Format:** [default: Markdown (.md)]

---

## Additional Context
[Optional: Any specific formatting requirements, integration needs, or style preferences]

---

## Expected Deliverables
[Optional: What you expect as the outcome]
- New prompt file created in specified location
- Template includes all required sections
- File follows established formatting standards
- Template is ready for immediate use

---

**Template Usage Instructions:**
1. Replace the "Your Question/Request" section with your prompt creation request
2. Select the type of prompt you're creating from the specifications section
3. Specify required sections and target audience
4. Provide file details (name, location, format)
5. Add any additional context or requirements
6. Submit the prompt

**Default Behavior:**
- Session Logging: NO (prompt creation doesn't require detailed logging)
- PUSH CODE: YES (new prompts will be automatically pushed to repository)

---

## Real-World Examples

### Example 1: Bug Report Prompt Creation
```markdown
## Your Question/Request
Create a comprehensive bug report prompt template that helps users provide all necessary information for effective bug tracking and resolution.

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
- [x] Bug Analysis Template
- [ ] Feature Request Template
- [ ] Code Review Template
- [ ] Documentation Template
- [ ] Workflow Template
- [ ] Other: [specify]

**Target Audience:**
- [x] Developers
- [ ] Project Managers
- [x] QA Testers
- [ ] Documentation Writers
- [ ] General Users
- [ ] Other: [specify]

**Required Sections:**
- [x] Problem Description
- [x] Steps to Reproduce
- [x] Expected Behavior
- [x] Actual Behavior
- [x] Environment Details
- [x] Priority/Severity
- [x] Attachments
- [ ] Other: [specify]

## File Details
**File Name:** bug-report-prompt.md
**File Location:** .github/prompts/
**File Format:** Markdown (.md)

## Additional Context
Template should include checkboxes for severity levels, dropdown-style options for environment details, and clear instructions for each section.

## Expected Deliverables
- New bug report prompt template at .github/prompts/bug-report-prompt.md
- Template includes all specified sections with clear instructions
- Ready-to-copy format for users to fill out
- Examples showing how to complete each section
```

### Example 2: Feature Request Template with Manual Push
```markdown
## Your Question/Request
Create a feature request template that helps stakeholders clearly communicate new feature requirements with business justification and technical considerations.

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: NO** ❌
- [ ] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [x] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [ ] YES - Execute PUSH CODE workflow when all changes are complete
- [x] NO - Do not push changes automatically (I will manually push when ready)

## Prompt Specifications
**What type of prompt are you creating?**
- [ ] Question/Request Template
- [ ] Bug Analysis Template
- [x] Feature Request Template
- [ ] Code Review Template
- [ ] Documentation Template
- [ ] Workflow Template
- [ ] Other: [specify]

**Target Audience:**
- [ ] Developers
- [x] Project Managers
- [ ] QA Testers
- [ ] Documentation Writers
- [x] General Users
- [ ] Other: Business Stakeholders

**Required Sections:**
- [x] Problem Description
- [ ] Steps to Reproduce
- [x] Expected Behavior
- [ ] Actual Behavior
- [ ] Environment Details
- [x] Priority/Severity
- [ ] Attachments
- [x] Other: Business Justification, Success Criteria, Technical Considerations

## File Details
**File Name:** feature-request-template.md
**File Location:** .github/prompts/
**File Format:** Markdown (.md)

## Additional Context
I want to review this template before it goes live to ensure it aligns with our product management process.

## Expected Deliverables
- New feature request template with business-focused sections
- Clear guidance for non-technical stakeholders
- Integration with existing project management workflows
```

### Example 3: Simple Code Review Prompt
```markdown
## Your Question/Request
Create a basic code review prompt template for pull request reviews.

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
- [x] Code Review Template
- [ ] Documentation Template
- [ ] Workflow Template
- [ ] Other: [specify]

**Target Audience:**
- [x] Developers
- [ ] Project Managers
- [ ] QA Testers
- [ ] Documentation Writers
- [ ] General Users
- [ ] Other: [specify]

**Required Sections:**
- [x] Problem Description
- [ ] Steps to Reproduce
- [ ] Expected Behavior
- [ ] Actual Behavior
- [ ] Environment Details
- [ ] Priority/Severity
- [ ] Attachments
- [x] Other: Code Quality, Performance, Security, Documentation

## File Details
**File Name:** code-review-prompt.md
**File Location:** .github/prompts/
**File Format:** Markdown (.md)

## Additional Context
Keep it simple and focused on essential code review criteria.

## Expected Deliverables
- Concise code review prompt template
- Checklist format for quick reviews
- Focus on code quality, security, and performance
```

---

## Copy This Template

**For typical prompt creation work:**
```markdown
## Your Question/Request
[Describe the type of prompt you want to create]

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

**Required Sections:** [List the sections your prompt should include]
- [ ] [Section 1]
- [ ] [Section 2]
- [ ] [Section 3]

## File Details
**File Name:** [your-prompt-name.md]
**File Location:** .github/prompts/
**File Format:** Markdown (.md)

## Additional Context
[Optional: Any specific requirements or preferences]

## Expected Deliverables
[Optional: What you expect as the outcome]
```
