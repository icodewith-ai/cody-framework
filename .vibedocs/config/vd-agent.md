# AI AGENT INSTRUCTIONS:
- Read this entire document and commit it to memory.
- Make sure you check this document often if you need to understand how to process any vibedocs commands.
- Anything that has **[AI AGENT TODO: to do item]** means you need to take action.
- After every phase, make sure you re-read this document.
- If this is the first time this file was accessed in this project, execute the COMMAND: :vd help
- {{placeholders}} used in commands are defined in this document, under the "Template Placeholder Values" section.  When you see a placeholder, you will replace it with its appropriate value.
- The roles are as follows:
    - **USER** Is the human guding you.
    - **AGENT** That's you!  The AI.

## About Vibedocs
Vibedocs brings structure and repeatability to the unstructured world of “vibe coding” by guiding USERS from vague ideas to well-defined, versioned feature implementations without getting in the way of creativity and "vibing".

## About Phases
Vibedocs has the following 2 phases that all USERS need to go through:

### 1. Plan
This phase guides USERS through the creation of documents that help define and formalize their product idea.

| Document | Description |
|----------|-------------|
| `discovery.md` | This document captures the raw, unfiltered idea or initial AI prompt that sparked the project. It also holds the iterative process of Q&A between the USER and you. |
| `prd.md` | This document formalizes the idea and defines "the what and the why" of the product the USER is building. |
| `plan.md` | This document defines how the product will be built and when. |


### 2. Build
This phase guides USERS through the iterative development cycle by creating documents that break their application into manageable chunks called versions.  We first start creating the feature backlog.

| Document | Description |
|----------|-------------|
| `feature-backlog.md` | This document lists features and enhancements derived from the plan. It lives on the top level of the Build phase, accessible by all versions. It is a living document that will evolve throughout the project. It is grouped by version (each version is a table), with the Backlog (table) tracking all features not added to a version yet.  It is used to build versions. |

> Then we create versions based on the feature backlog. The following documents are used for every version a USER works on.

| Document | Description |
|----------|-------------|
| `design.md` | THis document outlines the technical implementation and design guide for the upcoming version. |
| `tasklist.md` | This document outlines all the tasks to work on, grouped by phases, to deliver this particular version. |
| `retrospective.md` | This document reflects on what worked, what didn't, and how future versions can be improved. |

## Version Naming Convention
- Version numbers follow the format v[major.minor.patch] and increment by one automatically, unless the USER specifically requests a particular version number.
- Version folders inside the @.vibedocs/build/ folder are named "v[major.minor.patch]-[name]" (e.g. v1.0.3-refactor-code)
- The starting version will be 0.1.0, unless the USER specifically requests a particular version number.
- Names can't be longer than 30 characters in total.  Names can only include dashes to separate words and must be all in lower case.  Only allow letters (UPPER and lower case ok), numbers (0-9) and '-' (dashes) can separate words.
- If the USER didn't provide a version, automatically assign one.
- If the USER didn't provide a name for the version, skip the -[name]

## Template Placeholder Values
These placeholders are a pointer to actual values. They are created here and used throughout various commands.  When you encounter a placeholder value, you will replace it with it's value and consider that as the literal (e.g. {{vdConfig}}/vd-agent.md would translate to .vibedocs/config/vd-agent.md)

| Placeholder | Maps to | Description |
|------------|---------|-------------|
| {{vdRoot}} | .vibedocs/ | Vibedocs root folder |
| {{vdConfig}} | .vibedocs/config/ | Vibedocs configuration folder |
| {{vdTemplates}} | .vibedocs/config/templates | Vibedocs templates folder |
| {{vdCommands}} | .vibedocs/config/commands | Vibedocs commands to be executed. |
| {{vdPlanPhase}} | .vibedocs/plan | Vibedocs root folder for the planning phase. |
| {{vdWorkPhase}} | .vibedocs/build | Vibedocs root folder for the build phase. |
| {{vdDocs}} | .vibedocs/docs | Vibedocs documentation folder for reference docs such as Tech Stacks, CMS Management, Design System, etc. |
| {{vdAssets}} | .vibedocs/assets | Vibedocs assets folder for the USER to store assets the AGENT can review (e.g. diagrams, images, etc). |

##  :ASSETS in USER Prompts and What the AGENT Should Do
The USER at times may want to tell the AGENT about a particular file that they need to review as part of their prompt. For example, the USER may state something like "Check out the database.png file in the :ASSETS folder". If the USER uses in any of their prompts :ASSETS, the AGENT needs to look in the {{vdAssets}} for that file.  If it does not find it, it should tell the user that it was not found and give a list of all the files found in the {{vdAssets}} folder.

## Executing Commands

- If the USER types any of these commands, follow the instructions for those commands.
- If you (AGENT) are reading this file to get familiar (or re-familiarize yourself) with it, please make sure you read all the files in the {{vdCommands}} folder.

> ###  `:vd help` 
> Provides the USER with help about Vibedocs
**[AI AGENT TODO: Read and execute {{vdCommands}}/help.md ]** 

> ### `:vd plan`
> Creates a vibedocs project and starts the PLAN phase.
**[AI AGENT TODO: Read and execute {{vdCommands}}/plan.md]** 

> ### `:vd build`
> Starts the BUILD phase and creates the feature backlog. 
**[AI AGENT TODO: Read and execute {{vdCommands}}/build.md]** 

> ### `:vd version build`
> Creates a version using the feature-backlog.md file.  The USER will pick which version to build.
**[AI AGENT TODO: Read and execute {{vdCommands}}/version-build.md]** 

> ### `:vd version add`
> Creates a new version not in the feature-backlog.md file.
**[AI AGENT TODO: Read and execute {{vdCommands}}/version-add.md]** 

> ### `:vd refresh`
> Refreshes the memory about the current project of the AI AGENT.
**[AI AGENT TODO: Read and execute {{vdCommands}}/refresh.md]** 

> ### `:vd refresh update`
> Refreshes the memory about the current project of the AI AGENT and the AGENT will update the plan.md and prd.md files with any changes.
**[AI AGENT TODO: Read and execute {{vdCommands}}/refresh-update.md]** 

> ### `:vd relearn`
> It forces the AI AGENT to read again the Vibedocs vd-agent file to check for any updates.
**[AI AGENT TODO: Read and execute {{vdCommands}}/relearn.md]** 

> ### `:vd assets list`
> Lists all the files stored in the assets folder, along with their known descriptions of what they are used for.
**[AI AGENT TODO: Read and execute {{vdCommands}}/assets-list.md]** 