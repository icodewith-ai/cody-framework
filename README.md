# Vibedocs

![Version](https://img.shields.io/badge/version-1.0.3-blue)
[![License](https://img.shields.io/badge/license-Custom-green)](LICENSE.md)

Vibedocs is a structured development methodology that brings organization and repeatability to the creative process of vibe coding. It guides developers through idea discovery and refinement, transforming vague concepts into well-defined plans, then breaking them into manageable versions for systematic implementation, all without stifling creativity.

You can skip directly to the ["Installing and Using It"](#installing-and-using-it) section to get started right away.

## Core Philosophy

Vibedocs bridges the gap between unstructured ideation and systematic development by providing:
- **Structure without rigidity**: Templates and phases that guide without constraining
- **Iterative refinement**: Built-in feedback loops between human and AI
- **Version-based development**: Manageable chunks of work organized by versions
- **Living documentation**: Documents that evolve with your project

## Two-Phase Development Cycle

### Phase 1: Plan
The planning phase transforms raw ideas into actionable development plans through three key documents:

#### 1. Discovery Document (`discovery.md`)
- **Purpose**: Captures the raw, unfiltered initial idea
- **Process**: Interactive Q&A between developer and AI to refine understanding
- **Output**: Clear project vision and requirements

#### 2. Product Requirements Document (`prd.md`)
- **Purpose**: Formalizes "the what and the why" of your product
- **Sections**: Summary, Goals, Target Users, Key Features, Success Criteria, User Stories, Assumptions, Dependencies
- **Output**: Structured product definition

#### 3. Implementation Plan (`plan.md`)
- **Purpose**: Defines "how and when" the product will be built
- **Sections**: Architecture, Components, Data Model, Technical Steps, Tools & Services, Risks, Milestones, Environment Setup
- **Output**: Technical roadmap and implementation strategy

### Phase 2: Build
The build phase breaks development into manageable, versioned versions:

#### Feature Backlog (`feature-backlog.md`)
- **Purpose**: Central repository of all features derived from the plan
- **Organization**: Features grouped by versions with priority and status tracking
- **Status Types**: 🔴 Not Started, 🟡 In Progress, 🟢 Completed
- **Priority Levels**: High, Medium, Low

#### Version Documents (per version)
Each version gets its own folder with three documents:

1. **Design Document (`design.md`)**
   - Technical implementation guide for the version
   - Architecture overview and implementation notes
   - Open questions and considerations

2. **Task List (`tasklist.md`)**
   - Detailed breakdown of work organized by phases
   - Task tracking with status and priority
   - Actionable development items

3. **Retrospective (`retrospective.md`)**
   - Post-version reflection and lessons learned
   - What worked well vs. what could improve
   - Action items for future versions

## Version Naming Convention

Vibedocs uses semantic versioning with descriptive names:
- **Format**: `v[major.minor.patch]-[name]`
- **Example**: `v1.0.3-refactor-code`
- **Rules**:
  - Starting version: `v0.1.0` (unless specified)
  - Names: max 30 characters, lowercase, dashes only
  - Auto-increment unless user specifies version
  - Name is optional

## Command Reference
You can call the Vibedocs commands using the `:vd [command]` format.

| Command | Description |
|---------|-------------|
| `:vd help` | Provides the USER with help about Vibedocs |
| `:vd plan` | Creates a vibedocs project and starts the PLAN phase |
| `:vd build` | Starts the BUILD phase and creates the feature backlog |
| `:vd version build` | Creates a version using the feature-backlog.md file. The USER will pick which version to build |
| `:vd version add` | Creates a new version not in the feature-backlog.md file |
| `:vd refresh` | Refreshes the memory about the current project of the AI AGENT |
| `:vd refresh update` | Refreshes the memory about the current project of the AI AGENT and the AGENT will update the plan.md and prd.md files with any changes |
| `:vd relearn` | It forces the AI AGENT to read again the Vibedocs vd-agent file to check for any updates |
| `:vd assets list` | Lists all the files stored in the assets folder, along with their known descriptions of what they are used for |

## File Structure

```
.vibedocs/
├── config/
│   ├── vd-activate.md          # Vibedocs activation instructions
│   ├── vd-agent.md             # AI agent instructions
│   ├── vdconfig.json           # Vibedocs configuration
│   ├── commands/               # Command definitions
│   │   ├── assets-list.md
│   │   ├── build.md
│   │   ├── help.md
│   │   ├── plan.md
│   │   ├── refresh-update.md
│   │   ├── refresh.md
│   │   ├── relearn.md
│   │   ├── version-add.md
│   │   └── version-build.md
│   └── templates/
│       ├── plan/               # Planning phase templates
│       │   ├── discovery.md
│       │   ├── prd.md
│       │   └── plan.md
│       └── build/              # Build phase templates
│           ├── feature-backlog.md
│           └── version/
│               ├── design.md
│               ├── tasklist.md
│               └── retrospective.md
├── assets/                     # User assets (added by the user for the AI agent to review)
├── docs/                       # Adhoc documentation created during development
├── plan/                       # Generated planning documents (created when needed)
│   ├── discovery.md
│   ├── prd.md
│   └── plan.md
└── build/                      # Build phase documents (created when needed)
    ├── feature-backlog.md     # Master feature list
    └── v[x.y.z]-[name]/       # Version-specific folders
            ├── design.md
            ├── tasklist.md
            └── retrospective.md
```

## Best Practices

### For Planning Phase
- **Be thorough in discovery**: The Q&A process is crucial for project success
- **Iterate on documents**: Don't rush through - refine until satisfied
- **Think modularly**: Break complex ideas into manageable components
- **Consider dependencies early**: Identify external requirements upfront

### For Build Phase
- **Start small**: Begin with foundational features in early versions
- **Maintain the backlog**: Keep it updated as requirements evolve
- **Regular retrospectives**: Learn from each version to improve the next
- **Version strategically**: Group related features into logical versions

### For AI Collaboration
- **Provide context**: The more detail in discovery, the better the AI assistance
- **Review generated content**: AI creates drafts - you refine and approve
- **Ask questions**: Use the AI to explore edge cases and considerations
- **Iterate freely**: The process is designed for multiple rounds of refinement

## Troubleshooting

### Common Issues
- **Stuck in planning**: Set time limits for each document iteration
- **Overwhelming backlog**: Focus on next 2-3 versions, keep others high-level
- **Version scope creep**: Use the design document to maintain focus
- **Skipping retrospectives**: These are crucial for continuous improvement

### Getting Unstuck
- Return to the discovery document to reconnect with core vision
- Break large features into smaller, more manageable pieces
- Use the AI agent to explore alternative approaches
- Review successful past versions for patterns to repeat
 
## Installing and Using It

Vibedocs can be easily added to any project by following these steps:

### Installation
1. **Download from GitHub**: Clone or download Vibedocs from https://github.com/icodewith-ai/vibedocs
2. **Copy configuration**: Only copy the `.vibedocs` folder into your project's root directory
3. **Initialize the AI agent**: Ask your AI assistant to "Read and execute the .vibedocs/config/vd-activate.md file". This will activate Vibedocs.

### Using It
Once activated, you can use these commands with your AI assistant to kick start the process:
- **`:vd help`**: Displays all available commands and how to use them
- **`:vd plan`**: Starts the planning phase, creating necessary documents and guiding you through the discovery process

Vibedocs works with any development environment (IDE) that has built in tools for file management.

## License

This project is licensed under a custom license. See the [LICENSE.md](LICENSE.md) file for details.