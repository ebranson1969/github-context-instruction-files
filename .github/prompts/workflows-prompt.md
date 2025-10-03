# Workflows Creation Prompts

*Project prompts for creating and managing workflows in the copilot system*

**🚨 CRITICAL: Session Logging Requirements (NON-NEGOTIABLE)**
All workflow creation activities must be properly logged according to the Session Context Preservation Rule and Question Processing Rule. The requirements in this section are MANDATORY and must be followed for every workflow prompt and implementation.

**Session Logging Protocol Enforcement:**
- Session logging MUST be the first and last action for every user request, regardless of the task.
- Session logging is a gating requirement: no other actions (file edits, commits, etc.) may be performed until the session log is updated.
- The agent MUST verify the session log after every user interaction and before ending its turn, ensuring no step is missed.
- The session must be logged in the appropriate project directory.
- All research, reasoning, and file modifications must be documented.
- Git commits must be tracked and logged to maintain audit trail.
- Session logging continues throughout the workflow implementation process.
- **The exact prompt used in chat must be logged in the session log.**
- **The prompt file location (.github/prompts/workflows-prompt.md) must be documented.**
- **No workflow implementation is considered complete unless these logging requirements are fully met**

---

## Prompt 1: Add Workflow to Copilot-Workflows.md (NOT ACTIVE)

### Prompt Template
```
I need you to add a new workflow to copilot-workflows.md. The workflow should be created as NOT ACTIVE status. Please use Template 4 from .github/copilot-templates.md to create the workflow structure.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Workflow Name: [INSERT WORKFLOW NAME HERE]
Workflow Description: [INSERT WHAT THIS WORKFLOW ESTABLISHES OR CONTROLS]

Protocol Sections Needed:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]
- [ADD MORE SECTIONS AS NEEDED]

Specific Requirements:
- [INSERT BULLET POINT REQUIREMENTS FOR EACH PROTOCOL SECTION]
- [ADD MORE REQUIREMENTS AS NEEDED]

Session Logging Requirements:
- Log this workflow creation in the current session log
- Document research and reasoning for workflow design decisions
- Track file modifications to copilot-workflows.md
- Log git commit message when changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md - Prompt 1**

Please create the workflow following the template format and add it to copilot-workflows.md with status NOT ACTIVE. Ensure all actions are properly logged according to session management protocols.
```

### Example Usage
```
I need you to add a new workflow to copilot-workflows.md. The workflow should be created as NOT ACTIVE status. Please use Template 4 from .github/copilot-templates.md to create the workflow structure.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Workflow Name: Code Quality Validation Workflow
Workflow Description: Establishes automated code quality checks and validation procedures for all code submissions

Protocol Sections Needed:
- Code Analysis Protocol: Defines automated code quality scanning and analysis procedures
- Validation Standards Protocol: Establishes minimum quality thresholds and acceptance criteria
- Reporting Protocol: Manages quality report generation and stakeholder notifications

Specific Requirements:
- All code submissions must pass automated quality scans before approval
- Quality reports must include security vulnerabilities, code complexity, and test coverage metrics
- Failed validations must trigger notification to development team with detailed remediation guidance
- Quality metrics must be tracked and reported to project stakeholders

Session Logging Requirements:
- Log this workflow creation in the current session log
- Document research and reasoning for workflow design decisions
- Track file modifications to copilot-workflows.md
- Log git commit message when changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md - Prompt 1**

Please create the workflow following the template format and add it to copilot-workflows.md with status NOT ACTIVE. Ensure all actions are properly logged according to session management protocols.
```

═══════════════════════════════════════════════════════════════════════════════════════════

## Prompt 2: Add Workflow and Reference Link

### Prompt Template
```
I need you to create a complete workflow implementation with both the workflow definition and reference link.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this comprehensive workflow implementation process.

Step 1: Add the workflow to copilot-workflows.md using Template 4 from .github/copilot-templates.md
Step 2: Add the reference link to copilot-instructions.md using Template 3 from .github/copilot-templates.md

Workflow Information:
- Workflow Name: [INSERT WORKFLOW NAME HERE]
- Workflow Description: [INSERT WHAT THIS WORKFLOW ESTABLISHES OR CONTROLS]
- Purpose Description: [INSERT PURPOSE DESCRIPTION FOR REFERENCE LINK]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]

Protocol Sections:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
  - [INSERT SPECIFIC REQUIREMENTS]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]  
  - [INSERT SPECIFIC REQUIREMENTS]

Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK]

Session Logging Requirements:
- Log this complete workflow implementation in the current session log
- Document research and reasoning for both workflow design and reference placement
- Track file modifications to both copilot-workflows.md and copilot-instructions.md
- Log git commit message when changes are pushed
- Document the relationship between the workflow and existing protocols
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md - Prompt 2**

Please create both the workflow and the reference link, keeping the workflow status as NOT ACTIVE until implementation is complete. Ensure comprehensive session logging throughout this multi-file implementation process.
```

