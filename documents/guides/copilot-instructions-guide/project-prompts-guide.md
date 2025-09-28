# Project Prompts Guide

## Overview
This guide explains the `.github/prompts/project.prompt.md` file and how to use it effectively for standardized AI interactions across development tasks.

## File Purpose
The project.prompt.md file contains standardized prompt templates for AI interactions in various development scenarios, including code review, documentation generation, bug analysis, feature implementation, and refactoring tasks. It ensures consistent, high-quality AI assistance across your development workflow.

## Key Components

### Code Review Prompts
Pre-structured prompts for thorough code analysis focusing on quality, best practices, potential bugs, performance, standards alignment, and documentation completeness. Ensures consistent review criteria across all code evaluations.

### Documentation Generation Templates
Standardized prompts for creating comprehensive documentation including purpose, functionality, usage examples, parameters, return values, and important notes. Maintains documentation consistency and completeness.

### Bug Analysis Frameworks
Systematic approaches for analyzing bug reports with root cause analysis, solution identification, reproduction steps, prevention strategies, and priority assessment. Provides structured problem-solving methodology.

### Feature Implementation Guides
Templates for breaking down feature requests into manageable tasks, identifying dependencies, suggesting implementation approaches, considering edge cases, and developing testing strategies.

### Code Refactoring Patterns
Focused prompts for improving code maintainability, performance optimization, readability enhancement, pattern implementation, and modularity improvements.

## Usage Instructions

### When to Use
- **Code Reviews:** Apply templates before submitting or reviewing code
- **Documentation Tasks:** Use when documenting new features or updating existing docs
- **Bug Investigation:** Follow framework when analyzing and resolving issues
- **Feature Development:** Structure new feature work using implementation templates
- **Code Improvement:** Apply refactoring prompts during code optimization cycles

### How to Modify
1. **Customize for Project Needs:** Adapt templates to match your specific project requirements
2. **Add Context Variables:** Include project-specific context elements in brackets
3. **Extend Categories:** Add new prompt categories for specialized development scenarios
4. **Version Control:** Track changes to maintain consistency across team usage

### Best Practices
- **Always Include Context:** Provide relevant project information with each prompt
- **Use Structured Responses:** Request organized, formatted responses from AI
- **Iterative Refinement:** Improve prompts based on response quality and team feedback
- **Team Alignment:** Ensure all team members use consistent prompt formats

## Examples

### Example 1: Code Review Request
```
Using Code Review Prompt for API endpoint review:
- Focus on security considerations for authentication
- Check error handling completeness
- Verify input validation patterns
- Assess performance implications for database queries
```

### Example 2: Documentation Generation
```
Using Documentation Template for new utility function:
- Generate JSDoc comments with parameter types
- Include usage examples with common scenarios  
- Document any side effects or dependencies
- Specify return value structure and possible errors
```

### Example 3: Bug Analysis Session
```
Using Bug Analysis Framework for production issue:
- Analyze stack trace and error patterns
- Identify data flow issues in authentication
- Provide immediate mitigation steps
- Suggest long-term prevention measures
```

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
