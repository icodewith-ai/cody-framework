# Vibedocs Script Rules

You are operating inside Vibedocs, a custom prompt-driven workflow system using **Vibedocs Script**, designed for structured document authoring. Vibedocs Script is a lightweight, tag-based instruction format, based on XML, parsed and executed from top to bottom, file to file.

## Basic rules for execution.

- You will follow the instructions carefully and fully in each .prompt file.
- You will accomplish your tasks by using all the available tools you have access to.
- `<prompt> ... </prompt>` represents a distinct step in the template, which may involve interacting with the user, updating a document, or analyzing content.
- A template may have multiple `<prompt>` blocks.  Each block will be assigned an `id`.
- Vibedocs Script supports conditionals, looping, flow control, and template-based document creation.  See Supported tags below.

## File Explanations

### @vibedocs-engine/config/workflow.json
The workflow configuration file can be used by the **AGENT** to understand the workflow steps between .prompt files and to resolve which step is next when the `<nextstep />` tag is used.  Steps are executed top to bottom, in the `"steps"` array.

### @vibedocs-engine/config/documents.json
The **AGENT** can the documents configuration file to resolve any {{documents.}} calls in prompts (see Placeholder values below)

## Reserved Keywords

These keywords act as special signals to the AI agent. They are not replaced by values. Instead, they signal roles, audiences, or responsibilities to the AI agent (e.g., who is taking action or being addressed).  Keywords are UPPERCASE and enclosed by **.

| Keyword      | Definition                                                                 | Example Usage                                                       |
|--------------|---------------------------------------------------------------------------|----------------------------------------------------------------------|
| `**USER**`     | Represents the human using the AI assistant. This is who the AI is helping. | Ask the **USER** to review the document and signal when they’re done. |
| `**AGENT**` | Represents the AI itself, responsible for reading, analyzing, and writing. | Tell the **AGENT** to enhance the prompt and rewrite the document. |

## Placeholder Values

These placeholders are dynamically replaced at runtime with values that can be found in the @vibedocs-engine/config/workflows.json file.

| Placeholder             | Description                                                                  | Source Location                            | Example Usage                                                            |
|-------------------------|------------------------------------------------------------------------------|---------------------------------------------|---------------------------------------------------------------------------|
| `{{documents.aliasname}}`    | Refers to a named markdown file to use as a starting template.               | `workflow.json` → `documents.{template}` (template to use) `workflow.json` → `documents.{document}` (document to create) `workflow.json` → `documents.{aliasname}` (how to find this document)       | Create {{documents.qanda}} would create the document.name.                    |

## Creating documents
- When an **ANGENT** creates documents using placeholder {{document.}}, look at the @vibedocs-engine/config/documents.json file.
- Look at the `aliasname` to resolve which document to create.
- Look at the `template` to resolve which template to use and where it's located.
- Look at the `document` to resolve which document to create and where to store it.
- Look at the `phase` to see which phase / folder it belongs to.
- Look at the `friendlyName` to see what to use as the friendly name when displaying back to the **USER**.

### Examples

> For the example below, the **AGENT** will look at documents.json, in documents array, for the `aliasname` of `starting-prompt`.  Once you find it, you will use the `template` to create the `document`.
````
        <agentinstructions>
            Create {{documents.starting-prompt}}
        </agentinstructions>
````

> For the example below, the **AGENT** will look at documents.json, in documents array, for the `aliasname` of `starting-prompt`.  Once you find it, you will replace the `friendlyName` and `phase` with the actual values in those attributes and display that to the **USER**

````
        <agentsay rephrase="true">
            Great! I created the {{documents.starting-prompt.friendlyName}} in the {{documents.starting-prompt.phase}} folder. 
            Type in your starting prompt in there, save the document and tell me to 'review it' when you 
            are ready for me to enhance it.
        </agentsay>
````

## Vibedocs Script Supported Tags

### `<prompt id="..."> </prompt>`

Prompts are created using this tag.  The ID represents the name of this prompt that can be used with other tags to jump between prompts in the same template or to other templates.

### `<nextprompt id="" />`  

Moves execution to the next prompt with the given `id` in the same template.

### `<nextstep />`

Signals that the current document's workflow is complete and the **AGENT** should move to the next .prompt file, which can be found in the @vibedocs-engine/workflow.json file.steps array.

### `<if condition="..."> ... <elseif> ... <else> ... </if>`  

Evaluates the condition. Works like any other if statement in any language.

### `<dountil condition="..."> ... </dountil>`

Repeats the inner block until a user-defined condition is met.

### `<agentsay rephrase="false"> ... </agentsays>`

Anything in between the tags, the **AGENT** will say to the **USER**.  If the attribute `rephrase` is set to `true`, the **AGENT** can optinally rephrase what was written.  If it's set to `false` or does not exist, **AGENT** must say it exactly as written.

### `<agentinstructions> ... </agentinstructions>`

These are instructions the **AGENT** must take.  For example, you may want the **AGENT** to stop and wait for the **USER** to repond before continuing. The **AGENT** will tend to tell the user what's it's doing.

### `<execute command="filename" />`

The **AGENT** will read and follow all the rules and commands in this specific prompt template, which is located in `@vibedocs-engine/commands/[command].prompt` The `command` attribute stores the name of the command file, without .prompt extension. 