### Example Usage - Using Automatic Git Operations Workflow
```
I need you to create a complete workflow implementation with both the workflow definition and reference link.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this comprehensive workflow implementation process.

Step 1: Add the workflow to copilot-workflows.md using Template 4 from .github/copilot-templates.md
Step 2: Add the reference link to copilot-instructions.md using Template 3 from .github/copilot-templates.md

Workflow Information:
- Workflow Name: Automatic Git Operations Workflow
- Workflow Description: Establishes automated git operations for session management and code deployment
- Purpose Description: AUTOMATED GIT OPERATIONS FOR SESSION MANAGEMENT AND CODE DEPLOYMENT
- Reference Description: Automatic Git Operations Workflow

Protocol Sections:
- Git Command Execution Protocol: Defines the standardized git command sequence for automatic operations
  - Execute single consolidated command with proper chaining
  - Initial status check shows files to be processed before operations begin
  - Final status check verifies successful completion with empty output
- Chat Logging Protocol: Ensures transparency and confirmation of git operations to the user
  - Log successful commit messages to chat for confirmation
  - Provide clear indication when git operations have been executed
  - Include commit hash and message details for traceability
- Error Handling Protocol: Manages failure scenarios and recovery procedures for git operations
  - Retry failed operations once before reporting to user
  - Provide clear error messaging for manual intervention
  - Preserve session state during error recovery

Location in copilot-instructions.md: Agent Workflow Requirements

Session Logging Requirements:
- Log this complete workflow implementation in the current session log
- Document research and reasoning for both workflow design and reference placement
- Track file modifications to both copilot-workflows.md and copilot-instructions.md
- Log git commit message when changes are pushed
- Document the relationship between the workflow and existing protocols
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/workflows-prompt.md - Prompt 2**

Please create both the workflow and the reference link, keeping the workflow status as NOT ACTIVE until implementation is complete. Ensure comprehensive session logging throughout this multi-file implementation process.
```

---

## Usage Instructions

### For Prompt 1 (Workflow Only):
1. **ENSURE SESSION LOGGING IS ACTIVE** - Verify you are in a logged session before proceeding
2. Copy the prompt template
3. Replace all `[INSERT...]` placeholders with your specific workflow information
4. Include the session logging requirements section
5. Provide the completed prompt to GitHub Copilot
6. **Copilot will log the complete prompt you used in chat and the prompt file source**
7. Copilot will create the workflow in copilot-workflows.md with NOT ACTIVE status AND log all actions

### For Prompt 2 (Workflow + Link):
1. **ENSURE SESSION LOGGING IS ACTIVE** - Verify you are in a logged session before proceeding
2. Copy the prompt template  
3. Replace all `[INSERT...]` placeholders with your specific workflow information
4. Specify where in copilot-instructions.md the reference link should be added
5. Include comprehensive session logging requirements for both files
6. Provide the completed prompt to GitHub Copilot
7. **Copilot will log the complete prompt you used in chat and the prompt file source**
8. Copilot will create both the workflow definition and the reference link AND log all actions comprehensively

### Session Logging Integration Benefits:
- **Audit Trail**: Complete documentation of all workflow creation decisions and modifications
- **Traceability**: Links between workflow design rationale and implementation choices
- **Project History**: Maintains context for future workflow modifications and related decisions
- **Quality Assurance**: Ensures all workflow creation follows established documentation protocols
- **Team Collaboration**: Provides complete context for team members working on related workflows
- **Prompt Traceability**: Complete record of which prompts were used from which files
- **Reproducibility**: Ability to recreate workflow creation processes using documented prompts

### Template References:
- **Template 3**: For copilot-instructions.md workflow references (found in .github/copilot-templates.md)
- **Template 4**: For copilot-workflows.md workflow structure (found in .github/copilot-templates.md)

### Best Practices:
- **Always verify session logging is active** before using these prompts
- Start with NOT ACTIVE status for new workflows and test thoroughly before activation
- Use clear, descriptive protocol section names that align with existing workflow patterns
- Include specific, actionable requirements in bullet points
- Reference existing workflows as examples when creating similar functionality
- **Document rationale for workflow design decisions** in session logs for future reference
- **Track relationships between new workflows and existing protocols** to maintain system coherence
