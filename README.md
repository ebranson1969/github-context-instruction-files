# GitHub Context Instruction Files

## Description
This repository contains comprehensive GitHub Copilot instruction files and documentation that establish standardized protocols for AI-assisted development workflows. The system includes context preservation rules, automated git operations, session management protocols, and detailed coding guidelines to ensure consistent and reliable AI assistance across all development sessions.

## Directory Structure

```
├── README.md (this file)
├── .github/
│   ├── copilot-instructions.md
│   ├── copilot-rules.md
│   ├── copilot-templates.md
│   ├── copilot-workflows.md
│   ├── git-commit-instructions.md
│   ├── README-template.md
│   ├── instructions/
│   │   ├── README.md
│   │   └── project-instructions.md
│   └── prompts/
│       ├── README.md
│       ├── project.prompt.md
│       ├── rules-prompt.md
│       └── workflows-prompt.md
```

## Child Documentation Links
*No child documentation in root directory*

## Core Context Files (in .github directory)

### **copilot-instructions.md**
Primary GitHub Copilot configuration file containing critical rules, session management protocols, and coding style preferences. This file establishes the foundation for all AI-assisted development sessions and includes references to detailed protocols defined in supporting files.

### **copilot-rules.md**
Detailed protocol definitions for session context preservation, question processing workflows, README generation standards, and context degradation prevention. Contains the core operational rules that govern AI assistant behavior throughout development sessions.

### **copilot-workflows.md**
Automated workflow definitions including git operations, manual trigger protocols, and context synchronization procedures. Establishes standardized processes for code deployment, session management, and context file synchronization.

### **copilot-templates.md**
Standardized templates and formats for consistent documentation, commit messages, and session logging. Provides reusable structures to maintain consistency across all project documentation and development workflows.

### **git-commit-instructions.md**
Specialized instructions for git commit message formatting, automated commit procedures, and version control integration. Ensures consistent and traceable commit history with proper documentation linkage.

### **README-template.md**
Template content for deployment to master branch during COMMIT CONTEXT workflow. Contains standardized template repository documentation explaining branch strategy and usage instructions.

## Development Files (in .github directory)

### **instructions/ directory**
Contains project-specific development guidelines and setup instructions for implementing the GitHub Copilot instruction system.

### **prompts/ directory**
Contains AI interaction templates and frameworks including project prompts, rules prompts, and workflow prompts for standardized AI assistance patterns.

## Usage Instructions

1. **Development Work**: All context files are maintained in the `.github` directory during development
2. **COMMIT CONTEXT Workflow**: Use this command to deploy clean structure to master branch
3. **Template System**: This develop branch contains full development environment; master branch contains deployment-ready files
4. **Git Operations**: Use Manual Git Trigger Workflow (`PUSH CODE`) for committing changes

## Key Features

- **Context File Development**: Full development environment in `.github` directory
- **Deployment Workflow**: COMMIT CONTEXT flattens structure for master branch deployment
- **Template Storage**: README-template.md stores deployment README content
- **Development Tools**: Comprehensive instruction and prompt systems for AI assistance

## Status: ACTIVE - DEVELOP BRANCH
This is the development branch containing the full context file development environment. The master branch contains the deployment-ready template files.
