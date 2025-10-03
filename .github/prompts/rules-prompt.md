# Rules Creation Prompts

*Project prompts for creating and managing rules in the copilot system*

**🚨 CRITICAL: Session Logging Requirements (NON-NEGOTIABLE)**
All rule creation activities must be properly logged according to the Session Context Preservation Rule and Question Processing Rule. The requirements in this section are MANDATORY and must be followed for every rule prompt and implementation.

**Session Logging Protocol Enforcement:**
- Session logging MUST be the first and last action for every user request, regardless of the task.
- Session logging is a gating requirement: no other actions (file edits, commits, etc.) may be performed until the session log is updated.
- The agent MUST verify the session log after every user interaction and before ending its turn, ensuring no step is missed.
- The session must be logged in the appropriate project directory.
- All research, reasoning, and file modifications must be documented.
- Git commits must be tracked and logged to maintain audit trail.
- Session logging continues throughout the rule implementation process.
- **The exact prompt used in chat must be logged in the session log.**
- **The prompt file location (.github/prompts/rules-prompt.md) must be documented.**
- **No rule implementation is considered complete unless these logging requirements are fully met**

---

## Prompt 1: Add Rule to Copilot-Rules.md (NOT ACTIVE)

### Prompt Template
```
I need you to add a new rule to copilot-rules.md. The rule should be created as NOT ACTIVE status. Please use Template 2 from .github/copilot-templates.md to create the rule structure.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Name: [INSERT RULE NAME HERE]
Rule Description: [INSERT WHAT THIS RULE ESTABLISHES OR CONTROLS]

Protocol Sections Needed:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]
- [ADD MORE SECTIONS AS NEEDED]

Specific Requirements:
- [INSERT BULLET POINT REQUIREMENTS FOR EACH PROTOCOL SECTION]
- [ADD MORE REQUIREMENTS AS NEEDED]

Session Logging Requirements:
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file modifications to copilot-rules.md
- Log git commit message when changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 1**

Please create the rule following the template format and add it to copilot-rules.md with status NOT ACTIVE. Ensure all actions are properly logged according to session management protocols.
```

### Example Usage
```
I need you to add a new rule to copilot-rules.md. The rule should be created as NOT ACTIVE status. Please use Template 2 from .github/copilot-templates.md to create the rule structure.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Name: Code Review Automation Rule
Rule Description: Establishes automated code review protocols for pull requests and commits

Protocol Sections Needed:
- Automated Review Triggers: Controls when automated reviews are initiated
- Review Criteria Standards: Defines what aspects of code are automatically reviewed
- Escalation Protocols: Manages when human review is required

Specific Requirements:
- All pull requests must trigger automated review before merge
- Review must check for coding standards, security vulnerabilities, and test coverage
- If automated review fails, escalate to human reviewer with detailed report
- Log all review results to project documentation

Session Logging Requirements:
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file modifications to copilot-rules.md
- Log git commit message when changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 1**

Please create the rule following the template format and add it to copilot-rules.md with status NOT ACTIVE. Ensure all actions are properly logged according to session management protocols.
```

═══════════════════════════════════════════════════════════════════════════════════════════

## Prompt 2: Add Rule and Reference Link

### Prompt Template
```
I need you to create a complete rule implementation with both the rule definition and reference link.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this comprehensive rule implementation process.

Step 1: Add the rule to copilot-rules.md using Template 2 from .github/copilot-templates.md
Step 2: Add the reference link to copilot-instructions.md using Template 1 from .github/copilot-templates.md

Rule Information:
- Rule Name: [INSERT RULE NAME HERE]
- Rule Description: [INSERT WHAT THIS RULE ESTABLISHES OR CONTROLS]
- Priority Description: [INSERT PRIORITY DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]

Protocol Sections:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
  - [INSERT SPECIFIC REQUIREMENTS]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]  
  - [INSERT SPECIFIC REQUIREMENTS]

Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK]

Session Logging Requirements:
- Log this complete rule implementation in the current session log
- Document research and reasoning for both rule design and reference placement
- Track file modifications to both copilot-rules.md and copilot-instructions.md
- Log git commit message when changes are pushed
- Document the relationship between the rule and existing protocols
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 2**

Please create both the rule and the reference link, keeping the rule status as NOT ACTIVE until implementation is complete. Ensure comprehensive session logging throughout this multi-file implementation process.
```

