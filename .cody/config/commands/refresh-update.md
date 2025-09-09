---
command: ":cody refresh update"
description: Refreshes the memory about the current project of the AI AGENT and the AGENT will update the plan.md and prd.md files with any changes.
---

# REFRESH AGENT MEMORY AND UPDATE DOCS

### ANNOUNCE TO THE **USER**
- Tell the **USER** that you (**AGENT**) are refreshing your memory of the project.
- Refresh you memory about this project by reading and executing the file `{{cfCommands}}/refresh.md`.


### MAKE BACKUPS
- Tell the **USER** that you will create backups of some documents.
- Create a folder named "old" (if it does not exists) in `{{cfPlanPhase}}`.
- Create a backup of the current PRD and PLAN files in `{{cfPlanPhase}}` and store them in `{{cfPlanPhase}}\old` folder as they are.


### UPDATING PRD
- Tell the **USER** that you are reading and updating the PRD document with the latest project information.
- Find the PRD file in `{{cfPlanPhase}}` root folder.
- Read that file completely and thoroughly.   
- Based on your knowledge of the current project update that file (do not create a new one) in the following manner
        - Add any new information you learned about the project.
        - Remove any outdated information. (e.g. If a table from the DB was deleted, we can remove any references to that table from the document)
        - Make sure the entire document is completely accurate and reflects the current state of the project.

# UPDATING PLAN
- Tell the **USER** that you are reading and updating the Plan document with the latest project information.
- Find the plan.md file in `{{cfPlanPhase}}` root folder.
- Read that file completely and thoroughly.   
- Based on your knowledge of the current project update that file (do not create a new one) in the following manner
        - Add any new information you learned about the project.
        - Remove any outdated information. (e.g. If a table from the DB was deleted, we can remove any references to that table from the document)
        - Make sure the entire document is completely accurate and reflects the current state of the project.

# FINISH
- Tell the **USER** you have completed your memory refresh.
- Tell the **USER** what documents you updated.
- Tell the **USER** to review the updates and to provide feedback.