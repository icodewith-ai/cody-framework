---
command: ":cody assets list"
description: Lists all the files stored in the assets folder, along with their known descriptions of what they are used for.
---

# LIST ALL ASSETS

<cf:card headline="{{File Emoji}} List of Assets in the Assets Folder" width="100">
{{
[**AGENT**: DO NOT DISPLAY ANY OF THIS INFORMATION.]
- List all the assets available in the `{{cfAssets}}` folder.
- Provide any details you know about each asset next to it. 
- Do not provide the information in a table format.
}}

Here are your current assets in the `{{cfAssets}}` folder:

{{
Display all files with descriptions in the following format.  Separate new files with "---------"

Convert filename to full uppercase [filename]
[description]
}}
</cf:card>