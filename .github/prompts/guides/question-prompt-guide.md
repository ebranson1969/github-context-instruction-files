# Question Prompt - Examples and Documentation

*Comprehensive guide to understanding and using the general question prompt template*

## File Purpose
This file provides detailed explanations, usage instructions, and multiple examples for the question prompt template located in `question-prompt.md`. Use this template when asking questions that may require session logging and/or code changes that need to be pushed to the repository.

---

## 🚨 CRITICAL: Session Logging Requirements (NON-NEGOTIABLE)
All question activities must be properly logged according to established protocols when session logging is enabled. These requirements are MANDATORY for logged questions.

**Key Requirements:**
- Session logging must be active before starting any logged question
- All research, reasoning, and file modifications must be documented
- The exact prompt used in chat must be logged
- Git commits must be tracked and logged
- Session logging includes documenting the question, research and reasoning, actions taken, and file modifications in the project session log

---

## Template Structure Explanation

### Section 1: Your Question/Request
**Purpose**: Contains your actual question or request
- Replace the placeholder text with your specific question
- Be clear and specific about what you want accomplished
- Include any necessary context within the question itself

### Section 2: Session Logging Protocol
**Purpose**: Determines whether this question should be documented in session logs

**YES (Default)**: Question will be logged with full documentation including:
- Timestamp and question details
- Research and reasoning process
- Actions taken and file modifications
- Results and outcomes

**NO**: Question will not be logged in session logs
- Use for simple questions that don't require documentation
- Appropriate for typo fixes, quick clarifications, etc.

### Section 3: PUSH CODE Protocol
**Purpose**: Determines if code changes should be automatically pushed to git

**YES (Default)**: Changes will be automatically pushed when complete
- Executes Manual Git Trigger Workflow automatically
- Appropriate for most production changes
- Provides immediate deployment of changes

**NO**: Changes will not be automatically pushed
- You retain control over when changes are committed
- Allows for review before pushing
- Use when you want to manually trigger git operations later

### Section 4: Additional Context
**Purpose**: Provides space for additional context, constraints, or requirements
- Optional section for clarifying details
- Include any specific constraints or preferences
- Add background information that might be relevant

### Section 5: Expected Deliverables
**Purpose**: Clearly states what you expect as the outcome
- Optional section for setting expectations
- List specific files that should be modified
- Describe tasks that should be completed
- Helps ensure nothing is missed

---

## Usage Instructions

1. **Copy the template** from `question-prompt.md`
2. **Replace "[Your actual question here]"** with your specific question
3. **Choose Session Logging option** (YES is pre-selected for most cases)
4. **Choose PUSH CODE option** (YES is pre-selected for automatic deployment)
5. **Add any additional context** if needed
6. **List expected deliverables** if helpful
7. **Submit the prompt**

---

## When to Use Each Option

### Session Logging: YES
- Questions involving file modifications
- Complex problem-solving requests
- Feature implementations
- Organizational changes
- Any question where you want a documented trail

### Session Logging: NO
- Simple typo fixes
- Quick clarifications
- Minor documentation updates
- Questions that don't require formal documentation

### PUSH CODE: YES
- Production-ready changes
- Changes that should be deployed immediately
- Standard file modifications
- When you want automatic git operations

### PUSH CODE: NO
- Changes you want to review first
- Experimental or draft changes
- When you want to batch multiple changes before pushing
- When you prefer manual control over git operations

---

## Example 1: File Organization Question (Full Logging + Auto Push)

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

---

## Example 2: New Feature Implementation (Full Logging + Manual Push)

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

---

## Example 3: Simple Fix (No Logging + Auto Push)

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

## Example 4: Research Question (Logging Only, No Code Changes)

```markdown
## Your Question/Request
Can you analyze the current project structure and provide recommendations for organizing the documentation files? I want to understand the best practices for structuring GitHub context instruction files.

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
This is a research and analysis request that may not result in immediate file changes. I want the analysis documented but will implement recommendations separately.

## Expected Deliverables
- Analysis of current project structure
- Recommendations for documentation organization
- Best practices assessment
- Session log entry documenting the research and recommendations
```

---

## Common Patterns and Best Practices

### Default Behavior
- **Session Logging: YES** - Most questions benefit from documentation
- **PUSH CODE: YES** - Most changes should be deployed immediately

### When to Override Defaults

**Turn OFF Session Logging for:**
- Simple typos or minor corrections
- Quick clarifications that don't need documentation
- Repetitive tasks that don't add value to session logs

**Turn OFF PUSH CODE for:**
- Changes you want to review before deployment
- Experimental or draft implementations
- When batching multiple changes before pushing
- Complex changes that need validation

### Best Practices
- Be specific and clear in your question
- Include relevant context within the question itself
- Use Additional Context for constraints and preferences
- List Expected Deliverables for complex requests
- Consider the long-term value of session logging for each question

This comprehensive guide provides everything needed to understand and effectively use the question prompt template for any type of request or inquiry.
