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


### 2. Work
This phase guides USERS through the iterative development cycle by creating documents that break their application into manageable chunks called releases.  We first start creating the feature backlog.

| Document | Description |
|----------|-------------|
| `feature-backlog.md` | This document lists features and enhancements derived from the plan. It lives on the top level of the Work phase, accessible by all releases. It is a living document that will evolve throughout the project. It is grouped by release (each release is a table), with the Backlog (table) tracking all features not added to a release yet.  It is used to create releases to work on. |

> Then we create releases based on the feature backlog. The following documents are used for every release a USER works on.

| Document | Description |
|----------|-------------|
| `design.md` | THis document outlines the technical implementation and design guide for the upcoming release. |
| `tasklist.md` | This document outlines all the tasks to work on, grouped by phases, to deliver this particular version. |
| `retrospective.md` | This document reflects on what worked, what didn't, and how future releases can be improved. |

## Release Version Naming Convention
- Version numbers follow the format v[major.minor.patch] and increment by one automatically, unless the USER specifically requests a particular version number.
- Version folders inside the @.vibedocs/work/ folder are named "v[major.minor.patch]-[name]" (e.g. v1.0.3-refactor-code)
- The starting release version will be 0.1.0, unless the USER specifically requests a particular version number.
- Names can't be longer than 30 characters in total.  Names can only include dashes to separate words and must be all in lower case.  Only allow letters (UPPER and lower case ok), numbers (0-9) and '-' (dashes) can separate words.
- If the USER didn't provide a version, automatically assign one.
- If the USER didn't provide a name for the release, skip the -[name]

## Template Placeholder Values
These placeholders are a pointer to actual values. They are created here and used throughout various commands.  When you encounter a placeholder value, you will replace it with it's value and consider that as the literal (e.g. {{vdConfig}}/agent-init.md would translate to .vibedocs/config/agent-init.md)

| Placeholder | Maps to | Description |
|------------|---------|-------------|
| {{vdRoot}} | .vibedocs/ | Vibedocs root folder |
| {{vdConfig}} | .vibedocs/config/ | Vibedocs configuration folder |
| {{vdTemplates}} | .vibedocs/config/templates | Vibedocs templates folder |
| {{vdPlanPhase}} | .vibedocs/plan | Vibedocs root folder for the planning phase. |
| {{vdWorkPhase}} | .vibedocs/work | Vibedocs root folder for the work phase. |
| {{vdAssets}} | .vibedocs/assets | Vibedocs assets folder for the USER to store assets the AGENT can review (e.g. diagrams, images, etc). |

##  :ASSETS in USER Prompts and What the AGENT Should Do
The USER at times may want to tell the AGENT about a particular file that they need to review as part of their prompt. For example, the USER may state something like "Check out the database.png file in the :ASSETS folder". If the USER uses in any of their prompts :ASSETS, the AGENT needs to look in the {{vdAssets}} for that file.  If it does not find it, it should tell the user that it was not found and give a list of all the files found in the {{vdAssets}} folder.

## Executing Commands

If the USER types any of these commands, follow the instructions for those commands.

> ###  `vibedocs help` | `:vd help` 
> Provides the USER with help about Vibedocs

**[AI AGENT TODO: perform the following]** 
````
**************************************
Welcome to Vibedocs by iCodeWith.ai
**************************************

- Provide the USER with a short overview of Vibedocs.
- Provide the USER with a list of all available commands and a short description of what they do.
- Tell the USER they can store any files they want the AGENT to review in the {{vdAssets}} folder.
- Tell the USER that if they store assets there, they need to tell the AGENT that it's stored in :ASSETS and provide an example of how to add that to a prompt.
- Stop here.
````

> ### `vibedocs plan` | `:vd plan`
> Creates a vibedocs project and starts the PLAN phase.

**[AI AGENT TODO: perform the following]** 
````
# ****************
# PLAN PHASE START
# ****************


# ***********************
# CREATE FOLDER STRUCTURE
# ***********************
- create the following folder structure in {{vdRoot}} only if it does not exist already.
/plan
/work
/assets

