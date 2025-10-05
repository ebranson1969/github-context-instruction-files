# Workflows Creation Prompt - Examples and Documentation

*Comprehensive guide to understanding and using the unified workflows creation prompt template*

## File Purpose
This file provides detailed explanations, usage instructions, and multiple examples for the workflows creation prompt template located in `workflows-prompt.md`. Use this guide to understand how to properly fill out and use the template.

---

## 🚨 CRITICAL: Session Logging Requirements (NON-NEGOTIABLE)
All workflow creation activities must be properly logged according to established protocols. These requirements are MANDATORY for every workflow creation request.

**Key Requirements:**
- Session logging must be active before starting any workflow creation
- All research, reasoning, and file modifications must be documented
- The exact prompt used in chat must be logged
- Git commits must be tracked and logged
- No workflow implementation is considered complete without proper logging

---

## Template Structure Explanation

### Section 1: Your Question/Request
**Purpose**: Establishes the context and ensures session logging is activated
- Always starts with "I need you to create a new workflow in the modular instruction system"
- Includes mandatory session logging reminder
- Sets expectation for comprehensive documentation

### Section 2: Workflow Information
**Purpose**: Defines the basic metadata and structure for the workflow

**Workflow Name**: The formal name of the workflow (e.g., "Automatic Git Operations Workflow")
**Workflow Description**: A concise explanation of what the workflow establishes or controls
**File Location**: The exact path where the workflow file will be created (always follows pattern: `.github/instructions/workflows/[kebab-case-name]-workflow.md`)

