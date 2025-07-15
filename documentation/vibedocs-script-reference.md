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

---

## Supported Tags

### `<prompt id="..."> ... </prompt>`
Defines a block of logic or interaction. Each prompt has a unique `id`.

### `<nextprompt id="..."/>`
Jumps to another prompt block by `id` within the same file.

### `<nextstep />`
Moves execution to the next `.prompt` file defined in the current workflow step list.

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

Vibedocs Script supports placeholders that pull from your configuration files (`workflow.json` and `documents.json`).

| Placeholder                     | Description                                               |
|---------------------------------|-----------------------------------------------------------|
| `{{documents.aliasname}}`       | Resolves to a document's metadata and path by alias name  |
| `{{documents.alias.friendlyName}}` | Inserts the friendly display name for a document           |
| `{{documents.alias.phase}}`         | Inserts the workflow phase (folder or stage)               |

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

