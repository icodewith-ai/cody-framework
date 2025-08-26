---
command: ":vd plan"
description: Creates a vibedocs project and starts the PLAN phase.
---

- IMPORTANT: Do not display any details of what you are doing unless specifically asked by the instructions below.

# ****************
# PLAN PHASE START
# ****************


# ***********************
# CREATE FOLDER STRUCTURE
# ***********************
- create the following folder structure in {{vdRoot}} only if it does not exist already.
/assets
/docs
/plan
/build

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
- Tell the USER the phase has ended and if they want to start building, they can just type :vd build to create the feature backlog.
- Stop here.