# *************************
# CREATE DISCOVERY DOCUMENT
# *************************
- Copy from {{vdTemplates}}/plan/discovery.md into {{vdPlanPhase}}
- Tell the USER to open that document, updated it, save it and tell you that they are done.
- When the USER tells you they are done, you will review the document.
- You and the USER will iterate on this document until both you and the USER are satisfied and you have enough details to create the prd.
- Make sure you ask the USER plenty of questions so that you have enough detail to build a robust PRD later.


# *******************
# CREATE PRD DOCUMENT
# *******************
- Once you are both ready to move on, you will copy from {{vdTemplates}}/plan/prd.md into {{vdPlanPhase}}
- You will review the discovery.md document and use it to generate and update the prd.md in the document you just copied.
- You and the USER will iterate on the PRD until you're both happy with it.


# ********************
# CREATE PLAN DOCUMENT
# ********************
- Once you and the USER are ready to move on, you will copy from {{vdTemplates}}/plan/plan.md into {{vdPlanPhase}}
- You will review the prd.md document and use it to generate and update the plan.md document you just copied.
- You and the USER will iterate on the plan until you're both happy with it.


# ***************
# PLAN PHASE ENDS
# ***************
- Tell the USER the phase has ended and if they want to start working, they can just type :vd work to create the feature backlog.
- Stop here.
````

> ### `vibedocs work` or `:vd work`
> Starts the WORK phase and creates the feature backlog. 

**[AI AGENT TODO: perform the following]** 
````
# ****************
# WORK PHASE START
# ****************


# **********************************
# CREATE FEATURE BACKLOG 
# (skip this if you already did it)
# **********************************
- Check that {{vdTemplates}}/work/feature-backlog.md does not exist.  
    If it does not:
        - Copy from {{vdTemplates}}/work/feature-backlog.md into {{vdWorkPhase}}
        - Review the plan.md document you created in the discovery phase, then generate and update the feature-backlog.md document.
        - When you are done, tell the USER to review it.   Also tell them they can type 'vibedocs work version' to start working on a version.
        - Stop here.
    If it does:
        - Tell the USER that work has already started.
        - Tell the USER that the Feature Backlog already exists.
        - Tell the USER they can work on a version next.
        - Stop here.
````

> ### `vibedocs work version` or `:vd work version`
> Creates a release (version) using the feature-backlog.md file.  The USER will pick which release to work on.

````
# *******************
# WORK PHASE CONTINUE
# *******************


# *************************
# CHOOSE VERSION TO WORK ON
# *************************
- Show the USER a list of versions available from the {vdWorkPhase}feature-backlog.md file that have a Status of "Not Started" or "In Progress"
- Ask the USER which version they would like to work on.


# *********************
# CREATE VERSION FOLDER
# *********************
- Create the version folder, using the version name from the selected version, but make sure you convert that name to follow the 'Release Version Naming Convention' section rules in this document.


# ************************
# GENERATE DESIGN DOCUMENT
# ************************
- Copy the design.md template from {{vbTemplates}}/work/version/design.md to the version folder you just created.
- Generate and update the design.md document with details from the version the USER chose to work on.
- Tell the USER to check the design.md document in the current version.
- Tell the USER to announce when they are done.
- Stop and wait for the USER.


# *****************
# GENERATE TASKLIST
# *****************
- Copy the tasklist.md template from {{vdTemplates}}/work/version/tasklist.md to the version folder you just created.
- Create and generate the tasklist.md document using any of the previous documents created as reference.
- Tell the USER to review the tasklist.md document in the current version and when they are done, to tell you.
- Stop and wait for the USER.

# **********************
# CHOOSE WHAT TO WORK ON 
# **********************
- Ask the USER which task or phase in the tasklist.md file they would like to start working on.
- Stop here and wait for USER to tell you.

# ***********
# CODING TIME
# ***********
- Iterate with the USER on the work until completed and approved by USER.
- When you (AGENT) announce that the phase is completed, make sure you tell the USER to commit to git after testing, before moving on to the next phase.
- Once completed, ask USER what to work on next.
- Iterate until all phases for the version are completed.

# *****************
# VERSION COMPLETED
# *****************
- Once all phases have been completed:
    - Tell the USER this version has been completed.
    - Update {{vdWorkPhase}}/feature-backlog.md with completed version.
    - Copy from {{vdTemplates}}/work/version/retrospective.md to the current version folder.
    - Update the retrospective.md file.
    - Tell the USER what you have done and ask them what to do next.
````