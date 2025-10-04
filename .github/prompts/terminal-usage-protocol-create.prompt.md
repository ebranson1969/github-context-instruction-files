# Terminal Usage Protocol Creation Prompt

## What This Prompt Is For
This prompt is designed to help AI assistants create a new **Terminal Usage Protocol** rule for GitHub Copilot instruction systems. Use this prompt when you need to establish standardized terminal command usage across all AI-generated code, ensuring bash compatibility and cross-platform consistency.

## How to Use This Prompt

### When to Use
- **Creating from scratch**: No Terminal Usage Protocol exists in your copilot rules
- **Initial setup**: Setting up standardized terminal command guidelines for the first time
- **New projects**: Establishing terminal usage standards for new development environments

### Usage Examples

**Example 1: Basic Creation Request**
```
User: "Create a Terminal Usage Protocol for our copilot rules that standardizes on bash commands."

AI Response: [Uses this prompt to generate a complete Terminal Usage Protocol section with bash requirements, Python integration guidelines, and prohibited terminal types]
```

**Example 2: Specific Requirements**
```
User: "We need a terminal protocol that works across Windows, Mac, and Linux. Create one that focuses on bash compatibility."

AI Response: [Uses this prompt with emphasis on cross-platform compatibility requirements]
```

**Example 3: Integration with Existing Rules**
```
User: "Add a Terminal Usage Protocol to our existing copilot-instructions.md file that matches our current rule format."

AI Response: [Uses this prompt to create a protocol that integrates seamlessly with existing rule structure]
```

### Expected Workflow
1. **Analyze Requirements**: Review what terminal standardization is needed
2. **Apply This Prompt**: Use the structured guidance below to create the protocol
3. **Generate Complete Rule**: Create a full Terminal Usage Protocol section
4. **Integrate**: Insert the generated protocol into your copilot rules file
5. **Activate**: Set status to ACTIVE and begin enforcement

---

## Context
You need to create a new Terminal Usage Protocol rule for the GitHub Copilot Rules system. This protocol will standardize terminal command usage across all AI-generated code to ensure consistency and cross-platform compatibility.

## Objective
Create a comprehensive Terminal Usage Protocol that establishes bash as the standard terminal environment while defining acceptable usage patterns and prohibited terminal types.

## Requirements

### Rule Structure
- Follow the existing copilot-rules.md format with proper markdown headers
- Include a descriptive subtitle explaining the rule's purpose
- Organize content into logical sub-protocols with clear headers
- Include a status section (ACTIVE/NOT ACTIVE) with explanatory text

### Core Components to Include

**Bash Terminal Requirements**
- Establish bash as the standard terminal environment
- Require bash compatibility for all terminal operations
- Ensure cross-platform compatibility through standard bash syntax
- Avoid platform-specific command variations

**Python Integration Protocol**
- Define how Python can be used within bash commands
- Specify execution requirements through bash
- Address proper integration with bash workflow
- Cover command chaining and piping requirements

**Prohibited Terminal Types**
- Explicitly restrict PowerShell usage
- Prohibit Command Prompt (cmd.exe) specific commands
- Exclude zsh-specific features and syntax
- Ban other shell-specific commands (fish, tcsh, etc.)
- Emphasize bash-compatibility requirements

### Technical Considerations
- Address cross-platform compatibility concerns
- Consider both local and CI/CD environment usage
- Ensure the protocol supports standard development workflows
- Account for different operating system requirements

### Documentation Standards
- Use clear, actionable language
- Provide specific examples where helpful
- Include rationale for restrictions
- Maintain consistency with existing rule formatting

## Expected Output
A complete Terminal Usage Protocol section that can be directly inserted into the copilot-rules.md file, formatted according to established conventions and ready for immediate implementation.

## Success Criteria
- Protocol is comprehensive and covers all major terminal usage scenarios
- All requirements are clearly defined and actionable
- Prohibited usage is explicitly stated to prevent confusion
- Format matches existing copilot-rules.md structure
- Content is ready for immediate activation and use