### Example Usage - Using Session Context Preservation Rule
```
I need you to create a complete rule implementation with both the rule definition and reference link.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this comprehensive rule implementation process.

Step 1: Add the rule to copilot-rules.md using Template 2 from .github/copilot-templates.md
Step 2: Add the reference link to copilot-instructions.md using Template 1 from .github/copilot-templates.md

Rule Information:
- Rule Name: Session Context Preservation Rule
- Rule Description: Establishes critical session management protocols that MUST be maintained across all interactions
- Priority Description: HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS
- Reference Description: Session Context Preservation Rules

Protocol Sections:
- Mandatory Session Logging: Ensures all agent interactions are properly documented and preserved for future reference
  - All agent interactions must be logged in dedicated project directories
  - Session logs must capture: original questions, research reasoning, actions taken, file modifications, git commits
  - Logging format must include timestamps, question numbers, and detailed change summaries
- Session Continuity: Maintains connection between sessions and preserves project context across interactions
  - Each logged session must maintain connection to previous sessions through cross-references
  - Project context must be preserved across session restarts
  - Session logs must be updated throughout the interaction, not just at the end
- Context Failure Recovery: Provides recovery mechanism when AI context degrades due to token limitations
  - If session context appears degraded, immediately reference session logs to restore project understanding
  - Session logs act as backup context when AI token limits cause instruction degradation
  - All critical protocols must be re-established from session logs when context fails

Location in copilot-instructions.md: CRITICAL RULES SECTION

Session Logging Requirements:
- Log this complete rule implementation in the current session log
- Document research and reasoning for both rule design and reference placement
- Track file modifications to both copilot-rules.md and copilot-instructions.md
- Log git commit message when changes are pushed
- Document the relationship between the rule and existing protocols
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 2**

Please create both the rule and the reference link, keeping the rule status as NOT ACTIVE until implementation is complete. Ensure comprehensive session logging throughout this multi-file implementation process.
```

---

## Usage Instructions

### For Prompt 1 (Rule Only):
1. **ENSURE SESSION LOGGING IS ACTIVE** - Verify you are in a logged session before proceeding
2. Copy the prompt template
3. Replace all `[INSERT...]` placeholders with your specific rule information
4. Include the session logging requirements section
5. Provide the completed prompt to GitHub Copilot
6. **Copilot will log the complete prompt you used in chat and the prompt file source**
7. Copilot will create the rule in copilot-rules.md with NOT ACTIVE status AND log all actions

### For Prompt 2 (Rule + Link):
1. **ENSURE SESSION LOGGING IS ACTIVE** - Verify you are in a logged session before proceeding
2. Copy the prompt template  
3. Replace all `[INSERT...]` placeholders with your specific rule information
4. Specify where in copilot-instructions.md the reference link should be added
5. Include comprehensive session logging requirements for both files
6. Provide the completed prompt to GitHub Copilot
7. **Copilot will log the complete prompt you used in chat and the prompt file source**
8. Copilot will create both the rule definition and the reference link AND log all actions comprehensively

### Template References:
- **Template 1**: For copilot-instructions.md rule references (found in .github/copilot-templates.md)
- **Template 2**: For copilot-rules.md rule structure (found in .github/copilot-templates.md)

### Session Logging Integration Benefits:
- **Audit Trail**: Complete documentation of all rule creation decisions and modifications
- **Traceability**: Links between rule design rationale and implementation choices
- **Project History**: Maintains context for future rule modifications and related decisions
- **Quality Assurance**: Ensures all rule creation follows established documentation protocols
- **Team Collaboration**: Provides complete context for team members working on related rules
- **Prompt Traceability**: Complete record of which prompts were used from which files
- **Reproducibility**: Ability to recreate rule creation processes using documented prompts
