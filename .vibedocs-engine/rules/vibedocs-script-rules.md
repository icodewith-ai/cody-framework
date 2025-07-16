# Vibedocs Script Rules

You are operating inside Vibedocs, a custom prompt-driven workflow system using **Vibedocs Script**, designed for structured document authoring. Vibedocs Script is a lightweight, tag-based instruction format, based on XML, parsed and executed from top to bottom, file to file.

## Basic Rules for Execution

- You must follow the instructions carefully and fully in each `.prompt` file.
- You must accomplish your tasks by using all available tools at your disposal.
- `<prompt> ... </prompt>` represents a distinct step in the template. Each block may involve interacting with the **USER**, updating a document, or analyzing content.
- Templates may contain multiple `<prompt>` blocks. Each block will have an `id`.
- You must stop at the end of each `<prompt>` block and return control to the **USER**, unless you encounter a `<nextprompt id="..." />` or `<nextstep />` tag.
- You support conditionals, looping, flow control, and template-based document creation. See the Supported Tags section below.
- If you encounter a `<nextstep />` tag and there are no more steps remaining in the `workflow.json` file for the current workflow, you must return a message to the **USER** indicating the end of the workflow (e.g., "You've reached the end of the workflow.").

## File Explanations

### `@.vibedocs-engine/config/<workflow-id>/workflow.json`

This workflow configuration file defines the ordered flow of `.prompt` files for a specific phase (e.g., `discovery`, `releases`). You must use this file to determine the order of execution between `.prompt` files, especially when encountering the `<nextstep />` tag. Execute steps top to bottom based on the `"steps"` array.

### `@.vibedocs-engine/config/<workflow-id>/documents.json`

This file provides all document metadata for the current phase. You must use it to resolve any `{{documents.alias}}` placeholders in prompts, including file paths, templates, and user-facing names.

### How the `<workflow id="..." />` Tag Works

At the top of each `.prompt` file (excluding root-level commands), you will find a `<workflow id="..." />` tag. This tag tells you which **workflow folder** to use when resolving both the `workflow.json` and `documents.json` files. The value of the `id` attribute corresponds to the folder name under:

- `@.vibedocs-engine/config/<workflow-id>/`

You must use the `<workflow id="..."/>` value consistently for:

- Resolving `workflow.json` for `<nextstep />` sequencing
- Resolving `documents.json` for `{{documents.alias}}` placeholders

For example:

```xml
<workflow id="discovery" />
```

Tells you to:

- Use `@.vibedocs-engine/config/discovery/workflow.json`
- Use `@.vibedocs-engine/config/discovery/documents.json`

## Reserved Keywords

These keywords act as special signals for you, the **AGENT**. They represent roles or responsibilities. Do not replace these — they are instructions or signals.

| Keyword      | Definition                                                                 | Example Usage                                                       |
|--------------|---------------------------------------------------------------------------|----------------------------------------------------------------------|
| `**USER**`   | The human you're assisting. Your job is to help the **USER**.             | Ask the **USER** to review the document and signal when they’re done. |
| `**AGENT**`  | Refers to you — responsible for reading, analyzing, and writing.          | Tell the **AGENT** to enhance the prompt and rewrite the document.   |

## Placeholder Values

These placeholders are dynamically replaced at runtime with values found in the appropriate `workflow.json` or `documents.json` config files.

| Placeholder                   | Description                                                                  | Source Location | Example Usage |
|-------------------------------|------------------------------------------------------------------------------|------------------|----------------|
| `{{documents.aliasname}}`     | Refers to a named markdown file to use as a starting template.               | `documents.json` → `documents` array | `Create {{documents.qanda}}` will create the associated `document` as defined. |

## Creating Documents

When you create documents using placeholders like `{{documents.aliasname}}`, follow these rules:

- Use `aliasname` to identify which document config to reference.
- Use `template` to determine which template to load and where it’s located.
- Use `document` to know what file to create and where to store it.
- Use `friendlyName` to show a readable name back to the **USER**.

### Example

```xml
<agentinstructions>
    Create {{documents.starting-prompt}}
</agentinstructions>
```

```xml
<agentsay rephrase="true">
    Great! I created the {{documents.starting-prompt.friendlyName}}. 
    Type in your starting prompt in there, save the document and tell me to 'review it' when you 
    are ready for me to enhance it.
</agentsay>
```

## Vibedocs Script Supported Tags

### `<workflow id="..."/>`
Declares which workflow phase this `.prompt` file belongs to. Used to locate the proper `workflow.json` and `documents.json`.

### `<prompt id="..."> ... </prompt>`
Defines a distinct step within a `.prompt` file. Use `id` to name and reference this step.

### `<nextprompt id="..." />`
Jumps to another `<prompt>` within the same file by ID.

### `<nextstep />`
Signals that the current document workflow is complete. You must consult the correct `workflow.json` based on the active `<workflow id="..."/>` value to determine and execute the next step in the `steps` array. If there are no more steps remaining, inform the **USER** that they have reached the end of the workflow.

### `<if condition="..."> ... <elseif> ... <else> ... </if>`
Evaluate the condition and follow appropriate logic blocks.

### `<dountil condition="..."> ... </dountil>`
Repeat the inner block until the condition is satisfied.

### `<agentsay rephrase="false"> ... </agentsay>`
Say the exact content to the **USER**. If `rephrase="true"`, you may paraphrase or reword the message if needed.

### `<agentinstructions> ... </agentinstructions>`
You must follow these instructions precisely. These blocks often contain operational logic (e.g., wait for user input, create documents, etc.).
