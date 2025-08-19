# Vibedocs
Vibedocs is a structured development methodology that brings organization and repeatability to the creative process of "vibe coding." It guides developers from vague ideas to well-defined, versioned feature implementations without stifling creativity.

You can skip directly to the ["Installing and Using It"](#installing-and-using-it) section to get started right away.

## Core Philosophy

Vibedocs bridges the gap between unstructured ideation and systematic development by providing:
- **Structure without rigidity**: Templates and phases that guide without constraining
- **Iterative refinement**: Built-in feedback loops between human and AI
- **Version-based development**: Manageable chunks of work organized by releases
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

### Phase 2: Work
The work phase breaks development into manageable, versioned releases:

#### Feature Backlog (`feature-backlog.md`)
- **Purpose**: Central repository of all features derived from the plan
- **Organization**: Features grouped by release with priority and status tracking
- **Status Types**: 🔴 Not Started, 🟡 In Progress, 🟢 Completed
- **Priority Levels**: High, Medium, Low

#### Release Documents (per version)
Each release gets its own folder with three documents:

1. **Design Document (`design.md`)**
   - Technical implementation guide for the release
   - Architecture overview and implementation notes
   - Open questions and considerations

2. **Task List (`tasklist.md`)**
   - Detailed breakdown of work organized by phases
   - Task tracking with status and priority
   - Actionable development items

3. **Retrospective (`retrospective.md`)**
   - Post-release reflection and lessons learned
   - What worked well vs. what could improve
   - Action items for future releases

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
You can call the Vibedocs commands either by typing out the entire word (`vibedocs [command]`) or the shortcut (`!vd [command]`).

| Command | Description |
|---------|-------------|
| `vibedocs help` or `!vd help` | Displays overview and available commands |
| `vibedocs plan` or `!vd plan` | Starts the planning phase:<br>1. Creates folder structure (`/plan`, `/work`, `/work/releases`)<br>2. Initiates discovery document creation and iteration<br>3. Generates PRD based on discovery insights<br>4. Creates implementation plan from PRD<br>5. Prepares for work phase |
| `vibedocs work` or `!vd work` | Starts the work phase:<br>1. Creates feature backlog from implementation plan<br>2. Organizes features by release<br>3. Sets up for version-based development |
| `vibedocs work version` or `!vd work version` | Begins work on a specific version:<br>1. Shows available versions from backlog<br>2. Creates version folder with proper naming<br>3. Generates design document<br>4. Creates task list<br>5. Initiates development cycle |

## File Structure

```
.vibedocs/
├── config/
│   ├── agent-init.md           # AI agent instructions
│   └── templates/
│       ├── plan/               # Planning phase templates
│       │   ├── discovery.md
│       │   ├── prd.md
│       │   └── plan.md
│       └── work/               # Work phase templates
│           ├── feature-backlog.md
│           └── version/
│               ├── design.md
│               ├── tasklist.md
│               └── retrospective.md
├── plan/                       # Generated planning documents
│   ├── discovery.md
│   ├── prd.md
│   └── plan.md
└── work/
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

### For Work Phase
- **Start small**: Begin with foundational features in early releases
- **Maintain the backlog**: Keep it updated as requirements evolve
- **Regular retrospectives**: Learn from each release to improve the next
- **Version strategically**: Group related features into logical releases

### For AI Collaboration
- **Provide context**: The more detail in discovery, the better the AI assistance
- **Review generated content**: AI creates drafts - you refine and approve
- **Ask questions**: Use the AI to explore edge cases and considerations
- **Iterate freely**: The process is designed for multiple rounds of refinement

## Troubleshooting

### Common Issues
- **Stuck in planning**: Set time limits for each document iteration
- **Overwhelming backlog**: Focus on next 2-3 releases, keep others high-level
- **Version scope creep**: Use the design document to maintain focus
- **Skipping retrospectives**: These are crucial for continuous improvement

### Getting Unstuck
- Return to the discovery document to reconnect with core vision
- Break large features into smaller, more manageable pieces
- Use the AI agent to explore alternative approaches
- Review successful past releases for patterns to repeat
 
## Installing and Using It

Vibedocs can be easily added to any project by following these steps:

### Installation
1. **Download from GitHub**: Clone or download Vibedocs from https://github.com/icodewith-ai/vibedocs
2. **Copy configuration**: Only copy the `.vibedocs` folder into your project's root directory
3. **Initialize the AI agent**: Ask your AI assistant to "Read .vibedocs/config/vd-activate.md". This will inform the AI agent of the rules it must follow for Vibedocs.

### Using It
Once installed, you can use these commands with your AI assistant to kick start the process:
- **`:vd help`**: Displays all available commands and how to use them
- **`:vd plan`**: Starts the planning phase, creating necessary documents and guiding you through the discovery process

Vibedocs works with any development environment (IDE) that has built in tools for file management.

## License

This project is licensed under a custom license. See the [LICENSE.md](LICENSE.md) file for details.