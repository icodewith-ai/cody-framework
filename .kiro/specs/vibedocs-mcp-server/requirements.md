# Requirements Document

## Introduction

This document outlines the requirements for a Node.js MCP (Model Context Protocol) server that enables AI assistants to guide vibecoders through structured project development workflows. The server will provide tools to transform chaotic "vibe coding" into organized, versioned feature implementations using the vibedocs methodology.

## Requirements

### Requirement 1

**User Story:** As an AI assistant, I want to initialize vibedocs projects for users, so that vibecoders can start with proper project structure and documentation.

#### Acceptance Criteria

1. WHEN the `vibedocs_start` tool is called THEN the system SHALL create the complete vibedocs folder structure (.vibedocs/project/plan and .vibedocs/project/work/releases)
2. WHEN initializing a project THEN the system SHALL copy discovery.md template to .vibedocs/project/plan/discovery.md
3. WHEN the discovery document is created THEN the system SHALL populate it with the user's initial project idea
4. IF a vibedocs project already exists THEN the system SHALL return an error message indicating the project is already initialized
5. WHEN initialization is complete THEN the system SHALL return success confirmation with next steps for the user

### Requirement 2

**User Story:** As an AI assistant, I want to create new releases for vibedocs projects, so that vibecoders can organize their development into manageable iterations.

#### Acceptance Criteria

1. WHEN the `vibedocs_create_release` tool is called with a version number THEN the system SHALL create a new release folder at .vibedocs/project/work/releases/v[version]
2. WHEN creating a release THEN the system SHALL copy all version template documents (design.md, tasklist.md, retrospective.md) to the release folder
3. WHEN a release is created THEN the system SHALL validate the version number follows semantic versioning (major.minor.patch)
4. IF the version number already exists THEN the system SHALL return an error message
5. WHEN release creation is complete THEN the system SHALL return the release folder path and list of created documents
6. IF no vibedocs project exists THEN the system SHALL return an error message indicating the project must be initialized first

### Requirement 3

**User Story:** As an AI assistant, I want to close releases in vibedocs projects, so that vibecoders can properly finalize their development iterations with documentation.

#### Acceptance Criteria

1. WHEN the `vibedocs_close_release` tool is called with a version number THEN the system SHALL validate the release exists
2. WHEN closing a release THEN the system SHALL check that required documents (design.md, tasklist.md) have content
3. WHEN a release is closed THEN the system SHALL create or update the release-notes.md document
4. WHEN closing a release THEN the system SHALL mark the release as completed in the project metadata
5. IF the release doesn't exist THEN the system SHALL return an error message
6. WHEN release closure is complete THEN the system SHALL return confirmation with release summary

### Requirement 4

**User Story:** As a vibecoder, I want the MCP server to manage my project workflow state, so that I can track progress and maintain consistency across development phases.

#### Acceptance Criteria

1. WHEN any tool is executed THEN the system SHALL validate the current project state before proceeding
2. WHEN project state changes THEN the system SHALL update project metadata files to track current phase and active releases
3. WHEN errors occur THEN the system SHALL provide clear, actionable error messages to guide users
4. WHEN tools are called THEN the system SHALL return structured responses that AI assistants can easily parse and present to users
5. IF file system operations fail THEN the system SHALL handle errors gracefully and provide meaningful feedback

### Requirement 5

**User Story:** As an AI assistant, I want to access vibedocs project information, so that I can provide contextual guidance to vibecoders about their current project state.

#### Acceptance Criteria

1. WHEN the MCP server starts THEN the system SHALL register all available tools with proper schemas and descriptions
2. WHEN tools are called THEN the system SHALL validate input parameters against defined schemas
3. WHEN returning data THEN the system SHALL provide structured JSON responses that include project status, available actions, and relevant file paths
4. WHEN file operations are performed THEN the system SHALL ensure proper file permissions and handle access errors
5. IF the working directory is not a valid project THEN the system SHALL provide guidance on how to initialize or navigate to a vibedocs project

### Requirement 6

**User Story:** As a vibecoder, I want the MCP server to work seamlessly with my AI assistant, so that I can focus on development rather than managing project structure manually.

#### Acceptance Criteria

1. WHEN the MCP server is installed THEN the system SHALL be compatible with standard MCP client implementations
2. WHEN AI assistants call MCP tools THEN the system SHALL respond within reasonable time limits (< 2 seconds for file operations)
3. WHEN multiple operations are performed THEN the system SHALL maintain consistency across the project structure
4. WHEN the server encounters Node.js runtime issues THEN the system SHALL provide clear diagnostic information
5. IF template files are missing or corrupted THEN the system SHALL provide fallback templates or clear error messages