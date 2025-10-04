# Rules Creation Prompts

*Project prompts for creating and managing rules in the modular instruction system*

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

## Prompt 1: Create New Rule File

### Prompt Template
```
I need you to create a new rule file in the modular instruction system. The rule should be created as NOT ACTIVE status in a dedicated file.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: [INSERT RULE NAME HERE]
- Rule Description: [INSERT WHAT THIS RULE ESTABLISHES OR CONTROLS]
- File Location: .github/instructions/rules/[INSERT-KEBAB-CASE-FILENAME]-rule.md

Protocol Sections Needed:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]
- [ADD MORE SECTIONS AS NEEDED]

Specific Requirements:
- [INSERT BULLET POINT REQUIREMENTS FOR EACH PROTOCOL SECTION]
- [ADD MORE REQUIREMENTS AS NEEDED]

Rule File Structure:
```markdown
# [Rule Name]
*[Rule Description]*

## [Protocol/Section Name 1]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## [Protocol/Section Name 2]
*[Brief description of this protocol section]*
- [Bullet point requirements]

## Status
**NOT ACTIVE** - [Brief description of rule purpose and scope]
```

Session Logging Requirements:
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- Log git commit message when changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 1**

Please create the rule file following the modular structure and ensure all actions are properly logged according to session management protocols.
```

### Example Usage
```
I need you to create a new rule file in the modular instruction system. The rule should be created as NOT ACTIVE status in a dedicated file.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Code Review Automation Rule
- Rule Description: Establishes automated code review protocols for pull requests and commits
- File Location: .github/instructions/rules/code-review-automation-rule.md

Protocol Sections Needed:
- Automated Review Triggers: Controls when automated reviews are initiated
- Review Criteria Standards: Defines what aspects of code are automatically reviewed
- Escalation Protocols: Manages when human review is required

Specific Requirements:
- All pull requests must trigger automated review before merge
- Review must check for coding standards, security vulnerabilities, and test coverage
- If automated review fails, escalate to human reviewer with detailed report
- Log all review results to project documentation

Rule File Structure:
```markdown
# Code Review Automation Rule
*Establishes automated code review protocols for pull requests and commits*

## Automated Review Triggers
*Controls when automated reviews are initiated*
- All pull requests must trigger automated review before merge
- Reviews activate on push to any branch with open pull request

## Review Criteria Standards
*Defines what aspects of code are automatically reviewed*
- Review must check for coding standards, security vulnerabilities, and test coverage
- Automated tools must validate syntax, formatting, and basic security patterns

## Escalation Protocols
*Manages when human review is required*
- If automated review fails, escalate to human reviewer with detailed report
- Complex security issues require mandatory human oversight

## Status
**NOT ACTIVE** - Automated code review system for maintaining code quality standards
```

Session Logging Requirements:
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- Log git commit message when changes are pushed
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 1**

Please create the rule file following the modular structure and ensure all actions are properly logged according to session management protocols.
```

═══════════════════════════════════════════════════════════════════════════════════════════

## Prompt 2: Create Rule File and Reference Link

### Prompt Template
```
I need you to create a complete rule implementation with both the rule file and reference link in the main instructions.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this comprehensive rule implementation process.

Step 1: Create rule file in .github/instructions/rules/[filename]-rule.md
Step 2: Add reference link to .github/copilot-instructions.md

Rule Information:
- Rule Name: [INSERT RULE NAME HERE]
- Rule Description: [INSERT WHAT THIS RULE ESTABLISHES OR CONTROLS]
- File Location: .github/instructions/rules/[INSERT-KEBAB-CASE-FILENAME]-rule.md
- Priority Description: [INSERT PRIORITY DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]

Protocol Sections:
- [INSERT PROTOCOL/SECTION NAME 1]: [INSERT BRIEF DESCRIPTION]
  - [INSERT SPECIFIC REQUIREMENTS]
- [INSERT PROTOCOL/SECTION NAME 2]: [INSERT BRIEF DESCRIPTION]  
  - [INSERT SPECIFIC REQUIREMENTS]

Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK - CRITICAL or GENERAL RULES SECTION]

Reference Link Format:
```markdown
#### 🔴 [Rule Name] (if critical) OR #### [Rule Name] (if general)
- *[PRIORITY DESCRIPTION IN UPPERCASE]*

