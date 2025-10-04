# Rules Creation Prompt - Examples and Documentation

*Comprehensive guide to understanding and using the unified rules creation prompt template*

## File Purpose
This file provides detailed explanations, usage instructions, and multiple examples for the rules creation prompt template located in `rules-prompt.md`. Use this guide to understand how to properly fill out and use the template.

---

## 🚨 CRITICAL: Session Logging Requirements (NON-NEGOTIABLE)
All rule creation activities must be properly logged according to established protocols. These requirements are MANDATORY for every rule creation request.

**Key Requirements:**
- Session logging must be active before starting any rule creation
- All research, reasoning, and file modifications must be documented
- The exact prompt used in chat must be logged
- Git commits must be tracked and logged
- No rule implementation is considered complete without proper logging

---

## Template Structure Explanation

### Section 1: Your Question/Request
**Purpose**: Establishes the context and ensures session logging is activated
- Always starts with "I need you to create a new rule file in the modular instruction system"
- Includes mandatory session logging reminder
- Sets expectation for comprehensive documentation

### Section 2: Rule Information
**Purpose**: Defines the basic metadata and structure for the rule

**Rule Name**: The formal name of the rule (e.g., "Session Context Preservation Rule")
**Rule Description**: A concise explanation of what the rule establishes or controls
**File Location**: The exact path where the rule file will be created (always follows pattern: `.github/instructions/rules/[kebab-case-name]-rule.md`)

