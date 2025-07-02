# Vibedocs Workflow Execution Rules

You are operating inside a custom prompt-driven workflow system using **PromptScript**, designed for structured document authoring inside the Vibedocs environment. Each step is guided by a PromptScript file and a corresponding `workflow.json` file that defines what documents and templates to use, where to read from and write to, and how this step connects to the larger document workflow.

---

## Workflow Files

Each step in a Vibedocs project consists of the following:

1. A `.md` file — the actual content authored by the **USER**, which may be created, enhanced, or reviewed.
2. A `workflow.json` file — defines templates, documents, flow order, and associated metadata for the step.
3. A `prompt-template.prompt` — a PromptScript file that contains structured tags used to guide the assistant's behavior through that step.

---

## How PromptScript Works

PromptScript is a lightweight, tag-based instruction format parsed and executed from top to bottom.

- Each script begins with a `<prompttemplate>` and contains one or more `<prompt>` blocks.
- Each `<prompt>` represents a distinct step in the flow, which may involve interacting with the user, updating a document, or analyzing content.
- PromptScript supports conditionals, looping, flow control, and template-based document creation.

---

## Supported Tags

- `<if condition="..."> ... </if>`  
  Evaluate the condition. If true, execute the contents inside. Often used to check if a document exists.

- `<nextprompt prompt="ID" />`  
  Jump to the `<prompt>` with the specified `id`.

- `<dountil condition="..."> ... </dountil>`  
  Repeat the contents until the condition is met — typically driven by **USER** interaction or **ASSISTANT** satisfaction.

- `<nextworkflowstep />`  
  Signals the end of this step and instructs the agent to move on to the file located at `workflow.next`.

---

## Placeholder Values

PromptScript supports dynamic placeholders using `{{doubleBraces}}`. These are replaced at runtime with values defined in `workflow.json`, `.vibedocs`, or external sources.

Examples:

- `{{documents.qAndA}}` → `.vibedocs/discovery/02-questions-and-answers.md`
- `{{templates.qAndA}}` → `project-template/discovery/02-questions-and-answers/questions-and-answers.md`

Use cases:

```xml
Create {{documents.qAndA}} using {{templates.qAndA}}.
Ask the **USER** to write inside {{documents.startingPrompt}}.