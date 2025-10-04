# Terminal Usage Protocol
*Determines acceptable use of terminal commands and operations within AI-generated code*

## Bash Terminal Requirements
*Establishes bash as the standard terminal environment for all AI-generated commands*
- Use only bash commands for all terminal operations
- All terminal-based operations must be compatible with bash shell environment
- Ensure cross-platform compatibility by using standard bash command syntax
- Avoid platform-specific command variations that may not work in bash

## Python Integration Protocol
*Defines acceptable use of Python within terminal operations*
- Python can be used within bash commands or bash scripts
- Python scripts should be executed through bash using proper command syntax
- Combine Python and bash operations using standard bash piping and command chaining
- Ensure Python code is properly integrated with bash workflow requirements

## Prohibited Terminal Types
*Explicitly restricts the use of non-bash terminal environments*
- PowerShell commands and syntax are not allowed
- Command Prompt (cmd.exe) specific commands are prohibited
- Zsh-specific features and syntax should not be used
- Fish shell, tcsh, or any other shell-specific commands are not permitted
- All terminal operations must be bash-compatible regardless of underlying system

## Status
**NOT ACTIVE** - Core operational rule that standardizes terminal command usage across all AI-generated code. Required for maintaining consistent command execution across different environments and platforms.
