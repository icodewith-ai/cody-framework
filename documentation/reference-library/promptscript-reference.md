# PromptScript Reference

> Current Version 1.0  
> Last updated on 7/1/2025

PromptScript is a lightweight, human-readable scripting format used in Vibedocs to define structured, step-by-step AI workflows. It combines simple XML-like tags with natural language to guide the assistant through prompt execution, branching logic, conditionals, and iterative refinement — all tied to dynamic project documents.

## Tags

These tags are used inside `prompttemplate.prompt` files to help guide the AI assistant through structured, multi-step workflows that support dynamic document authoring. Each tag may include attributes that determine flow control, prompt branching, or looping logic.

| Tag                    | Attributes                                      | Description                                                                                         | Sample Usage                                                  |
|------------------------|--------------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| `<prompttemplate>`     | `id` – Unique ID for the prompt template         | Wraps the entire prompt logic for a single document’s workflow.                                     | `<prompttemplate id="starting-prompt-prompt-workflow">`       |
| `<prompt>`             | `id` – Unique ID for prompt                      | Represents a single prompt in the workflow.                                                         | `<prompt id="analyzeStartingPrompt"> ... </prompt>`           |
| `<if>`                 | `condition` – Condition to evaluate              | Conditionally executes the block if the expression is true. Supports `<else>` and `<elseif condition="">`.       | `<if condition="{{sourceDocument}} does not exist"> ... </if>`|
| `<nextprompt />`       | `prompt` – The ID of the next prompt to call     | Moves execution to the next prompt in the sequence.                                                  | `<nextprompt prompt="analyzeStartingPrompt" />`               |
| `<dountil>`            | `condition` – Condition that ends the loop       | Repeats the inner block until a user-defined condition is met.                                      | `<dountil condition="user types continue"> ... </dountil>`    |
| `<nextworkflowstep />` | *None*                                           | Signals that the current document's workflow is complete and the assistant should move to the next document. | `<nextworkflowstep />`                                       |

---

## Reserved Keywords

These keywords act as special signals to the AI agent. They are not replaced by values. Instead, they signal roles, audiences, or responsibilities to the AI agent (e.g., who is taking action or being addressed).  Keywords are UPPERCASE and enclosed by **.

| Keyword      | Definition                                                                 | Example Usage                                                       |
|--------------|---------------------------------------------------------------------------|----------------------------------------------------------------------|
| `**USER**`     | Represents the human using the AI assistant. This is who the AI is helping. | Ask the **USER** to review the document and signal when they’re done. |
| `**ASSISTANT**` | Represents the AI itself, responsible for reading, analyzing, and writing. | Tell the **ASSISTANT** to enhance the prompt and rewrite the document. |

---

## Placeholder Values

These placeholders are dynamically replaced at runtime with values that can come from various sources, including `workflow.json`, additional files in the `.vibedocs` directory, external documentation sources, or third-party systems. This allows PromptScript to stay flexible and context-aware across local and connected environments.

| Placeholder             | Description                                                                  | Source Location                            | Example Usage                                                            |
|-------------------------|------------------------------------------------------------------------------|---------------------------------------------|---------------------------------------------------------------------------|
| `{{documents.name}}`    | Refers to a named markdown file the assistant should read from or write to. | `workflow.json` → `documents.{name}`        | Please read {{documents.qAndA}} and suggest improvements.                |
| `{{templates.name}}`    | Refers to a named markdown file to use as a starting template.               | `workflow.json` → `templates.{name}`        | Create {{documents.qAndA}} using {{templates.qAndA}}.                    |

---

## Document `workflow.json` File

The `workflow.json` file defines the logic, structure, and relationships for each document in a Vibedocs workflow. It tells the assistant what the current step is, where to find or create relevant documents and templates, what prompt script to use, and how this step connects to the rest of the system. It supports named references for documents and templates, enabling reusable and flexible AI-driven authoring.

```json
{
  "title": "Questions and Answers Dialog with AI",
  "description": "This step clarifies project details through a structured Q&A with the user.",
  "documentTemplate": "project-template/discovery/02-questions-and-answers/questions-and-answers.md",
  "promptTemplate": "project-template/discovery/02-questions-and-answers/prompt-template.prompt",
  "workflow": {
    "previous": "project-template/discovery/01-starting-prompt/starting-prompt.md",
    "next": "project-template/discovery/03-prd/prd.md"
  },
  "templates": {
    "qAndA": "project-template/discovery/02-questions-and-answers/questions-and-answers.md"
  },
  "documents": {
    "startingPrompt": ".vibedocs/discovery/01-starting-prompt.md",
    "qAndA": ".vibedocs/discovery/02-questions-and-answers.md"
  }
}
```

| Attribute                  | Description                                                                                               | Example Value                                                                 |
|---------------------------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| `title`                   | Title for the current workflow step.                                                       | `"Questions and Answers Dialog with AI"`                                       |
| `description`             | A short explanation of what this workflow step accomplishes.                                                       | `"This step clarifies project details through a structured Q&A with the user."`|
| `documentTemplate`        | Path to where this template is located.                               | `"project-template/discovery/02-questions-and-answers/questions-and-answers.md"`|
| `promptTemplate`          | Path to the PromptScript file that drives the interaction logic.                                          | `"project-template/discovery/02-questions-and-answers/prompt-template.prompt"` |
| `workflow.previous`       | The path to the previous step’s document template (or `"none"` if this is the first step).                | `"project-template/discovery/01-starting-prompt/starting-prompt.md"`          |
| `workflow.next`           | The path to the next step’s document template (or `"none"` if this is the last step)                                                            | `"project-template/discovery/03-prd/prd.md"`                                   |
| `templates.{name}`        | A list of named document templates, which can be used to initialize documents.                             | `"qAndA": "project-template/discovery/02-questions-and-answers/questions-and-answers.md"` |
| `documents.{name}`        | A list of named markdown files used during the workflow step.                                              | `"qAndA": ".vibedocs/discovery/02-questions-and-answers.md"`                  |

## Example Template

```html
<prompttemplate id="starting-prompt-workflow">

    <prompt id="verifyOrCreateDocumentExistence">
        <if condition="{{sourceDocument}} does not exist">
            Please create {{sourceDocument}} and tell the **USER** where they can 
            find it.
        </if>
        <nextprompt prompt="tellUserToAddStartingPrompt" />
    </prompt>

    <prompt id="tellUserToAddStartingPrompt">
        Ask the **USER** to write their starting prompt inside the {{sourceDocument}}.
        When the **USER** signals they are done, continue to <nextprompt prompt="analyzeStartingPrompt" />
    </prompt>

    <prompt id="analyzeStartingPrompt">
        Tell the **USER** you are going to analyze their prompt and enhance it. Then do the following:

        <dountil condition="user types continue or something similar that states they are satisfied with the updates">
            Please read the {{sourceDocument}}, analyze it, enhance it, add more details to it and 
            write the updates back to the {{sourceDocument}}.

            Then ask the **USER** to review those updates and either accept them as is or if they updated the 
            documents, they should tell you so, that way, you can re-analyze them.
        </dountil>
    </prompt>

    <nextworkflowstep />

</prompttemplate>
```