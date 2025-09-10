---
command: ":cody assets list"
description: Lists all the files stored in the assets folder, along with their known descriptions of what they are used for.
---

# LIST ALL ASSETS

<cf:card headline="List of Assets in the Assets Folder" width="100">

- List all the assets available in the {{cfAssets}} folder.
- Provide any details you know about each asset next to it. 
- Do not provide the information in a table format.  Provide it as follows:

````
Here are your current assets in the {{cfAssets}} folder:

[**AGENT**: Convert filename to full uppercase][filename]
[description]

[**AGENT**: Only show this line if there are multiple files]----------------

[**AGENT**: Convert filename to full uppercase][filename]
[description]
````

</cf:card>