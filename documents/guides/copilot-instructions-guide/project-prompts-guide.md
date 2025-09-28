# Project Prompts Guide

## Overview
This guide explains the `.github/prompts/project.prompt.md` file and how to use it effectively for standardized AI interactions across development tasks. This is your **base template file** that provides standardized prompts for common development scenarios.

## File Purpose
The project.prompt.md file contains standardized prompt templates for AI interactions in various development scenarios, including code review, documentation generation, bug analysis, feature implementation, and refactoring tasks. It ensures consistent, high-quality AI assistance across your development workflow.

**Think of this as your team's "AI conversation starter pack" - instead of everyone asking AI questions differently, you all use the same proven templates.**

## Can You Have Multiple Prompt Files?

**YES!** You can and should create multiple prompt files for different purposes:

### Common Multi-File Patterns:
- **`project.prompt.md`** - Base templates for all teams
- **`security.prompt.md`** - Security-focused prompts for security reviews
- **`performance.prompt.md`** - Performance analysis and optimization prompts  
- **`mobile.prompt.md`** - Mobile app specific prompts
- **`api.prompt.md`** - API design and integration prompts
- **`database.prompt.md`** - Database design and query optimization prompts

### When to Create Additional Prompt Files:
1. **Domain-Specific Teams**: Frontend team needs different prompts than backend team
2. **Compliance Requirements**: Financial/healthcare projects need specialized security prompts
3. **Technology-Specific**: React projects vs Python projects need different context
4. **Project Phases**: Different prompts for MVP vs production optimization phases

## Real-World Usage Scenarios

### Scenario 1: Daily Code Review
**When**: Before every pull request submission
**Why**: Catch issues before peer review, save team time
**How**: Copy the code review template, paste your code, add project context
**Result**: Structured feedback you can act on immediately

### Scenario 2: Emergency Bug Investigation  
**When**: Production is down, customers complaining
**Why**: Get systematic analysis instead of panicked guessing
**How**: Use bug analysis template with error logs and stack traces
**Result**: Clear action plan with immediate fixes and long-term prevention

### Scenario 3: Feature Planning Meeting
**When**: Product team requests new feature
**Why**: Break complex requests into actionable development tasks
**How**: Use feature implementation template to scope work before estimation
**Result**: Detailed implementation plan with timeline and dependencies

## Key Components

### Code Review Prompts
**What it does**: Pre-structured prompts for thorough code analysis focusing on quality, best practices, potential bugs, performance, standards alignment, and documentation completeness.

**When to use**: 
- Before submitting pull requests (self-review)
- When reviewing teammate's code
- During architecture reviews
- Before deploying to production

**Why it's valuable**: Ensures consistent review criteria across all code evaluations, catches issues early, reduces back-and-forth in PR comments.

### Documentation Generation Templates
**What it does**: Standardized prompts for creating comprehensive documentation including purpose, functionality, usage examples, parameters, return values, and important notes.

**When to use**:
- After completing a new feature or function
- When onboarding new team members
- Before releasing APIs to other teams
- During knowledge transfer sessions

**Why it's valuable**: Maintains documentation consistency and completeness, saves time writing from scratch, ensures nothing important is missed.

### Bug Analysis Frameworks
**What it does**: Systematic approaches for analyzing bug reports with root cause analysis, solution identification, reproduction steps, prevention strategies, and priority assessment.

**When to use**:
- When production issues occur
- During post-mortem analysis
- When investigating hard-to-reproduce bugs
- For systematic troubleshooting

**Why it's valuable**: Provides structured problem-solving methodology, prevents missing important clues, creates actionable solutions.

### Feature Implementation Guides
**What it does**: Templates for breaking down feature requests into manageable tasks, identifying dependencies, suggesting implementation approaches, considering edge cases, and developing testing strategies.

**When to use**:
- During sprint planning
- When estimating complex features
- Before starting major development work
- When coordinating team efforts

**Why it's valuable**: Prevents scope creep, identifies risks early, creates realistic timelines, ensures nothing is forgotten.

### Code Refactoring Patterns
**What it does**: Focused prompts for improving code maintainability, performance optimization, readability enhancement, pattern implementation, and modularity improvements.

