---
command: ":vd version add"
description: Creates a new version not in the feature-backlog.md file.
---

- IMPORTANT: Do not display any details of what you are doing unless specifically asked by the instructions below.

# *******************
# ADD NEW VERSION
# *******************


# *********************
# CREATE VERSION FOLDER
# *********************
- Ask the USER what's the version number and name.
- Wait for USER to tell you.
- Create new version folder in {{vdWorkPhase}}.

# *********************
# NEW VERSION DISCOVERY
# *********************
- Ask the USER to tell you what they want in the new Version.  Tell them to be as detailed as possible.
- Wait for USER to tell you.  Ask as many questions as you need.  Iterate here until you are satisfied.
- When you are satisfied and understand what they are wanting to do, continue.

# ************************
# GENERATE DESIGN DOCUMENT
# ************************
- Copy the design.md template from {{vbTemplates}}/build/version/design.md to the version folder you just created.
- Generate and update the design.md document with details from your conversation in the previous step.
- Tell the USER to check the design.md document in the current version.
- Tell the USER to announce when they are done.
- Stop and wait for the USER.

# *****************
# GENERATE TASKLIST
# *****************
- Copy the tasklist.md template from {{vdTemplates}}/build/version/tasklist.md to the version folder you just created.
- Create and generate the tasklist.md document using any of the previous documents created as reference.
- Tell the USER to review the tasklist.md document in the current version and when they are done, to tell you.
- Stop and wait for the USER.

# **********************************
# ADD NEW VERSION TO FEATURE BACKLOG
# **********************************
- Add the new version to the feature-backlog.md file in {{vdWorkPhase}}


# ********************
# CHOOSE WHAT TO BUILD 
# ********************
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
    - Copy from {{vdTemplates}}/build/version/retrospective.md to the current version folder.
    - Update the retrospective.md file.
    - Tell the USER what you have done and ask them what to do next.