- For complete [Reference Description], see: [[Rule Name]](./instructions/rules/[filename]-rule.md)
```

Session Logging Requirements:
- Log this complete rule implementation in the current session log
- Document research and reasoning for both rule design and reference placement
- Track file creation and modifications to both new rule file and copilot-instructions.md
- Log git commit message when changes are pushed
- Document the relationship between the rule and existing protocols
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 2**

Please create both the rule file and the reference link, keeping the rule status as NOT ACTIVE until implementation is complete. Ensure comprehensive session logging throughout this multi-file implementation process.
```

### Example Usage - Session Context Preservation Rule
```
I need you to create a complete rule implementation with both the rule file and reference link in the main instructions.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this comprehensive rule implementation process.

Step 1: Create rule file in .github/instructions/rules/session-context-preservation-rule.md
Step 2: Add reference link to .github/copilot-instructions.md

Rule Information:
- Rule Name: Session Context Preservation Rule
- Rule Description: Establishes critical session management protocols that MUST be maintained across all interactions
- File Location: .github/instructions/rules/session-context-preservation-rule.md
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

Reference Link Format:
```markdown
#### 🔴 Session Logging Protocol
- *HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS*

- For complete Session Context Preservation Rules, see: [Session Context Preservation Rule](./instructions/rules/session-context-preservation-rule.md)
```

Session Logging Requirements:
- Log this complete rule implementation in the current session log
- Document research and reasoning for both rule design and reference placement
- Track file creation and modifications to both new rule file and copilot-instructions.md
- Log git commit message when changes are pushed
- Document the relationship between the rule and existing protocols
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md - Prompt 2**

Please create both the rule file and the reference link, keeping the rule status as NOT ACTIVE until implementation is complete. Ensure comprehensive session logging throughout this multi-file implementation process.
```

---

## Usage Instructions

### For Prompt 1 (Rule File Only):
1. **ENSURE SESSION LOGGING IS ACTIVE** - Verify you are in a logged session before proceeding
2. Copy the prompt template
3. Replace all `[INSERT...]` placeholders with your specific rule information
4. Use kebab-case for filename (e.g., `session-management-rule.md`)
5. Include the session logging requirements section
6. Provide the completed prompt to GitHub Copilot
7. **Copilot will log the complete prompt you used in chat and the prompt file source**
8. Copilot will create the rule file in .github/instructions/rules/ with NOT ACTIVE status AND log all actions

### For Prompt 2 (Rule File + Reference Link):
1. **ENSURE SESSION LOGGING IS ACTIVE** - Verify you are in a logged session before proceeding
2. Copy the prompt template  
3. Replace all `[INSERT...]` placeholders with your specific rule information
4. Specify whether it goes in CRITICAL or GENERAL RULES SECTION
5. Use proper 🔴 emoji for critical rules
6. Include comprehensive session logging requirements for both files
7. Provide the completed prompt to GitHub Copilot
8. **Copilot will log the complete prompt you used in chat and the prompt file source**
9. Copilot will create both the rule file and the reference link AND log all actions comprehensively

### Modular Structure Benefits:
- **Individual Files**: Each rule is independently manageable and versionable
- **Better Organization**: Rules organized in dedicated directories  
- **Enhanced Modularity**: Rules can be included/excluded as needed
- **Improved Maintainability**: Easier to locate and update specific rules
- **Cleaner Links**: Direct references to individual rule files

### Session Logging Integration Benefits:
- **Audit Trail**: Complete documentation of all rule creation decisions and modifications
- **Traceability**: Links between rule design rationale and implementation choices
- **Project History**: Maintains context for future rule modifications and related decisions
- **Quality Assurance**: Ensures all rule creation follows established documentation protocols
- **Team Collaboration**: Provides complete context for team members working on related rules
- **Prompt Traceability**: Complete record of which prompts were used from which files
- **Reproducibility**: Ability to recreate rule creation processes using documented prompts
