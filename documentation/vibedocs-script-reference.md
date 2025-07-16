# Vibedocs Script Reference

**Vibedocs Script** is a lightweight, tag-based scripting language designed for structured document workflows. It is inspired by XML and used to guide AI agents (referred to as **AGENT**) in performing tasks such as prompting users, generating content, managing flow control, and creating documents.

This script is executed top to bottom, block by block, file by file. It powers Vibedocs’ unique prompt-driven system by enabling conditional logic, reusable document templates, and dynamic workflows.

---

## Core Concepts

- **Prompt Files**: Each `.prompt` file contains one or more `<prompt>` blocks that define what the AGENT should do.
- **Tags**: Special XML-like tags tell the AGENT how to interact with the user, process logic, or manage flow.
- **AGENT**: The AI runtime that interprets and executes Vibedocs Script.
- **USER**: The person the AGENT is assisting.
- **Placeholders**: Values like `{{documents.aliasname}}` that get dynamically filled using your configuration files.
- **Workflow Configuration**: Each workflow uses `workflow.json` and `documents.json` files to define execution order and document metadata.

---

## Configuration Files

Vibedocs Script relies on two key configuration files for each workflow:

### `workflow.json`
Defines the ordered flow of `.prompt` files for a specific workflow phase (e.g., `discovery`, `releases`). The AGENT uses this file to determine execution order when encountering `<nextstep />` tags.

### `documents.json`
Provides document metadata for the current workflow phase, including file paths, templates, and user-friendly names. Used to resolve `{{documents.alias}}` placeholders in prompts.

### Workflow Declaration
Each `.prompt` file includes a `<workflow id="..."/>` tag that specifies which workflow folder to use when resolving configuration files from `@.vibedocs-engine/config/<workflow-id>/`.

---

## Supported Tags

### `<workflow id="..."/>`
Declares which workflow phase this `.prompt` file belongs to. Used to locate the proper `workflow.json` and `documents.json` files.

### `<prompt id="..."> ... </prompt>`
Defines a block of logic or interaction. Each prompt has a unique `id`.

### `<nextprompt id="..."/>`
Jumps to another prompt block by `id` within the same file.

### `<nextstep />`
Signals that the current document workflow is complete. The AGENT consults the appropriate `workflow.json` file (based on the active `<workflow id="..."/>` value) to determine and execute the next step in the workflow. If there are no more steps remaining, the AGENT informs the user that they have reached the end of the workflow.

### `<if condition="..."> ... <elseif> ... <else> ... </if>`
Executes conditional logic based on dynamic data or state.

### `<dountil condition="..."> ... </dountil>`
Repeats the inner block until a condition is met.

### `<agentsay rephrase="false"> ... </agentsay>`
Displays a message to the user. If `rephrase="true"`, the AGENT may paraphrase. Otherwise, it must say the message exactly as written.

### `<agentinstructions> ... </agentinstructions>`
Contains non-visible commands for the AGENT to follow. Often used to trigger behavior, wait for input, or create a document.

---

## Reserved Keywords

These uppercase values act as role indicators and should never be replaced:

| Keyword     | Meaning                                |
|-------------|----------------------------------------|
| `**USER**`  | Refers to the human user               |
| `**AGENT**` | Refers to the AI agent executing logic |

---

## Placeholder Values

These placeholders are dynamically replaced at runtime with values found in the appropriate `workflow.json` or `documents.json` config files.

| Placeholder                   | Description                                                                  | Source Location | Example Usage |
|-------------------------------|------------------------------------------------------------------------------|------------------|----------------|
| `{{documents.aliasname}}`     | Refers to a named markdown file to use as a starting template.               | `documents.json` → `documents` array | `Create {{documents.qanda}}` will create the associated `document` as defined. |
| `{{documents.alias.friendlyName}}` | Inserts the friendly display name for a document           | `documents.json` | Used in user-facing messages |

---

## Creating Documents

When creating documents using placeholders like `{{documents.aliasname}}`, the system follows these rules:

- Use `aliasname` to identify which document config to reference.
- Use `template` to determine which template to load and where it's located.
- Use `document` to know what file to create and where to store it.
- Use `friendlyName` to show a readable name back to the user.

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

---

## Example Usage

```xml
<prompt id="ask-question">
  <agentsay>
    What kind of product are you building?
  </agentsay>
  <agentinstructions>
    Wait for **USER** to provide a response before continuing.
  </agentinstructions>
  <nextprompt id="review-answer"/>
</prompt>
```

---

## Notes

- Vibedocs Script is designed to be readable, composable, and declarative.
- It allows flexible workflows without hardcoding behavior into the AI logic.
- While similar to XML, it is purpose-built for prompt-driven systems.

