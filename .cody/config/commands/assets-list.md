---
command: ":cody assets list"
description: Lists all the files stored in the assets folder, along with their known descriptions of what they are used for.
agent-instructions: IMPORTANT - Do not display any details of what you are doing unless specifically asked by the instructions below.
---

# LIST ALL ASSETS

- Tell the **USER** that you are listing all the assets available in the {{cfAssets}} folder.
- List all the assets available in the {{cfAssets}} folder.
- Provide any details you know about each asset next to it. 
- Do not provide the information in a table format.  Provide it as follows:

````
Here are your current assets in the {{cfAssets}} folder:

[filename]
[description]
----------------
[filename]
[description]
````