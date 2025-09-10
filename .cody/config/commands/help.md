---
command: ":cody help"
description: Provides the USER with help about Cody.
---

<cf:card headline="{{Exclamation Mark Emoji}} Welcome!" width="100" >
Cody Spec Driven Development (SDD) Framework
Created and maintained by iCodeWith.ai
(©) 2025 by Red Pill Blue Pill Studios, LLC

{{
- Provide the **USER** with a short overview of the Cody Framework.
- Provide the **USER** the current version of the Cody Framework.  You can it from the "version" key in {{cfConfig}}/settings.json.
}}
</cf:card>


<cf:card headline="{{Question Mark Emoji}} Available Help Commands" width="100">
{{Provide the **USER** with a list of all available commands and a short description of what they do.}}
</cf:card>


<cf:card headline="{{Green Checkmark Emoji}} Storing Images and Assets" width="100">
{{
- Tell the **USER** they can store any files they want the **AGENT** to review in the `{{cfAssets}}` folder.
- Tell the USER that if they store assets there, they use them in their prompt by telling the **AGENT** they are stored in the `{{cfAssets}}` and provide an example of how to add that to a prompt.
}}
</cf:card>

- Stop here.