---
command: ":cody plan"
description: Creates a Cody project and starts the PLAN phase.
---

# PLAN PHASE START

### CREATE FOLDER STRUCTURE

- create the entire folder structure in {{cfProject}}.  All folders must exists.  Create any missing folders and/or sub-folders.  Make sure all exist before continuing to the next step.

    ```
    /build
    /library
        /assets
        /docs
        /prompts
        /rules
    /plan
    ```

### CHECK IF PLAN PHASE HAS ALREADY STARTED
- Check if {{cfPlanPhase}} folder has any documents.  
    - If it does, list the documents already started.
    - End here.
- If it does not, continue to the next section.

### ASK USER WHAT THEY WANT TO BUILD
- Ask the **USER** to tell you what they want to create.  Tell them to be as detailed as possible.
- Wait for **USER** to tell you.  Ask as many questions as you need.  Iterate until you (**AGENT**) are satisfied.
- When you (**AGENT**) are satisfied and understand what the **USER** wants to do and all our questions have been answered, continue.

### CREATE DISCOVERY DOCUMENT
- Copy from {{cfTemplates}}/plan/discovery.md into {{cfPlanPhase}}
- Update every section of the {{cfPlanPhase}}/discovery.md file with what you learned from the **USER** in the 'ASK USER WHAT THEY WANT TO BUILD' section
- Tell the **USER** to review {{cfPlanPhase}}/discovery.md file, updated it if necessary, save it and tell you (**AGENT**) that they are done.
- When the **USER** tells you they are done, you (**AGENT**) will review the document.
- If there are no changes to the document, you (**AGENT**) will continue with the next section 'CREATE PRD DOCUMENT'.
- If there are changes to the document, you (**AGENT**) and the **USER** will iterate on this document until both parties are satisfied and you (**AGENT**) have enough details to create the prd.
- Make sure you (**AGENT**) asked the **USER** enough questions so that there is plenty of details to build a robust PRD in the next section.

### CREATE PRD DOCUMENT
- Copy from {{cfTemplates}}/plan/prd.md into {{cfPlanPhase}}
- You (**AGENT**) will review the discovery.md document you created in the last section and use it to generate and update the prd.md document you just copied.
- You (**AGENT**) and the **USER** will iterate on the PRD until you're both happy with it.

### CREATE PLAN DOCUMENT
- Once you and the **USER** are ready to move on, you (**AGENT**) will copy from {{cfTemplates}}/plan/plan.md into {{cfPlanPhase}}
- You will review the prd.md document and use it to generate and update the plan.md document you just copied.
- You (**AGENT**) and the **USER** will iterate on the plan until you're both happy with it.

### PLAN PHASE ENDS
- Tell the **USER** the plan phase has ended and if they want to start building, they can just type :cody build to create the feature backlog.
- Stop here.