# Copilot Rule Templates

*Templates for rules referenced in copilot-instructions.md and rule structure for copilot-rules.md*

---

## Template 1: Copilot-Instructions.md Rule Reference

### General Rule Template for copilot-instructions.md

```markdown
#### 🔴 [Rule Name]
- *[PRIORITY DESCRIPTION IN UPPERCASE]*

- For complete [Rule Description], see: [[Rule Name]](./copilot-rules.md#[anchor-link])
```

### Usage Instructions for Template 1:
1. **Copy the template** from above
2. **Replace `[Rule Name]`** with the actual rule name (e.g., "Session Logging Protocol")
3. **Replace `[PRIORITY DESCRIPTION IN UPPERCASE]`** with the rule's priority description
4. **Replace `[Rule Description]`** with descriptive text (e.g., "Session Context Preservation Rules")
5. **Replace `[anchor-link]`** with the proper anchor link format

### Anchor Link Format:
- Use lowercase
- Replace spaces with hyphens
- Remove special characters
- Example: "Session Context Preservation Rule" → `#session-context-preservation-rule`

### Example Usage:
```markdown
#### 🔴 Session Logging Protocol
- *HIGHEST PRIORITY - PRESERVE THIS CONTEXT ACROSS ALL SESSIONS*

- For complete Session Context Preservation Rules, see: [Session Context Preservation Rule](./copilot-rules.md#session-context-preservation-rule)
```

═══════════════════════════════════════════════════════════════════════════════════════════

## Template 2: Copilot-Rules.md Rule Structure

### General Rule Template for copilot-rules.md

```markdown
### [Rule Name]
*[Brief description of what this rule establishes or controls]*

**[Protocol/Section Name 1]**
*[Brief description of this protocol section]*
- [Bullet point describing specific requirement or behavior]
- [Bullet point describing specific requirement or behavior]
- [Additional bullet points as needed]

**[Protocol/Section Name 2]**
*[Brief description of this protocol section]*
- [Bullet point describing specific requirement or behavior]
- [Bullet point describing specific requirement or behavior]
- [Additional bullet points as needed]

**[Additional Protocol Sections as needed]**
*[Brief description of additional protocol sections]*
- [Bullet point describing specific requirement or behavior]
- [Additional bullet points as needed]

**Status**: NOT ACTIVE
*[Brief description of rule purpose and scope - what situations this rule applies to]*

---
```

### Usage Instructions for Template 2:
1. **Copy the template** from above
2. **Replace `[Rule Name]`** with the actual rule name
3. **Replace `[Brief description...]`** with appropriate descriptions
4. **Replace `[Protocol/Section Name]`** with specific protocol names
5. **Add or remove protocol sections** as needed for your specific rule
6. **Update Status** from "NOT ACTIVE" to "ACTIVE" when rule is implemented
7. **Add separator line `---`** at the end of each rule

### Protocol Section Guidelines:
- Use **bold** formatting for protocol/section names
- Use *italics* for brief descriptions under each section
- Use bullet points for specific requirements
- Keep descriptions concise but clear
- Group related requirements under appropriate protocol sections

### Example Usage:
```markdown
### Session Context Preservation Rule
*Establishes critical session management protocols that MUST be maintained across all interactions*

**Mandatory Session Logging**
*Ensures all agent interactions are properly documented and preserved for future reference*
- All agent interactions must be logged in dedicated project directories
- Session logs must capture: original questions, research reasoning, actions taken, file modifications, git commits
- Logging format must include timestamps, question numbers, and detailed change summaries

**Status**: ACTIVE
*Core foundational rule that underpins all other protocol operations. Required for all logged sessions.*

---
```

═══════════════════════════════════════════════════════════════════════════════════════════

## Template 3: Copilot-Instructions.md Workflow Reference

### General Workflow Template for copilot-instructions.md

```markdown
#### [Workflow Name]
- *[DESCRIPTION OF WORKFLOW PURPOSE]*

- For complete [Workflow Description], see: [[Workflow Name]](./copilot-workflows.md#[anchor-link])
```

### Usage Instructions for Template 3:
1. **Copy the template** from above
2. **Replace `[Workflow Name]`** with the actual workflow name (e.g., "Automatic Git Operations")
3. **Replace `[DESCRIPTION OF WORKFLOW PURPOSE]`** with the workflow's purpose description
4. **Replace `[Workflow Description]`** with descriptive text (e.g., "Automatic Git Operations Workflow")
5. **Replace `[anchor-link]`** with the proper anchor link format

### Anchor Link Format:
- Use lowercase
- Replace spaces with hyphens
- Remove special characters
- Example: "Automatic Git Operations Workflow" → `#automatic-git-operations-workflow`

### Example Usage:
```markdown
#### Automatic Git Operations
- *AUTOMATED GIT OPERATIONS FOR SESSION MANAGEMENT AND CODE DEPLOYMENT*

- For complete Automatic Git Operations Workflow, see: [Automatic Git Operations Workflow](./copilot-workflows.md#automatic-git-operations-workflow)
```

═══════════════════════════════════════════════════════════════════════════════════════════

## Template 4: Copilot-Workflows.md Workflow Structure

### General Workflow Template for copilot-workflows.md

```markdown
### [Workflow Name]
*[Brief description of what this workflow establishes or controls]*

**[Protocol/Section Name 1]**
*[Brief description of this protocol section]*
- [Bullet point describing specific requirement or behavior]
- [Bullet point describing specific requirement or behavior]
- [Additional bullet points as needed]

**[Protocol/Section Name 2]**
*[Brief description of this protocol section]*
- [Bullet point describing specific requirement or behavior]
- [Bullet point describing specific requirement or behavior]
- [Additional bullet points as needed]

**[Additional Protocol Sections as needed]**
*[Brief description of additional protocol sections]*
- [Bullet point describing specific requirement or behavior]
- [Additional bullet points as needed]

**Status**: NOT ACTIVE
*[Brief description of workflow purpose and scope - what situations this workflow applies to]*

---
```

### Usage Instructions for Template 4:
1. **Copy the template** from above
2. **Replace `[Workflow Name]`** with the actual workflow name
3. **Replace `[Brief description...]`** with appropriate descriptions
4. **Replace `[Protocol/Section Name]`** with specific protocol names
5. **Add or remove protocol sections** as needed for your specific workflow
6. **Update Status** from "NOT ACTIVE" to "ACTIVE" when workflow is implemented
7. **Add separator line `---`** at the end of each workflow

### Protocol Section Guidelines:
- Use **bold** formatting for protocol/section names
- Use *italics* for brief descriptions under each section
- Use bullet points for specific requirements
- Keep descriptions concise but clear
- Group related requirements under appropriate protocol sections

### Example Usage:
```markdown
### Automatic Git Operations Workflow
*Establishes automated git operations for session management and code deployment*

**Git Command Execution Protocol**
*Defines the standardized git command sequence for automatic operations*
- Execute single consolidated command with proper chaining
- Initial status check shows files to be processed before operations begin
- Final status check verifies successful completion with empty output

**Status**: ACTIVE
*Core workflow that ensures all agent work is properly version controlled and deployed. Required for maintaining project history and enabling collaboration.*

---
```
