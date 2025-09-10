---
name: "box"
description: "Displays a stylized ASCII box with body content."
arguments:
  - name: "body"
    description: "The body content goes between the opening and closing <cf:box> tags."
  - name: "width"
    default: "50"
    description: "The width of the box in characters. If no width is passed, use the default value."
  - name: "type"
    default: "None"
    description: "The type of box, which determines the icon. Can be Alert, Information, or Success."
---

# Display Instructions

- The top and bottom borders of the box must be created with the `=` character, repeated to match the specified **{{width}}**.
- The body content must be enclosed within `|` characters on the left and right.
- There must be one empty line (with borders) for padding above and below the body content.
- If a **type** is provided, display the corresponding emoji at the start of the body line and make sure there is a buffer between the emoji and the line that follows:
  - **Success**: ✅ 
  - **Information**: ℹ️ 
  - **Alert**: ❗️
  - **None**: Do not display an emoji
- The **body content** must be left justified and wrap if needed.
- The remaining space on the right should be filled with spaces to ensure the right border `|` aligns correctly.
- The total width of the box, including borders, should be exactly **{{width}} characters**.
- In the body or any other arguments passed, text inside of double brackets `{{...}}` is a prompt to be executed; replace it with its output. Text outside `{{...}}` should be displayed EXACTLY as written.

# Example

Input:
```xml
<cf:box width="30" type="Success">
{{Say Completed in Spanish}}
Translation completed!
</cf:box>
```

Output:
```
==============================
|                            |
| ✅ Completo!               |
| Translation Complete       |
|                            |
==============================
```
