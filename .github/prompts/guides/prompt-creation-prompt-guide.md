# Prompt Creation - Examples and Documentation

*Comprehensive guide to understanding and using the prompt creation template*

## File Purpose
This file provides detailed explanations, usage instructions, and multiple examples for the prompt creation template located in `prompt-creation-template.md`. Use this guide to understand how to create new prompt templates for your project.

---

## 🚨 CRITICAL: Session Logging Requirements (NON-NEGOTIABLE)
Prompt creation activities typically do NOT require session logging since they're iterative development work. However, if you're creating prompts as part of a larger documented project, you may choose to enable logging.

**Key Requirements:**
- Session logging is defaulted to NO for prompt creation tasks
- PUSH CODE is defaulted to YES to make templates immediately available
- New prompts should follow established formatting standards
- All prompts should include session logging and push code protocols

---

## Template Structure Explanation

### Section 1: Your Question/Request
**Purpose**: Describes what type of prompt you want to create
- Be specific about the prompt's purpose and use case
- Include examples of what the prompt should help users accomplish
- Mention any specific formatting or structure requirements

### Section 2: Session Logging Protocol
**Purpose**: Determines whether prompt creation should be documented in session logs

**NO (Default)**: Prompt creation will not be logged
- Appropriate for iterative development work
- Reduces documentation overhead for template creation
- Most common choice for prompt development

**YES**: Prompt creation will be logged with full documentation
- Use when prompt creation is part of a larger documented project
- Appropriate for formal template development initiatives

### Section 3: PUSH CODE Protocol
**Purpose**: Determines if new prompts should be automatically pushed to git

**YES (Default)**: New prompts will be automatically pushed when complete
- Makes templates immediately available in the repository
- Appropriate for most prompt creation scenarios
- Enables immediate testing and use of new templates

**NO**: New prompts will not be automatically pushed
- Use when you want to review templates before deployment
- Appropriate for experimental or draft templates

### Section 4: Prompt Specifications
**Purpose**: Defines the type and target audience for the new prompt

**Prompt Types:**
- **Question/Request Template**: General inquiry prompts
- **Bug Analysis Template**: Structured bug reporting and analysis
- **Feature Request Template**: Feature proposal and specification
- **Code Review Template**: Code quality and review prompts
- **Documentation Template**: Documentation creation and maintenance
- **Workflow Template**: Process and procedure prompts
- **Other**: Custom prompt types for specific needs

**Target Audiences:**
- **Developers**: Technical implementation prompts
- **Project Managers**: Planning and coordination prompts
- **QA Testers**: Testing and quality assurance prompts
- **Documentation Writers**: Content creation prompts
- **General Users**: Broad-audience prompts
- **Other**: Specialized audience prompts

### Section 5: File Location
**Purpose**: Specifies where the new prompt file should be created
- Always use `.github/prompts/` directory
- Use kebab-case for filenames
- Include appropriate file extension (`.md`)

### Section 6: Template Structure
**Purpose**: Describes the sections and organization of the new prompt
- Define main sections and their purposes
- Specify required vs optional sections
- Include formatting and style requirements

### Section 7: Additional Context
**Purpose**: Provides space for specific requirements or constraints
- Include any special formatting needs
- Mention integration requirements with existing systems
- Add any constraints or limitations

### Section 8: Expected Deliverables
**Purpose**: Clearly states what will be created
- New prompt template file in the correct location
- Template following established standards
- Appropriate session logging and push code sections included

---

## Usage Instructions

1. **Copy the template** from `prompt-creation-template.md`
2. **Describe your prompt** in the Your Question/Request section
3. **Choose logging option** (NO is pre-selected for efficiency)
4. **Choose push option** (YES is pre-selected for immediate availability)
5. **Select prompt type** from the checkboxes
6. **Select target audience** from the options
7. **Specify file location** using kebab-case naming
8. **Describe template structure** with sections and organization
9. **Add any additional context** if needed
10. **Submit the prompt**

---

## Example 1: Bug Analysis Template Creation

```markdown
## Your Question/Request
Create a prompt template for bug analysis that includes sections for reproduction steps, expected vs actual behavior, environment details, and severity assessment. This should help developers and QA testers systematically document and analyze bugs.

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

**File Location:**
.github/prompts/bug-analysis-prompt.md

**Template Structure:**
- Bug Summary section for brief description
- Reproduction Steps with numbered list
- Expected vs Actual Behavior comparison
- Environment Details (OS, browser, versions)
- Severity Assessment (Critical, High, Medium, Low)
- Screenshots/Attachments section
- Session logging and push code protocols

## Additional Context
Template should be structured to work well for both manual testing and automated bug reporting. Include examples in each section to guide users.

## Expected Deliverables
- New prompt template file created in .github/prompts/
- Template follows established formatting standards
- Template includes appropriate session logging and push code sections
```

