# Vibedocs

Vibedocs brings structure and repeatability to the unstructured world of vibe coding by guiding users from vague ideas to well-defined, versioned feature implementations. It guides users from the initial idea through discovery, PRD creation, feature planning, task breakdown, and final implementation.

## Problem Statement

Vibe coding has revolutionized how solo developers and creators brainstorm, prototype, and build MVPs, proof-of-concepts or even full products using AI. It enables rapid iteration, experimentation, and idea validation—all without the overhead of traditional development workflows.

But this speed comes at a cost.

Most vibe coders leap directly from idea to implementation, using AI to generate code without first clarifying goals, defining scope, or documenting intent. The result is often fragmented output, inconsistent structure, and products that are hard to maintain, improve, or scale.

What's missing is a lightweight yet structured process that complements the spontaneity of vibe coding. A system that channels creative energy into organized artifacts—like PRDs, feature plans, and task breakdowns—so AI can generate more meaningful, coherent, and context-aware outputs.

## Who is it For?

Vibedocs is designed specifically for **solo creators**—especially those practicing vibe coding, where rapid ideation and prompt-based development are central. It's optimized for:

- One-person workflows
- Exploratory coding sessions
- Fast prototyping with structure

## How is it Accessible?

Vibedocs is available as a **Model Context Protocol (MCP) Server**, enabling seamless IDE integration and interaction with AI tools. It connects with IDEs like Claude Code, Cursor, and Visual Studio Code through MCP connectors, allowing in-context interaction directly inside development environments.

## Powered by PromptScript

Vibedocs is powered by **PromptScript**, a lightweight, human-readable scripting format that defines structured, step-by-step AI workflows, created [by Marcelo Lewin](https://www.bymarcelolewin.com). PromptScript combines simple XML-like tags with natural language to guide AI assistants through prompt execution, branching logic, conditionals, and iterative refinement — all tied to dynamic project documents.

[Learn more about PromptScript](.vibedocs/reference-library/promptscript-reference.md)

## Document Format

All documents are stored in **Markdown format** (`.md`), ensuring:

- Easy reading and editing in any IDE
- Compatibility with Git and other version control systems
- Future-proof formatting for rendering in a web UI or static site generator

## Document Workflows

### Discovery
Documents to help define and formalize the product idea.

| Document                   | Description                                                                      |
| -------------------------- | -------------------------------------------------------------------------------- |
| `01-starting-prompt.md` | Captures the raw, unfiltered idea or initial AI prompt that sparked the project. |
| `02-questions-and-answers.md` | Refines the initial idea through a dialogue with AI, clarifying goals and scope. |
| `03-prd.md` | Formalizes the idea into a Product Requirements Document. Defines what the product should do. |
| `04-plan.md` | Defines how and when the product will be built and delivered. |

### Releases
Detailed documentation for each release of the product.

| Document           | Description                                                        |
| ------------------ | ------------------------------------------------------------------ |
| `01-starting-prompt.md` | Describes the focus and scope of this release. |
| `02-questions-and-answers.md` | Refines the starting prompt through a dialog with AI, clarifying and enhancing the original prompt. |
| `03-plan.md` | Describes, in detail, how to go about implementing this release. |
| `04-tasklist.md` | Lists tasks to be completed for the release. |
| `05-release-notes.md` | Summarizes new features, enhancements, fixes, and changes. |
| `06-retrospective.md` | Records what went well, what could be improved, and key decisions. |

### Reference Library 
Independent documents created on-demand to capture technical knowledge about the product. These are informed by project documentation and other internal or external sources.

| Document           | Description                                                        |
| ------------------ | ------------------------------------------------------------------ |
| `content-management.md` | Outlines how content is structured, authored, reviewed, and published across the product. |
| `css.md` | Documents styling decisions, CSS frameworks used, naming conventions, and reusable patterns  |
| `folder-structure.md` | Describes the organization of the codebase, key directories, and their responsibilities.|
| `functional-breakdown.md` | Breaks the product into its major functional components and user-facing capabilities.|
| `javascript.md` | Covers JavaScript structure, helper functions, libraries used, and coding conventions.|
| `tech-stack.md` | Lists and explains the core technologies used across the frontend, backend, tooling, and infrastructure.|

## Expected Outcomes

By using Vibedocs, solo creators can expect:
- More relevant AI output, thanks to rich context and structured prompts
- Versioned, repeatable releases that can evolve over time
- Faster iteration with reusable planning artifacts like tasklists and PRDs
- Improved handoff and memory — even for solo devs coming back months later
- Better alignment between vision, implementation, and documentation

## License

This project is licensed under a custom license. See the [LICENSE.md](LICENSE.md) file for details.