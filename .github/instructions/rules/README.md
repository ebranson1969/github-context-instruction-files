# Rules

## Description
This directory contains general rules that define AI assistant behavior patterns, documentation workflows, and operational standards for the GitHub Context Instruction Files project.

## Directory Structure
```
rules/
├── README.md (this file)
├── question-processing-rule.md
└── readme-generation-rule.md
```

## Parent Directory
- **[↑ Instructions](.github/instructions/README.md)** - Modular instruction system for AI assistant behavior

## Rule Descriptions

### 📄 **[question-processing-rule.md](.github/instructions/rules/question-processing-rule.md)**
**Question Documentation Workflow**
- **Purpose**: Controls what happens after each user question is asked and defines the complete workflow for documenting responses
- **Coverage**: Question logging protocols, research documentation, change tracking, git commit message logging
- **Usage**: Automatically enforced for every user interaction to ensure comprehensive session documentation
- **Target Audience**: AI assistants, development teams, project managers
- **When to Use**: Every user question and interaction - mandatory workflow enforcement
- **Contains**: Question logging requirements, research documentation protocols, change tracking procedures, git integration

### 📄 **[readme-generation-rule.md](.github/instructions/rules/readme-generation-rule.md)**
**README File Standards and Automation**
- **Purpose**: Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure
- **Coverage**: File format requirements, parent-child relationships, directory linking protocols, content standards
- **Usage**: Applied when creating or updating README files to ensure consistency across the project
- **Target Audience**: Documentation writers, AI assistants, developers, project maintainers
- **When to Use**: Creating new directories, updating documentation, maintaining project structure
- **Contains**: README format specifications, linking requirements, organizational standards, automation protocols

---

*Last updated: October 5, 2025*
*Part of: GitHub Context Instruction Files Project*
