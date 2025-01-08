---
tags:
    - markdown
---

# Personal Markdown Cheat Sheet

uTable of Contents

- [Personal Markdown Cheat Sheet](#personal-markdown-cheat-sheet)
  - [cheat sheets](#cheat-sheets)
  - [Nested Cite \& Syntax Highlight Code](#nested-cite--syntax-highlight-code)
  - [Leave Blank lines between text](#leave-blank-lines-between-text)
  - [Create line separated paragraphs](#create-line-separated-paragraphs)

## cheat sheets

markdown cheat sheet:
https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

r markdown cookbook:
https://bookdown.org/yihui/rmarkdown-cookbook

$~$

## Nested Cite & Syntax Highlight Code

Always use one tick more if you want escape to the next level ([source](https://weblog.west-wind.com/posts/2022/Feb/16/Escaping-Markdown-Code-Snippets-and-Inline-Code-as-Markdown))

`````markdown
````markdown
```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```
````
`````

$~$

## Leave Blank lines between text

workaround using markdown math environment (supported by most interpreters) ([source](https://stackoverflow.com/a/60876153))

use following as empty line: `$~$`

## Create line separated paragraphs

Code:
```tex
$~$
-
$~$
```
