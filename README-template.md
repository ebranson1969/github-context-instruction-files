# GitHub Context Instruction Files - Template Repository

## Project Purpose

This repository serves as a **template and development system** for GitHub Copilot instruction files. The **master branch** contains production-ready context files designed to be cloned directly into other projects' `.github` directories.

## Branch Strategy & Usage

### 🚀 **Master Branch (Production)**
- **Purpose**: Production-ready GitHub Copilot context files for deployment to other projects
- **Structure**: Clean, flat file structure optimized for direct use as `.github` directory contents
- **Usage**: Clone this branch into your project's `.github` directory
- **Status**: **DO NOT EDIT DIRECTLY** - All changes come from develop branch via COMMIT CONTEXT workflow

### 🔧 **Develop Branch (Active Development)**
- **Purpose**: Active development of context files with full documentation, guides, and examples
- **Structure**: Complex directory structure with comprehensive documentation system
- **Usage**: Use for improving, testing, and enhancing the GitHub Copilot instruction system
- **Workflow**: Create feature branches from develop, merge back to develop, then deploy to master

### 🌿 **Feature Branches**
- **Purpose**: Individual improvements, bug fixes, and enhancements
- **Workflow**: Branch from develop → make changes → merge back to develop → deploy via COMMIT CONTEXT

## How to Use This System

### For Project Implementation (Using Master Branch)
```bash
# In your target project directory
git clone <repository-url> .github
cd .github
git checkout master
rm -rf .git  # Remove git history to make it part of your project
```

### For Context Development (Using Develop Branch)
```bash
# Clone the full development environment
git clone <repository-url>
cd github-context-instruction-files
git checkout develop

# Create feature branch for improvements
git checkout -b feature/your-improvement
# Make your changes...
git commit -m "Your changes"
git checkout develop
git merge feature/your-improvement

# Deploy to master branch
COMMIT CONTEXT  # This flattens structure and deploys to master
git checkout master
# Verify the clean structure, then merge develop changes
```

## Deployment Workflow

1. **Develop**: Make improvements in develop branch with full documentation
2. **Feature Branch**: Create branches for specific improvements
3. **Merge to Develop**: Integrate improvements back to develop
4. **COMMIT CONTEXT**: Run this command to flatten structure and prepare for deployment
5. **Deploy to Master**: Merge the flattened structure to master branch
6. **Use in Projects**: Master branch provides clean context files for `.github` directories

## What You Get in Master Branch

When you clone the master branch into your project's `.github` directory, you get:

- `README.md` - Template repository documentation and usage instructions

**Note**: The core GitHub Copilot context files (copilot-instructions.md, copilot-rules.md, etc.) are maintained in the develop branch's `.github` directory and deployed through the COMMIT CONTEXT workflow.

## Key Benefits

- **Template System**: Reusable across multiple projects
- **Version Control**: Proper development workflow with feature branches
- **Clean Deployment**: Master branch optimized for direct use
- **Comprehensive Development**: Develop branch includes full documentation and examples
- **Automated Deployment**: COMMIT CONTEXT workflow handles structure flattening

## Development Notes

- **Never edit master branch directly** - it's automatically generated from develop
- **All development happens in develop branch** with proper documentation
- **COMMIT CONTEXT command** handles the deployment transformation automatically
- **Master branch structure** is optimized for GitHub Copilot context loading

---

*This template repository enables consistent, version-controlled GitHub Copilot instruction management across multiple projects while maintaining a clean deployment structure.*
