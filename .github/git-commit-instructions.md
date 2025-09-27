# Git Commit Instructions

## Commit Message Format

### Structure
```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (formatting, etc.)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools

### Scope (Optional)
- **context**: Changes to context files
- **guides**: Changes to documentation guides
- **scripts**: Changes to Python scripts
- **setup**: Project setup and configuration changes

### Subject Line
- Use the imperative mood ("Add feature" not "Added feature")
- Keep it under 50 characters
- Don't end with a period
- Be specific and descriptive

## Examples of Good Commit Messages

```
feat(context): add project-specific copilot instructions

Add comprehensive copilot instructions including coding standards,
preferred patterns, and project-specific guidelines to improve
AI-assisted development workflow.

Closes #123
```

```
docs(guides): create copilot context files guide

Add detailed guide explaining the purpose and usage of each context
file in the .github directory structure for better onboarding and
maintenance.
```

```
fix(scripts): resolve file path handling in automation script

Fix issue where relative paths were not resolved correctly when
running scripts from different directories.

Fixes #456
```

```
chore: update project structure and add initial directories

- Add documents/guides/ directory for documentation
- Add scripts/ directory for Python automation
- Create .github context structure for AI assistance
```

## Branch Naming Conventions

### Format
```
<type>/<short-description>
```

### Examples
- `feat/add-context-management`
- `fix/script-path-resolution`
- `docs/update-readme`
- `refactor/reorganize-guides`

## Guidelines for Commit Frequency and Size
# Project Instructions
### Commit Frequency
- Commit early and often
- Make atomic commits (one logical change per commit)
- Don't mix unrelated changes in a single commit
- Commit working code (avoid broken builds)

### Commit Size
- Keep commits focused and small
- Large changes should be broken into smaller commits
- Each commit should represent a complete, logical unit of work
- Avoid commits with more than 10-15 file changes when possible

## Referencing Issues and Tickets

### In Commit Messages
- Use `Closes #123` to automatically close issues
- Use `Fixes #456` for bug fixes
- Use `Refs #789` for general references
- Include issue numbers in commit body when relevant

### In Branch Names
- Include issue numbers when working on specific tickets
- Example: `feat/123-add-context-management`

## Best Practices

### Before Committing
1. Review your changes carefully
2. Test that your code works
3. Update documentation if needed
4. Check that commit message follows guidelines
5. Ensure no sensitive information is included

### Writing Commit Messages
1. Start with a clear, concise subject line
2. Use the body to explain what and why, not how
3. Reference related issues or pull requests
4. Keep lines under 72 characters in the body
5. Use bullet points for multiple changes if needed

### Git History Management
- Use `git rebase` to clean up commit history before merging
- Squash related commits when appropriate
- Keep the main branch clean and linear when possible
- Write commit messages for future maintainers

## Project Overview
This project serves as an AI support and context management system designed to enhance development workflows with AI assistance.

## Architecture
- **Documents**: Contains guides and documentation
- **Scripts**: Houses Python automation scripts
- **Context Management**: Structured approach to AI context using `.github` directory

## Development Workflow

### Setup
1. Clone the repository
2. Review all context files in `.github` directory
3. Install any dependencies as needed
4. Follow coding standards outlined in `copilot-instructions.md`

### Code Style Guidelines
- Use clear, descriptive variable and function names
- Include appropriate comments for complex logic
- Follow consistent formatting and indentation
- Write self-documenting code where possible

### Testing Procedures
- Test all changes before committing
- Include unit tests for new functionality
- Validate documentation changes for accuracy

### Deployment Guidelines
- Follow git commit standards from `git-commit-instructions.md`
- Create meaningful pull requests with clear descriptions
- Review all changes before merging

## Domain-Specific Terminology
- **Context Files**: Configuration files that provide AI assistants with project-specific information
- **Prompt Templates**: Standardized formats for AI interactions
- **AI Support**: Tools and processes that enhance development with AI assistance
