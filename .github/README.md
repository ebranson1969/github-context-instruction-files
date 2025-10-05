# GitHub Configuration

## Description
This directory contains all GitHub-specific configuration files, AI assistant instructions, and modular instruction systems for the GitHub Context Instruction Files project.

## Directory Structure
```
.github/
├── README.md (this file)
├── README-template.md
├── copilot-instructions.md
├── git-commit-instructions.md
├── instructions/
│   └── README.md
└── prompts/
    └── README.md
```

## Parent Directory
- **[↑ Project Root](../README.md)** - Main project documentation

## Child READMEs
- **[📁 Instructions](instructions/README.md)** - Modular instruction system for AI assistant behavior
- **[📁 Prompts](prompts/README.md)** - Prompt templates and examples for AI interactions

## File Descriptions

### 📄 **[copilot-instructions.md](copilot-instructions.md)**
**Master AI Assistant Configuration**
- **Purpose**: Primary configuration file that defines GitHub Copilot behavior, coding standards, and workflow protocols
- **Coverage**: Critical rules, general rules, workflow requirements, coding style preferences, architectural patterns
- **Usage**: Automatically loaded by GitHub Copilot to ensure consistent AI behavior across all interactions
- **Target Audience**: Development teams, AI system administrators, project leads
- **When to Use**: Always active - referenced by AI assistant in every interaction
- **Contains**: Session management protocols, coding standards, documentation requirements, architectural guidelines

### 📄 **[git-commit-instructions.md](git-commit-instructions.md)**
**Git Commit Message Standards**
- **Purpose**: Defines standardized commit message format and content requirements for consistency and traceability
- **Coverage**: Commit message structure, categorization, scope definitions, breaking change protocols
- **Usage**: Reference for all git commit operations to maintain consistent project history
- **Target Audience**: All developers, AI assistants, project managers
- **When to Use**: Every git commit operation, code review processes, project history analysis
- **Contains**: Commit format specifications, category definitions, scope guidelines, examples

### 📄 **[README-template.md](README-template.md)**
**README File Template**
- **Purpose**: Standardized template for creating consistent README files across the project
- **Coverage**: README structure, content requirements, formatting standards, linking protocols
- **Usage**: Foundation for creating new README files that follow project standards
- **Target Audience**: Documentation writers, developers, project maintainers
- **When to Use**: Creating new README files, updating existing documentation, maintaining consistency
- **Contains**: Template structure, content guidelines, formatting examples

### 📄 **[project-instructions.md](instructions/project-instructions.md)**
**Project-Specific Guidelines**
- **Purpose**: Contains project-specific instructions and guidelines that supplement the main copilot instructions
- **Coverage**: Project-specific coding patterns, architectural decisions, team conventions
- **Usage**: Additional context for AI assistant behavior specific to this project
- **Target Audience**: Development team members, AI assistants, new contributors
- **When to Use**: Project onboarding, AI-assisted development, code review processes
- **Contains**: Project conventions, specific requirements, team agreements

---

*Last updated: October 5, 2025*
*Part of: GitHub Context Instruction Files Project*
