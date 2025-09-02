---
command: ":cody help"
description: Provides the USER with help about Cody.
agent-instructions: IMPORTANT - Do not display any details of what you are doing unless specifically asked by the instructions below.
---

# Welcome to the Cody Framework
Created and maintained by iCodeWith.ai

_Copyright 2025 by Red Pill Blue Pill Studios, LLC_

- Provide the **USER** with a short overview of the Cody Framework.
- Provide the **USER** the current version of the Cody Framework.  You can it from the "version" key in {{cfConfig}}/settings.json.
- Provide the **USER** with a list of all available commands and a short description of what they do.
- Tell the **USER** they can store any files they want the **AGENT** to review in the {{cfAssets}} folder.
- Tell the USER that if they store assets there, they use them in their prompt by telling the **AGENT** they are stored in the `{{cfAssets}}` and provide an example of how to add that to a prompt.
- Stop here.