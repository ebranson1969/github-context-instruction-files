# README Generation Rule
*Defines comprehensive standards for creating and maintaining README files with proper linking, formatting, and organizational structure.*

## File Format and Structure Requirements
*Establishes basic requirements for README file creation and format.*
- The README should always be a Markdown file
- When asked to create a README in a directory: Create the README and link all documents in that folder to it
- Give a detailed description of what each document is and what it is to be used for
- All READMEs should have the following format: Title, Description, Links to all documents in the directory presented as a tree structure, Links to parent directory README.md, Links to child README.md files if any, Detailed description of each document in the directory and what it is to be used for

## Parent-Child README Relationships
*Manages hierarchical README file relationships and cross-linking requirements.*
- If a document is named just `README.md`, it could be a parent to other README files in this directory
- Child documents should have the format `README-<something>.md`
- The parent `README.md` should have links to all child README files in that directory
- Each child README file should have a link back to the parent `README.md` file

## Directory Linking Protocol
*Ensures proper linking between README files across directory hierarchies.*
- Link the README you just created to the parent directory README
- If there is no parent directory README, create one and link the child README to it
- If there is a parent directory README, add a link to the child README in the parent README
- This rule should be applied whenever a new README is created or an existing README is updated
- All READMEs up to the parent directory should be updated

## Status
**ACTIVE** - Core documentation rule that ensures consistent README file creation and maintenance across all project directories. Required for maintaining organized documentation hierarchy.
