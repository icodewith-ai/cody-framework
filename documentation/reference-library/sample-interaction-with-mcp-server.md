# Sample Interaction with Vibedocs MCP Server

This is a walkthrough of how a user would interact with Vibedocs using an AI chat agent via the MCP (Model Context Protocol) interface. The agent guides the user step-by-step into creating the necessary documents to have an effective and results-oriented vibe coding session. 

# Create the Project
> AI Chat interaction on how to create a Vibedocs project. This process sets up the project structure and walks the user through creating the following documents: starting-prompt.md, questions-and-answers.md, prd.md, and plan.md.

```
User:
I want to create a shoot'em up game with 2 types of aliens using vibedocs.

AI Agent:
✅ Vibedocs project initialized.
✅ discovery/starting-prompt.md created with your initial idea.
📝 Please review and update the prompt file to add any details or refinements.

When you’re ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Reading: discovery/starting-prompt.md
✅ Generating initial questions to clarify your idea.
✅ discovery/questions-and-answers.md created with questions.
📝 Please add your responses inline in that file.

When you’re ready, tell me 'continue'
```

```
User:
I’ve added my answers — please continue.

AI Agent:
✅ Re-reading: discovery/questions-and-answers.md
✅ Answers received. Continuing analysis...
✅ Added follow-up questions for clarification.
📝 Please continue responding inline in discovery/questions-and-answers.md.

When you’re ready, tell me 'continue'
```

```
User:
I've answered those questions as well.  Continue.

AI Agent:
✅ Re-reading: discovery/questions-and-answers.md
✅ Answers received. Continuing analysis...
✅ All required information collected.
✅ Generating: discovery/prd.md
✅ PRD created based on your prompt and answers.
📝 Review and edit the PRD as needed.

When you’re ready, tell me 'continue'
```

```
User:
I updated it.  Check again.

AI Agent:
✅ Checking: discovery/prd.md with updates.
✅ I have questions for you in there.
📝 Review and update the PRD.

When you’re ready, tell me 'continue'
```

```
User:
Questions answered.

AI Agent:
✅ Checking: discovery/prd.md with updates.
✅ I cleaned up the PRD based on your answers.
📝 Review and update the document as needed.

When you’re ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Checking: discovery/prd.md with updates.
✅ I have everything I need now to start.
✅ I will now create the discovery/plan.md document.
✅ Document created.
📝 Review and update the document as needed.

When you’re ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Checking: discovery/plan.md with updates.
✅ I have everything I need.
✅ The Vibedocs project is set up.
📝 Feel free to review all the documents and update them as your project changes.

From here, you can create a release or begin coding to start working on your project.
```

# Create a Release
> Creates a release, with all the related documents for the user to start working on their particular version.

```
User:
Please create new release. Call it v1.1.0.

AI Agent:
✅ Creating new release: v1.1.0
✅ Created: releases/v1.1.0/01-starting-prompt.md
📝 Please add what you'd like to work on in this release.  You can add anything you want from any of your folders in the .vibedocs.

When you're ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Reading: releases/v1.1.0/01-starting-prompt.md
✅ Generating clarification questions...
✅ Created: releases/v1.1.0/02-questions-and-answers.md
📝 Please respond to the questions inline in that file.

When you're ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Re-reading: releases/v1.1.0/02-questions-and-answers.md
✅ Answers received and processed.
✅ Creating: releases/v1.1.0/03-plan.md
📝 Review the plan and update any tasks or priorities.

When you're ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Checking: releases/v1.1.0/03-plan.md
✅ Generating task breakdown...
✅ Created: releases/v1.1.0/04-tasklist.md
📝 Review and refine the task list for the release.

When you're ready, tell me 'continue'
```

```
User:
continue

AI Agent:
✅ Reading: releases/v1.1.0/04-tasklist.md
✅ Task list is ready to start work.

When you're ready, tell me 'start work'
```

```
User:
start work

AI Agent:
✅ Working... 
✅ Done!

If you are happy with the release, tell me 'close out release'.
```

```
User:
release done.

AI Agent:
✅ Created: releases/v1.1.0/05-release-notes.md
✅ Created: releases/v1.1.0/06-retrospective.md
✅ Done!

🎉 This release is ready to publish.   It was fun working with you!
```

# Create a Reference Documentation
> Reference material can be created on-demand, based on your current code, your current project documentation and external sources (e.g. API guides, design system documentation, etc).  Currently, the agent supports generating six types of reference documents. You can find the full list [here in the PRD](./vibedocs_prd.md#reference-library).

### Create Functional Breakdown Document

```
User:
Can you please generate a functional breakdown of my product.

AI Agent:
✅ Checking discovery documents...
✅ Checking external resources...
✅ Creating: reference/functional-breakdown.md

I've drafted the main functional areas of your system.
Please review and refine as desired.
```

### Create Tech Stack Overview

```
User:
Let’s generate the tech stack documentation for my web app.

AI Agent:
✅ Checking discovery documents...
✅ Checking external resources...
✅ Created: reference/tech-stack.md

I've drafted the main functional areas of your system.
Please review and refine as desired.
```