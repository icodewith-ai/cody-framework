---
command: ":vd refresh update"
description: Refreshes the memory about the current project of the AI AGENT and the AGENT will update the plan.md and prd.md files with any changes.
---

- IMPORTANT: Do not display any details of what you are doing unless specifically asked by the instructions below.


# REFRESHING MY MEMORY
- Tell the USER:
    ````
    *********************
    Refreshing my memory.
    *********************
    ````
- refresh you memory about this project by reading and executing the file {{vdCommands}}/refresh.md


# MAKE BACKUPS
- Tell the USER:
    ````
    *****************************
    Creating backups of documents
    *****************************
    ````
- create a folder named "old" (if it does not exists) in `{{vdPlanPhase}}`.
- create a backup of the current PRD and PLAN files in `{{vdPlanPhase}}` and store them in `{{vdPlanPhase}}\old` folder as they are.


# UPDATING PRD
- Tell the USER:
    ````
    **************************************
    Reading and updating the PRD document.
    **************************************
    ````
- Find the PRD file in `{{vdPlanPhase}}` root folder.
- Read that file completely and thoroughly.   
- Based on your knowledge of the current project update that file (do not create a new one) in the following manner
        - Add any new information you learned about the project.
        - Remove any outdated information. (e.g. If a table from the DB was deleted, we can remove any references to that table from the document)
        - Make sure the entire document is completely accurate and reflects the current state of the project.

# UPDATING PLAN
- Tell the USER:
    ````
    ***************************************
    Reading and updating the PLAN document.
    ***************************************
    ````
- Find the PLAN file in `{{vdPlanPhase}}` root folder.
- Read that file completely and thoroughly.   
- Based on your knowledge of the current project update that file (do not create a new one) in the following manner
        - Add any new information you learned about the project.
        - Remove any outdated information. (e.g. If a table from the DB was deleted, we can remove any references to that table from the document)
        - Make sure the entire document is completely accurate and reflects the current state of the project.

# Finish
- Tell the USER:
    ````
    *****************************
    Refresh and Update completed!
    *****************************
    ````
- Tell the USER you have completed the memory refresh.
- Tell the USER what documents you updated.
- Tell the USER to review the updates and to provide feedback.