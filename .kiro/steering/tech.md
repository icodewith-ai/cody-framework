# Technology Stack

## Primary Technology
- **Node.js**: Runtime environment for MCP server implementation
- **TypeScript**: Preferred for type safety and better development experience
- **MCP (Model Context Protocol)**: Core integration protocol for AI assistant connectivity

## Project Type
This is an MCP Server project designed to integrate with AI assistants like Claude, Cursor, and Visual Studio Code through MCP connectors.

## Development Environment
- **Target Platform**: Cross-platform (macOS, Linux, Windows)
- **Package Manager**: npm (standard Node.js package management)
- **Version Control**: Git with standard .gitignore patterns

## Common Commands
```bash
# Project initialization
npm init
npm install

# Development
npm run dev          # Start development server
npm run build        # Build TypeScript to JavaScript
npm run test         # Run test suite

# MCP Server specific
npm run start        # Start MCP server
npm run lint         # Code linting
```

## File Structure Conventions
- Use `.md` files for all documentation (Markdown format)
- TypeScript source files in standard Node.js project structure
- Templates stored in `.vibedocs/.templates/` hierarchy
- Project documents in `.vibedocs/project/` hierarchy

## Integration Notes
- Designed for AI assistant integration, not direct user interfaces
- Requires file system access for document and project structure management
- Follows semantic versioning (major.minor.patch) for releases