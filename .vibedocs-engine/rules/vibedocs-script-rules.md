# Vibedocs Script Rules

You are operating inside Vibedocs, a custom prompt-driven workflow system using **Vibedocs Script**, designed for structured document authoring. Vibedocs Script is a lightweight, tag-based instruction format, based on XML, parsed and executed from top to bottom, file to file.

## Basic Rules for Execution

- You must follow the instructions carefully and fully in each `.prompt` file.
- You must accomplish your tasks by using all available tools at your disposal.
- `<prompt> ... </prompt>` represents a distinct step in the template. Each block may involve interacting with the **USER**, updating a document, or analyzing content.
- Templates may contain multiple `<prompt>` blocks. Each block will have an `id`.
- You support conditionals, looping, flow control, and template-based document creation. See the Supported Tags section below.

## File Explanations

### @vibedocs-engine/config/workflow.json
This workflow configuration file defines the overall flow. You must use this file to determine the order of execution between `.prompt` files, especially when encountering the `<nextstep />` tag. Execute steps top to bottom based on the `"steps"` array.

### @vibedocs-engine/config/documents.json
You can use this file to resolve any `{{documents.}}` placeholders in prompts. It also contains all document metadata you need during creation or display.

## Reserved Keywords

These keywords act as special signals for you, the **AGENT**. They represent roles or responsibilities. Do not replace these — they are instructions or signals.

| Keyword      | Definition                                                                 | Example Usage                                                       |
|--------------|---------------------------------------------------------------------------|----------------------------------------------------------------------|
| `**USER**`   | The human you're assisting. Your job is to help the **USER**.             | Ask the **USER** to review the document and signal when they’re done. |
| `**AGENT**`  | Refers to you — responsible for reading, analyzing, and writing.          | Tell the **AGENT** to enhance the prompt and rewrite the document.   |

## Placeholder Values

These placeholders are dynamically replaced at runtime with values found in the `workflow.json` or `documents.json` config files.

| Placeholder                   | Description                                                                  | Source Location | Example Usage |
|-------------------------------|------------------------------------------------------------------------------|------------------|----------------|
| `{{documents.aliasname}}`     | Refers to a named markdown file to use as a starting template.               | `documents.json` → `documents` array | `Create {{documents.qanda}}` will create the associated `document` as defined. |

## Creating Documents

When you create documents using placeholders like `{{documents.aliasname}}`, follow these rules:

- Use `aliasname` to identify which document config to reference.
- Use `template` to determine which template to load and where it’s located.
- Use `document` to know what file to create and where to store it.
- Use `documentFolder` to know what folder it belongs to.
- Use `friendlyName` to show a readable name back to the **USER**.

### Example

For the example below, you will:
- Find `starting-prompt` in the `documents.json` array using the `aliasname`.
- Use the `template` to create the document at the `document` path.

```xml
<agentinstructions>
    Create {{documents.starting-prompt}}
</agentinstructions>
```

For this next example, use the `friendlyName` and `documentFolder` fields to render a message to the **USER**:

```xml
<agentsay rephrase="true">
    Great! I created the {{documents.starting-prompt.friendlyName}} in the {{documents.starting-prompt.documentFolder}} folder. 
    Type in your starting prompt in there, save the document and tell me to 'review it' when you 
    are ready for me to enhance it.
</agentsay>
```

## Vibedocs Script Supported Tags

### `<prompt id="..."> ... </prompt>`
Defines a distinct step within a `.prompt` file. Use `id` to name and reference this step.

### `<nextprompt id="..." />`
Jumps to another `<prompt>` within the same file by ID.

### `<nextstep />`
Signals that the current document workflow is complete. You must consult `workflow.json` to determine and execute the next step in the `steps` array.

### `<if condition="..."> ... <elseif> ... <else> ... </if>`
Evaluate the condition and follow appropriate logic blocks.

### `<dountil condition="..."> ... </dountil>`
Repeat the inner block until the condition is satisfied.

### `<agentsay rephrase="false"> ... </agentsay>`
Say the exact content to the **USER**. If `rephrase="true"`, you may paraphrase or reword the message if needed.

### `<agentinstructions> ... </agentinstructions>`
You must follow these instructions precisely. These blocks often contain operational logic (e.g., wait for user input, create documents, etc.).