**When to use**:
- During technical debt reduction sprints
- When performance issues are identified
- Before adding new features to legacy code
- During code quality improvement initiatives

**Why it's valuable**: Provides systematic approach to improvements, identifies best practices, creates maintainable solutions.

## Usage Instructions

### When to Use Each Template

#### Daily Development Workflow:
1. **Morning**: Use feature implementation prompts to plan the day's work
2. **During coding**: Use documentation prompts for complex functions
3. **Before lunch**: Use code review prompts on morning's work
4. **Afternoon**: Continue development with refactoring prompts for cleanup
5. **End of day**: Use bug analysis prompts if issues were found

#### Project Lifecycle:
- **Planning Phase**: Feature implementation templates
- **Development Phase**: Code review and documentation templates  
- **Testing Phase**: Bug analysis templates
- **Maintenance Phase**: Refactoring templates

### How to Modify Templates

#### 1. Customize for Project Needs
**Example**: If you're building a healthcare app, add HIPAA compliance checks to code review prompts:
```
Please review the following code for:
- Code quality and best practices
- Potential bugs or issues
- Performance considerations
- Alignment with project standards
- Documentation completeness
- HIPAA compliance requirements
- PHI data handling security
```

#### 2. Add Context Variables
**Instead of generic prompts, make them project-specific:**
```
Context: [PROJECT_NAME] - E-commerce checkout system
Technology Stack: React frontend, Node.js backend, PostgreSQL
Compliance: PCI DSS Level 1, GDPR
Team Size: 8 developers
Current Sprint: Payment processing improvements
```

#### 3. Extend Categories
**Create new prompt categories for your specific needs:**
- Mobile app performance prompts
- API versioning strategy prompts
- Database migration planning prompts
- Third-party integration prompts

#### 4. Version Control Your Prompts
**Track changes to maintain consistency:**
```markdown
## Prompt Change Log
### v2.1.0 - 2025-09-28
- Added mobile performance considerations
- Enhanced security focus for payment processing
- Added accessibility requirements to code review
```

### Best Practices for Maximum Effectiveness

#### Always Include Context
**Bad prompt**: "Review this code"
**Good prompt**: "Review this Node.js authentication middleware for our e-commerce platform. Focus on security vulnerabilities, rate limiting, and error handling. We're PCI compliant and handle 10k+ daily transactions."

#### Use Structured Responses
**Request specific formats:**
```
Please respond with:
1. Summary of findings (2-3 sentences)
2. Critical issues (if any) with fix suggestions
3. Improvement opportunities
4. Code examples for recommended changes
```

#### Iterative Refinement
**Track what works:**
- Keep a "prompt success log" 
- Note which prompts give the best responses
- Refine based on team feedback
- A/B test different versions

#### Team Alignment
**Ensure consistency:**
- Regular team reviews of prompt effectiveness
- Shared prompt library with version control
- Training sessions on new prompts
- Feedback collection system

## Common Issues and Solutions

### Issue 1: Prompt Effectiveness
- **Problem:** AI responses lack depth or miss important considerations
- **Solution:** Enhance prompts with more specific context, add examples of desired output format, include project-specific constraints

### Issue 2: Context Setting
- **Problem:** AI suggestions don't align with project standards or architecture
- **Solution:** Always include project context patterns, reference related files, specify coding standards and architectural constraints

## Related Files
- `.github/copilot-instructions.md` - Main AI behavior configuration
- `.github/git-commit-instructions.md` - Git workflow standards  
- `.github/instructions/project-instructions.md` - Project-specific guidelines
- `project-prompts-detailed-guide.md` - Comprehensive implementation guide

## Maintenance Notes
- **Regular Review:** Update prompts quarterly based on team feedback and AI response quality
- **Version Tracking:** Document prompt changes and rationale for team awareness
- **Effectiveness Monitoring:** Track usage patterns and response satisfaction
- **Template Evolution:** Continuously refine based on new development scenarios and AI capabilities

---

*Last updated: September 28, 2025*
*Created for: GitHub Context Instruction Files Project*