### Section 3: Protocol Sections Needed
**Purpose**: Defines the main organizational sections within the rule file
- Each protocol section represents a major area of control or functionality
- Include a brief description for each section
- These become the main headings (##) in the rule file

### Section 4: Specific Requirements
**Purpose**: Lists the detailed requirements and bullet points for each protocol section
- These become the actual implementation details
- Should be actionable and specific
- Will be organized under the appropriate protocol sections

### Section 5: Rule Status (ACTIVE/NOT ACTIVE)
**Purpose**: Determines whether the rule gets a reference link in the main copilot-instructions.md file

**ACTIVE (Default)**: Creates both the rule file AND adds a reference link to copilot-instructions.md
- Requires additional information for the reference link
- Most common choice for production rules

**NOT ACTIVE**: Creates only the rule file without a reference link
- Used for draft rules or rules not yet ready for production
- Can be activated later by manually adding the reference link

### Section 6: If ACTIVE Additional Information
**Purpose**: Provides the metadata needed to create the reference link

**Priority Description**: The urgency/importance level (usually in ALL CAPS)
**Reference Description**: The text that appears in the link description
**Location**: Whether it goes in CRITICAL RULES SECTION or GENERAL RULES SECTION

### Section 7: Reference Link Format
**Purpose**: Shows exactly how the link will appear in copilot-instructions.md
- Uses 🔴 emoji for critical rules
- Includes the priority description and link to the rule file

### Section 8: Rule File Structure
**Purpose**: Provides the template structure for the actual rule file
- Shows how the protocol sections and requirements will be organized
- Includes the Status section at the bottom with checkbox format

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
2. **Copy the entire template** from `rules-prompt.md`
3. **Replace all `[INSERT...]` placeholders** with your specific information
4. **Choose ACTIVE or NOT ACTIVE** (ACTIVE is pre-selected)
5. **If ACTIVE, fill in the reference link information**
6. **Use kebab-case for filenames** (e.g., `my-new-rule-name-rule.md`)
7. **Paste the completed prompt into chat**

---

## Example 1: ACTIVE Critical Rule - Security Validation Rule

```markdown
## Your Question/Request
I need you to create a new rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Security Validation Rule
- Rule Description: Establishes mandatory security validation protocols for all code modifications and deployments
- File Location: .github/instructions/rules/security-validation-rule.md

Protocol Sections Needed:
- Pre-Commit Security Checks: Mandatory security validations before any code commits
- Deployment Security Gates: Security requirements that must be met before deployment
- Vulnerability Response Protocol: Standardized response procedures when security issues are detected
- Security Audit Trail: Documentation requirements for all security-related decisions and actions

Specific Requirements:
- All code changes must pass automated security scanning before commit
- Manual security review required for authentication, authorization, and data handling changes
- Zero-tolerance policy for known vulnerabilities in production deployments
- All security incidents must be logged with timestamp, impact assessment, and resolution actions
- Security audit logs must be preserved for minimum 12 months
- Escalation to security team required for any medium or high severity findings

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create rule file only (no reference link)

### If ACTIVE, provide additional information:
- Priority Description: CRITICAL SECURITY REQUIREMENT - ZERO TOLERANCE FOR VULNERABILITIES
- Reference Description: Security Validation Protocols
- Location in copilot-instructions.md: CRITICAL RULES SECTION

### Reference Link Format (for ACTIVE rules):
#### 🔴 Security Validation Rule
- *CRITICAL SECURITY REQUIREMENT - ZERO TOLERANCE FOR VULNERABILITIES*

- For complete Security Validation Protocols, see: [Security Validation Rule](./instructions/rules/security-validation-rule.md)

Rule File Structure:
# Security Validation Rule
*Establishes mandatory security validation protocols for all code modifications and deployments*

## Pre-Commit Security Checks
*Mandatory security validations before any code commits*
- All code changes must pass automated security scanning before commit
- Manual security review required for authentication, authorization, and data handling changes

## Deployment Security Gates
*Security requirements that must be met before deployment*
- Zero-tolerance policy for known vulnerabilities in production deployments
- All security incidents must be logged with timestamp, impact assessment, and resolution actions

## Vulnerability Response Protocol
*Standardized response procedures when security issues are detected*
- Security audit logs must be preserved for minimum 12 months
- Escalation to security team required for any medium or high severity findings

## Security Audit Trail
*Documentation requirements for all security-related decisions and actions*
- All security decisions must include rationale and approval chain
- Audit trail must be accessible for compliance reviews

## Status
**What is the status of this rule?**

- [x] **ACTIVE** - Critical security protocols for maintaining secure development and deployment practices
- [ ] **NOT ACTIVE** - Critical security protocols for maintaining secure development and deployment practices

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
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both rule file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to rule file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md**

## Expected Deliverables
- New rule file created in .github/instructions/rules/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Rule file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```

---

## Example 2: NOT ACTIVE Draft Rule - Performance Monitoring Rule

```markdown
## Your Question/Request
I need you to create a new rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Performance Monitoring Rule
- Rule Description: Establishes automated performance monitoring and alerting protocols for system optimization
- File Location: .github/instructions/rules/performance-monitoring-rule.md

Protocol Sections Needed:
- Automated Performance Metrics: Defines which performance indicators are automatically tracked
- Performance Baseline Establishment: Procedures for setting and maintaining performance baselines
- Alert Threshold Management: Configuration and management of performance alert thresholds
- Performance Degradation Response: Standardized response procedures when performance issues are detected

Specific Requirements:
- System must automatically track response times, memory usage, and CPU utilization
- Performance baselines must be established for all critical system components
- Alert thresholds must be set at 80% of baseline performance levels
- Performance degradation alerts must trigger within 2 minutes of threshold breach
- All performance incidents must be logged with detailed metrics and resolution actions
- Monthly performance reports must be generated and reviewed by development team

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [ ] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [x] **NOT ACTIVE** - Create rule file only (no reference link)

### If ACTIVE, provide additional information:
- Priority Description: [INSERT PRIORITY DESCRIPTION IN UPPERCASE]
- Reference Description: [INSERT DESCRIPTION FOR THE LINK TEXT]
- Location in copilot-instructions.md: [INSERT WHERE TO ADD THE REFERENCE LINK - CRITICAL or GENERAL RULES SECTION]

### Reference Link Format (for ACTIVE rules):
#### 🔴 [Rule Name] (if critical) OR #### [Rule Name] (if general)
- *[PRIORITY DESCRIPTION IN UPPERCASE]*

- For complete [Reference Description], see: [[Rule Name]](./instructions/rules/[filename]-rule.md)

Rule File Structure:
# Performance Monitoring Rule
*Establishes automated performance monitoring and alerting protocols for system optimization*

## Automated Performance Metrics
*Defines which performance indicators are automatically tracked*
- System must automatically track response times, memory usage, and CPU utilization
- Performance baselines must be established for all critical system components

## Performance Baseline Establishment
*Procedures for setting and maintaining performance baselines*
- Alert thresholds must be set at 80% of baseline performance levels
- Performance degradation alerts must trigger within 2 minutes of threshold breach

## Alert Threshold Management
*Configuration and management of performance alert thresholds*
- All performance incidents must be logged with detailed metrics and resolution actions
- Monthly performance reports must be generated and reviewed by development team

## Performance Degradation Response
*Standardized response procedures when performance issues are detected*
- Immediate investigation required for all performance alerts
- Escalation to senior developers for issues not resolved within 30 minutes

## Status
**What is the status of this rule?**

- [ ] **ACTIVE** - Draft performance monitoring protocols pending infrastructure setup and team review
- [x] **NOT ACTIVE** - Draft performance monitoring protocols pending infrastructure setup and team review

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
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both rule file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to rule file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md**

## Expected Deliverables
- New rule file created in .github/instructions/rules/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Rule file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```

---

## Example 3: ACTIVE General Rule - Documentation Standards Rule

```markdown
## Your Question/Request
I need you to create a new rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Documentation Standards Rule
- Rule Description: Establishes consistent documentation standards and maintenance protocols across all project files
- File Location: .github/instructions/rules/documentation-standards-rule.md

Protocol Sections Needed:
- Code Documentation Requirements: Standards for inline code comments and function documentation
- README Maintenance Protocol: Requirements for keeping README files current and comprehensive
- API Documentation Standards: Standards for documenting APIs and public interfaces
- Documentation Review Process: Quality assurance procedures for all documentation updates

Specific Requirements:
- All public functions must include docstrings with parameter and return value descriptions
- README files must be updated within 24 hours of any significant feature changes
- API documentation must include working examples for all endpoints
- Documentation changes must be reviewed by at least one team member before merge
- All documentation must follow established markdown formatting standards
- Documentation must be written for target audience (technical vs non-technical users)

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create rule file only (no reference link)

### If ACTIVE, provide additional information:
- Priority Description: ESSENTIAL FOR PROJECT MAINTAINABILITY AND TEAM COLLABORATION
- Reference Description: Documentation Standards and Maintenance Protocols
- Location in copilot-instructions.md: GENERAL RULES SECTION

### Reference Link Format (for ACTIVE rules):
#### Documentation Standards Rule
- *ESSENTIAL FOR PROJECT MAINTAINABILITY AND TEAM COLLABORATION*

- For complete Documentation Standards and Maintenance Protocols, see: [Documentation Standards Rule](./instructions/rules/documentation-standards-rule.md)

Rule File Structure:
# Documentation Standards Rule
*Establishes consistent documentation standards and maintenance protocols across all project files*

## Code Documentation Requirements
*Standards for inline code comments and function documentation*
- All public functions must include docstrings with parameter and return value descriptions
- README files must be updated within 24 hours of any significant feature changes

## README Maintenance Protocol
*Requirements for keeping README files current and comprehensive*
- API documentation must include working examples for all endpoints
- Documentation changes must be reviewed by at least one team member before merge

## API Documentation Standards
*Standards for documenting APIs and public interfaces*
- All documentation must follow established markdown formatting standards
- Documentation must be written for target audience (technical vs non-technical users)

## Documentation Review Process
*Quality assurance procedures for all documentation updates*
- All documentation changes require peer review before publication
- Documentation must be tested for accuracy and completeness

## Status
**What is the status of this rule?**

- [x] **ACTIVE** - Essential documentation standards for maintaining project quality and team productivity
- [ ] **NOT ACTIVE** - Essential documentation standards for maintaining project quality and team productivity

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
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both rule file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to rule file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md**

## Expected Deliverables
- New rule file created in .github/instructions/rules/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Rule file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```

---

## Example 4: ACTIVE Critical Rule - Data Backup and Recovery Rule

```markdown
## Your Question/Request
I need you to create a new rule file in the modular instruction system.

**CRITICAL**: This session must be properly logged according to established protocols. Document all research, reasoning, and file modifications throughout this process.

Rule Information:
- Rule Name: Data Backup and Recovery Rule
- Rule Description: Establishes mandatory data backup procedures and disaster recovery protocols to ensure data integrity and business continuity
- File Location: .github/instructions/rules/data-backup-recovery-rule.md

Protocol Sections Needed:
- Automated Backup Scheduling: Requirements for automated backup frequency and retention
- Backup Verification Protocol: Procedures for validating backup integrity and completeness
- Disaster Recovery Procedures: Step-by-step recovery processes for various failure scenarios
- Backup Security and Access Control: Security requirements for backup storage and access management

Specific Requirements:
- Full system backups must be performed daily at 2 AM with 30-day retention
- Critical data incremental backups must be performed every 4 hours
- All backups must be verified within 24 hours of creation using automated integrity checks
- Backup data must be encrypted at rest and in transit using AES-256 encryption
- Recovery procedures must be tested monthly with documented results
- Backup access must be restricted to authorized personnel with multi-factor authentication
- Recovery time objective (RTO) must not exceed 4 hours for critical systems
- Recovery point objective (RPO) must not exceed 1 hour for critical data

## Rule Status
**Should this rule be ACTIVE or NOT ACTIVE?**

- [x] **ACTIVE** - Create rule file AND add reference link to .github/copilot-instructions.md
- [ ] **NOT ACTIVE** - Create rule file only (no reference link)

### If ACTIVE, provide additional information:
- Priority Description: CRITICAL FOR BUSINESS CONTINUITY AND DATA PROTECTION
- Reference Description: Data Backup and Disaster Recovery Protocols
- Location in copilot-instructions.md: CRITICAL RULES SECTION

### Reference Link Format (for ACTIVE rules):
#### 🔴 Data Backup and Recovery Rule
- *CRITICAL FOR BUSINESS CONTINUITY AND DATA PROTECTION*

- For complete Data Backup and Disaster Recovery Protocols, see: [Data Backup and Recovery Rule](./instructions/rules/data-backup-recovery-rule.md)

Rule File Structure:
# Data Backup and Recovery Rule
*Establishes mandatory data backup procedures and disaster recovery protocols to ensure data integrity and business continuity*

## Automated Backup Scheduling
*Requirements for automated backup frequency and retention*
- Full system backups must be performed daily at 2 AM with 30-day retention
- Critical data incremental backups must be performed every 4 hours

## Backup Verification Protocol
*Procedures for validating backup integrity and completeness*
- All backups must be verified within 24 hours of creation using automated integrity checks
- Backup data must be encrypted at rest and in transit using AES-256 encryption

## Disaster Recovery Procedures
*Step-by-step recovery processes for various failure scenarios*
- Recovery procedures must be tested monthly with documented results
- Recovery time objective (RTO) must not exceed 4 hours for critical systems
- Recovery point objective (RPO) must not exceed 1 hour for critical data

## Backup Security and Access Control
*Security requirements for backup storage and access management*
- Backup access must be restricted to authorized personnel with multi-factor authentication
- All backup access attempts must be logged and monitored

## Status
**What is the status of this rule?**

- [x] **ACTIVE** - Critical data protection protocols essential for business continuity and regulatory compliance
- [ ] **NOT ACTIVE** - Critical data protection protocols essential for business continuity and regulatory compliance

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
- Log this rule creation in the current session log
- Document research and reasoning for rule design decisions
- Track file creation and modifications
- If ACTIVE: Log git commit message when changes are pushed to both rule file and copilot-instructions.md
- If NOT ACTIVE: Log git commit message when changes are pushed to rule file only
- **Log the complete prompt used in chat (copy the entire prompt from chat)**
- **Document prompt source: .github/prompts/rules-prompt.md**

## Expected Deliverables
- New rule file created in .github/instructions/rules/
- If ACTIVE: Reference link added to .github/copilot-instructions.md
- If NOT ACTIVE: Rule file only with NOT ACTIVE status
- Complete session logging of all actions and decisions
- Git commit with appropriate message
```

---

## Common Patterns and Best Practices

### Rule Naming Conventions
- Use descriptive, clear names that indicate the rule's purpose
- End all rule names with "Rule" for consistency
- Use title case (e.g., "Security Validation Rule", not "security validation rule")

### File Naming Conventions
- Use kebab-case for filenames (lowercase with hyphens)
- Always end with "-rule.md"
- Examples: `security-validation-rule.md`, `documentation-standards-rule.md`

### Protocol Section Organization
- Organize sections logically from general to specific
- Use parallel structure in section names
- Include 2-4 main protocol sections per rule for optimal organization

### Requirement Writing Guidelines
- Write requirements as actionable statements
- Include specific metrics and timeframes where applicable
- Use "must" for mandatory requirements, "should" for recommendations
- Be specific about who is responsible for each requirement

### ACTIVE vs NOT ACTIVE Decision Guide
- Choose **ACTIVE** for rules that are ready for immediate implementation
- Choose **NOT ACTIVE** for draft rules, experimental policies, or rules pending approval
- Most production rules should be ACTIVE to ensure visibility in the main instructions

### Reference Link Placement Guide
- **CRITICAL RULES SECTION**: Security, data protection, legal compliance, system stability
- **GENERAL RULES SECTION**: Documentation, coding standards, workflow processes, team collaboration

This comprehensive guide provides everything needed to understand and effectively use the rules creation prompt template for any type of organizational rule or protocol.
