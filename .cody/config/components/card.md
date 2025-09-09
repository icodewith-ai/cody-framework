---
name: "card"
description: "Displays a stylized ASCII card with a headline and body content."
arguments:
  - name: "headline"
    description: "The main headline text displayed at the top of the card."
  - name: "body"
    description: "The body content goes between the opening and closing <cf:card> tags."
  - name: "width"
    default: "50"
    description: "The width of the card in characters. If no width is passed, use the default value."
---

# Display Instructions

- The card must be enclosed in a rectangular ASCII box made with `+`, `-`, and `|` characters.  
- The total width of the box should be **{{width}} characters** (including borders).  
- The **headline** must be displayed on the first line, **centered horizontally** within the box.  
- Place a horizontal divider line (`-`) between the headline and the body.  
- The **body content** must be **left-justified** inside the box.  
- Wrap text so that no line of body content exceeds the box width (minus the borders).  
- Preserve blank lines and spacing within the body (e.g., `----` should appear as-is, with spacing above and below if given).  
- Always ensure the right border `|` aligns correctly, even if a line is shorter due to wrapping.  
- Add an empty line above and below the body text for padding inside the box.  
- The bottom border of the box must mirror the top border (`+------------------------------------+`).  
- All lines should have a `|` border on the right and left, including the top and bottom (`| +-------------+ |`)

# Example

Input:
```xml
<cf:card headline="The headline here">
This is the body of the card.
It should wrap and stay left aligned.

----

More body content here.
</cf:card>
```

Output:
```
|+----------------------------------+|
|          The headline here         |
|------------------------------------|
|  This is the body of the card.     |
|  It should wrap and stay left      |
|  aligned.                          |
|                                    |
|  ----                              |
|                                    |
|  More body content here.           |
|+----------------------------------+|
```