---

## Example 2: Feature Request Template Creation

```markdown
## Your Question/Request
Create a prompt template for feature requests that includes sections for business justification, user stories, acceptance criteria, technical considerations, and implementation timeline. This should help product managers and stakeholders formally propose new features.

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: NO** ❌
- [x] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [ ] NO - Skip session logging for this question

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
- [x] Developers
- [x] Project Managers
- [ ] QA Testers
- [ ] Documentation Writers
- [x] General Users
- [ ] Other: [specify]

**File Location:**
.github/prompts/feature-request-prompt.md

**Template Structure:**
- Feature Summary with clear title and description
- Business Justification explaining the need
- User Stories in standard format (As a... I want... So that...)
- Acceptance Criteria with testable conditions
- Technical Considerations and constraints
- Implementation Timeline estimates
- Priority Level assignment
- Session logging and push code protocols

## Additional Context
This template will be reviewed by the product team before deployment, so I want to examine it first rather than auto-pushing. Include sections for both technical and business stakeholders.

## Expected Deliverables
- New prompt template file created in .github/prompts/
- Template follows established formatting standards
- Template includes appropriate session logging and push code sections
```

---

## Example 3: Documentation Template Creation

```markdown
## Your Question/Request
Create a prompt template for API documentation that includes sections for endpoint description, parameters, request/response examples, error codes, and usage examples. This should help developers create consistent and comprehensive API documentation.

## Session Logging Protocol
**Should this question be logged according to established session logging protocols?**

**Default: NO** ❌
- [ ] YES - Log this question with full documentation (timestamp, research, reasoning, actions taken)
- [x] NO - Skip session logging for this question

## PUSH CODE Protocol
**Should changes be automatically pushed to the repository when complete?**

**Default: YES** ✅
- [x] YES - Execute PUSH CODE workflow when all changes are complete
- [ ] NO - Do not push changes automatically (I will manual push when ready)

## Prompt Specifications
**What type of prompt are you creating?**
- [ ] Question/Request Template
- [ ] Bug Analysis Template
- [ ] Feature Request Template
- [ ] Code Review Template
- [x] Documentation Template
- [ ] Workflow Template
- [ ] Other: [specify]

**Target Audience:**
- [x] Developers
- [ ] Project Managers
- [ ] QA Testers
- [x] Documentation Writers
- [ ] General Users
- [ ] Other: [specify]

**File Location:**
.github/prompts/api-documentation-prompt.md

**Template Structure:**
- API Endpoint Overview with URL and method
- Description and Purpose explanation
- Authentication Requirements
- Parameters section (path, query, body)
- Request Examples with code samples
- Response Examples with status codes
- Error Codes and descriptions
- Usage Examples and best practices
- Session logging and push code protocols

## Additional Context
Template should support REST APIs primarily but be flexible enough for GraphQL endpoints. Include syntax highlighting for JSON examples.

## Expected Deliverables
- New prompt template file created in .github/prompts/
- Template follows established formatting standards
- Template includes appropriate session logging and push code sections
```

---

## Common Patterns and Best Practices

### Prompt Naming Conventions
- Use descriptive, clear names that indicate the prompt's purpose
- End template files with "-prompt.md" for consistency
- Use kebab-case for filenames (e.g., "bug-analysis-prompt.md")

### File Organization
- All prompts go in `.github/prompts/` directory
- Guide files go in `.github/prompts/guides/` directory
- Follow the established template-guide relationship pattern

### Template Structure Standards
- Include "Your Question/Request" section
- Always include Session Logging Protocol section
- Always include PUSH CODE Protocol section
- Add Additional Context and Expected Deliverables sections
- Use appropriate defaults for each prompt type

### Content Guidelines
- Write clear, actionable instructions
- Include examples where helpful
- Use consistent formatting and markdown syntax
- Test prompts before finalizing

### Default Settings by Prompt Type

**Development/Iterative Prompts:**
- Session Logging: NO (reduces overhead)
- PUSH CODE: YES (immediate availability)

**Formal/Project Prompts:**
- Session Logging: YES (documentation trail)
- PUSH CODE: YES or NO (depends on review needs)

**Experimental Prompts:**
- Session Logging: NO (experimental nature)
- PUSH CODE: NO (review before deployment)

This comprehensive guide provides everything needed to understand and effectively create new prompt templates for any purpose or audience.