### Section 3: Protocol Sections Needed
**Purpose**: Defines the main organizational sections within the workflow file
- Each protocol section represents a major area of control or functionality
- Include a brief description for each section
- These become the main headings (##) in the workflow file

### Section 4: Specific Requirements
**Purpose**: Lists the detailed requirements and bullet points for each protocol section
- These become the actual implementation details
- Should be actionable and specific
- Will be organized under the appropriate protocol sections

### Section 5: Workflow Status (ACTIVE/NOT ACTIVE)
**Purpose**: Determines whether the workflow gets a reference link in the main copilot-instructions.md file

**ACTIVE (Default)**: Creates both the workflow file AND adds a reference link to copilot-instructions.md
- Requires additional information for the reference link
- Most common choice for production workflows

**NOT ACTIVE**: Creates only the workflow file without a reference link
- Used for draft workflows or workflows not yet ready for production
- Can be activated later by manually adding the reference link

### Section 6: If ACTIVE Additional Information
**Purpose**: Provides the metadata needed to create the reference link

**Purpose Description**: The urgency/importance level (usually in ALL CAPS)
**Reference Description**: The text that appears in the link description
**Location**: Whether it goes in AGENT WORKFLOW REQUIREMENTS or another section

### Section 7: Reference Link Format
**Purpose**: Shows exactly how the link will appear in copilot-instructions.md
- Includes the purpose description and link to the workflow file

### Section 8: Workflow File Structure
**Purpose**: Provides the template structure for the actual workflow file
- Shows how the protocol sections and requirements will be organized

### Section 9: Session Logging Protocol
**Purpose**: Confirms that the session will be logged (almost always YES)

### Section 10: PUSH CODE Protocol
**Purpose**: Determines if changes should be automatically pushed to git (almost always YES)

### Section 11: Additional Context
**Purpose**: Provides specific logging requirements and traceability information

### Section 12: Expected Deliverables
**Purpose**: Clearly states what files will be created and what actions will be taken

---

## Usage Instructions

1. **Ensure Session Logging is Active** - Verify you're in a logged session
2. **Copy the entire template** from `workflows-prompt.md`
3. **Replace all `[INSERT...]` placeholders** with your specific information
4. **Choose ACTIVE or NOT ACTIVE** (ACTIVE is pre-selected)
5. **If ACTIVE, fill in the reference link information**
6. **Use kebab-case for filenames** (e.g., `my-new-workflow-name-workflow.md`)
7. **Paste the completed prompt into chat**

---

## Example 1: ACTIVE Workflow - Automatic Git Operations

```markdown
## Your Question/Request
I need you to create a new workflow in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Workflow Information:
- Workflow Name: Automatic Git Operations Workflow
- Workflow Description: Establishes automated git operations for session management and code deployment
- File Location: .github/instructions/workflows/automatic-git-operations-workflow.md

Protocol Sections Needed:
- Git Command Execution Protocol: Defines the standardized git command sequence for automatic operations
- Chat Logging Protocol: Ensures transparency and confirmation of git operations to the user
- Error Handling Protocol: Manages failure scenarios and recovery procedures for git operations

Specific Requirements:
- Execute single consolidated command with proper chaining
- Initial status check shows files to be processed before operations begin
- Final status check verifies successful completion with empty output
- Log successful commit messages to chat for confirmation
- Provide clear indication when git operations have been executed
- Include commit hash and message details for traceability
- Retry failed operations once before reporting to user
- Provide clear error messaging for manual intervention
- Preserve session state during error recovery

## Workflow Status
**Should this workflow be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create workflow file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create workflow file only (no reference link)

### If ACTIVE, provide additional information:
- Purpose Description: AUTOMATED GIT OPERATIONS FOR SESSION MANAGEMENT AND CODE DEPLOYMENT
- Reference Description: Automatic Git Operations Workflow
- Location in copilot-instructions.md: AGENT WORKFLOW REQUIREMENTS

### Reference Link Format (for ACTIVE workflows):
#### Automatic Git Operations Workflow
- *AUTOMATED GIT OPERATIONS FOR SESSION MANAGEMENT AND CODE DEPLOYMENT*

- For complete Automatic Git Operations Workflow, see: [Automatic Git Operations Workflow](./instructions/workflows/automatic-git-operations-workflow.md)

Workflow File Structure:
# Automatic Git Operations Workflow
*Establishes automated git operations for session management and code deployment*

## Git Command Execution Protocol
*Defines the standardized git command sequence for automatic operations*
- Execute single consolidated command with proper chaining
- Initial status check shows files to be processed before operations begin
- Final status check verifies successful completion with empty output

## Chat Logging Protocol
*Ensures transparency and confirmation of git operations to the user*
- Log successful commit messages to chat for confirmation
- Provide clear indication when git operations have been executed
- Include commit hash and message details for traceability

## Error Handling Protocol
*Manages failure scenarios and recovery procedures for git operations*
- Retry failed operations once before reporting to user
- Provide clear error messaging for manual intervention
- Preserve session state during error recovery

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
Session Logging Requirements:
- Log this workflow creation in the current session log
- Document research and reasoning for workflow design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both workflow file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to workflow file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md**

## Expected Deliverables
- New workflow file created in .github/instructions/workflows/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Workflow file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```

---

## Example 2: NOT ACTIVE Draft Workflow - Code Quality Validation

```markdown
## Your Question/Request
I need you to create a new workflow in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Workflow Information:
- Workflow Name: Code Quality Validation Workflow
- Workflow Description: Establishes automated code quality checks and validation procedures for all code submissions
- File Location: .github/instructions/workflows/code-quality-validation-workflow.md

Protocol Sections Needed:
- Code Analysis Protocol: Defines automated code quality scanning and analysis procedures
- Validation Standards Protocol: Establishes minimum quality thresholds and acceptance criteria
- Reporting Protocol: Manages quality report generation and stakeholder notifications

Specific Requirements:
- All code submissions must pass automated quality scans before approval
- Quality reports must include security vulnerabilities, code complexity, and test coverage metrics
- Failed validations must trigger notification to development team with detailed remediation guidance
- Quality metrics must be tracked and reported to project stakeholders
- Integration with existing CI/CD pipeline for seamless validation
- Support for multiple programming languages and frameworks

## Workflow Status
**Should this workflow be ACTIVE or NOT ACTIVE?**

- [ ] **ACTIVE** - Create workflow file AND add reference link to .github/copilot-instructions.md
- [x] **NOT ACTIVE** - Create workflow file only (no reference link)

### If ACTIVE, provide additional information:
- Purpose Description: [INSERT PURPOSE DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]
- Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK - AGENT WORKFLOW REQUIREMENTS or OTHER SECTION]

### Reference Link Format (for ACTIVE workflows):
#### [Workflow Name]
- *[PURPOSE DESCRIPTION IN UPPERCASE]*

- For complete [Reference Description], see: [[Workflow Name]](./instructions/workflows/[filename]-workflow.md)

Workflow File Structure:
# Code Quality Validation Workflow
*Establishes automated code quality checks and validation procedures for all code submissions*

## Code Analysis Protocol
*Defines automated code quality scanning and analysis procedures*
- All code submissions must pass automated quality scans before approval
- Quality reports must include security vulnerabilities, code complexity, and test coverage metrics

## Validation Standards Protocol
*Establishes minimum quality thresholds and acceptance criteria*
- Failed validations must trigger notification to development team with detailed remediation guidance
- Quality metrics must be tracked and reported to project stakeholders

## Reporting Protocol
*Manages quality report generation and stakeholder notifications*
- Integration with existing CI/CD pipeline for seamless validation
- Support for multiple programming languages and frameworks

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
Session Logging Requirements:
- Log this workflow creation in the current session log
- Document research and reasoning for workflow design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both workflow file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to workflow file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md**

## Expected Deliverables
- New workflow file created in .github/instructions/workflows/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Workflow file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```

---

## Common Patterns and Best Practices

### Workflow Naming Conventions
- Use descriptive, clear names that indicate the workflow's purpose
- End all workflow names with "Workflow" for consistency
- Use title case (e.g., "Automatic Git Operations Workflow", not "automatic git operations workflow")

### File Naming Conventions
- Use kebab-case for filenames (lowercase with hyphens)
- Always end with "-workflow.md"
- Examples: `automatic-git-operations-workflow.md`, `code-quality-validation-workflow.md`

### Protocol Section Organization
- Organize sections logically from general to specific
- Use parallel structure in section names
- Include 2-4 main protocol sections per workflow for optimal organization

### Requirement Writing Guidelines
- Write requirements as actionable statements
- Include specific metrics and timeframes where applicable
- Use "must" for mandatory requirements, "should" for recommendations
- Be specific about who is responsible for each requirement

### ACTIVE vs NOT ACTIVE Decision Guide
- Choose **ACTIVE** for workflows that are ready for immediate implementation
- Choose **NOT ACTIVE** for draft workflows, experimental processes, or workflows pending approval
- Most production workflows should be ACTIVE to ensure visibility in the main instructions

### Reference Link Placement Guide
- **AGENT WORKFLOW REQUIREMENTS**: Core agent processes, git operations, session management
- **OTHER SECTIONS**: Project-specific workflows, team collaboration processes

This comprehensive guide provides everything needed to understand and effectively use the workflows creation prompt template for any type of organizational workflow or process.
