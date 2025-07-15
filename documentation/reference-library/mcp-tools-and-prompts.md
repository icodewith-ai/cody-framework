# Required MCP Tools and Prompts for Vibedocs Agent

This document outlines the core tools and prompt patterns the MCP server must support to bring the AI agent interactions in [sample-interaction-with-mcp-server.md](./sample-interaction-with-mcp-server.md) to life.

These tools are responsible for creating the project, creating releases, and create, reading and updating Vibedocs documents in order to guide users through structured vibe coding sessions.

## Tool Overview

| Tool Name         | Purpose                                                                 | Inputs                                                                 | Outputs                                       | Pre-Requisites |
|------------------|-------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------|----------------|
| `createProject`  | Sets up the initial Vibedocs folder structure and 01-starting-prompt.md document | Project name (optional)                                                | Creates `.vibedocs/` folder with `discovery/`, `reference-library/`, and `releases/`. Adds `01-starting-prompt.md` under `discovery/`. | None |
| `createRelease`  | Creates a new versioned release folder with `01-starting-prompt.md`      | Release version (e.g., `v1.1.0`)                                       | `releases/vX.Y.Z/` folder and `01-starting-prompt.md` file            | Project initialized with discovery documents |
| `createDocument` | Creates a new document in the appropriate location using a named template | `location` (`discovery`, `reference-library`, `releases`), `template`, optionally `releaseVersion` | New markdown file created using selected template | Project and template system must exist |
| `readDocument`   | Reads and returns the contents of a markdown file                        | File path                                                              | Raw markdown content                          | N/A |
| `writeDocument`  | Writes or updates content into a markdown file                           | File path, content                                                     | File updated                                  | N/A |

## Prompts Overview

This section outlines sample natural language prompts from users, how the AI agent interprets them, and which **named prompts** on the MCP server are triggered. Each named prompt encapsulates logic, input schema, and tool usage needed to respond to the user intent.

| Prompt (User Says)                                                   | Agent Behavior                                                                                       | Prompt Name (MCP)        |
|----------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|--------------------------|
| `I want to create a shoot'em up game with 2 types of aliens using vibedocs.` | Initializes project structure and starting document                                                   | `CreateProject`          |
| `Please create new release. Call it v1.1.0.`                         | Sets up new release folder and creates `01-starting-prompt.md`                                        | `CreateRelease`          |
| `continue` (after starting prompt)                                   | Reads `starting-prompt.md` and generates initial clarification questions                              | `GenerateQuestions`      |
| `continue` (after answering questions)                               | Analyzes answers, generates PRD                                                                       | `CreatePRD`              |
| `continue` (after reviewing PRD)                                     | Reads PRD, generates implementation plan                                                               | `CreatePlan`             |
| `continue` (after reviewing Plan)                                    | Breaks down plan into tasks                                                                            | `GenerateTasklist`       |
| `start work`                                                         | Moves into execution state — marks task list as ready                                                 | `StartWorkSession`       |
| `release done`                                                       | Generates release notes and retrospective                                                             | `CloseRelease`           |
| `Can you please generate a functional breakdown of my product.`      | Generates a reference doc describing key functional areas                                              | `CreateFunctionalBreakdown` |
| `Let's generate the tech stack documentation for my web app.`        | Generates a reference doc outlining tech stack                                                         | `CreateTechStackDoc`     |

> These prompt names are stored and served by the MCP server. Each one:
> - Uses internal tools like `readDocument`, `writeDocument`, or `createDocument`
> - Has structured inputs/outputs
> - Contains embedded prompt logic and handles document flow contextually