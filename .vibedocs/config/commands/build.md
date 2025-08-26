---
command: ":vd build"
description: Starts the BUILD phase and creates the feature backlog. 
---

- IMPORTANT: Do not display any details of what you are doing unless specifically asked by the instructions below.

# *****************
# BUILD PHASE START
# *****************


# **********************************
# CREATE FEATURE BACKLOG 
# (skip this if you already did it)
# **********************************
- Check that {{vdTemplates}}/build/feature-backlog.md does not exist.  
    If it does not:
        - Copy from {{vdTemplates}}/build/feature-backlog.md into {{vdWorkPhase}}
        - Review the plan.md document you created in the discovery phase, then generate and update the feature-backlog.md document.
        - When you are done, tell the USER to review it.   Also tell them they can type 'vibedocs build version' to start working on a version.
        - Stop here.
    If it does:
        - Tell the USER that the build phase has already started.
        - Tell the USER that the Feature Backlog already exists.
        - Tell the USER they can work on a version next.
        - Stop here.