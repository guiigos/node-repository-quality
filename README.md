# Node Code Quality

![Version](https://img.shields.io/github/package-json/v/guiigos/node-repository-quality)
![Last Commit](https://img.shields.io/github/last-commit/guiigos/node-repository-quality)
[![Conventional Commits][conventional-commits-image]][conventional-commits-url]

[conventional-commits-image]: https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow
[conventional-commits-url]: https://conventionalcommits.org

## Overview

Maintaining the organization and code standards is one of the biggest challenges in programming, each developer learned to program in a different way, having different customs and tools. To perform a repository control in order to standardize the way the code is written there are tools and rules, which are configured in this example project according to my personal use.

<br>
<details>
  <summary>
    <strong>:heavy_check_mark: VSCode</strong>
  </summary>
  <br>

[`extensions.json`](/.vscode/extensions.json)<br>
[`settings.json`](/.vscode/settings.json)<br>

One of the most used editors today, it allows the automation of the code quality structure, facilitating the processes defined with the tool's plugins. For the settings to work correctly, all the plugins requested below must be installed.

- [**EditorConfig**](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [**Prettier**](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [**ESLint**](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

</details>

<details>
  <summary>
    <strong>:heavy_check_mark: EditorConfig</strong>
  </summary>
  <br>

[**Documentation**](https://editorconfig.org/)

Tool that standardizes settings between code editors, helping to maintain the standard among developers working with different editors. It basically consists of the standardization of spacing of code identification, coding of files, other standards that may differ among editors.

[`.editorconfig`](/.editorconfig)

```yml
root = true

[*]
charset = utf-8
end_of_line = lf
indent_size = 2
indent_style = space
insert_final_newline = true
trim_trailing_whitespace = true

[*.md]
trim_trailing_whitespace = false

[{Makefile,**.mk}]
indent_style = tab
```

</details>
<br>

## Scripts

```bash

```

## License

Project developed for academic purposes.

[![License: MIT](https://img.shields.io/github/license/guiigos/node-repository-quality?color=black)](./LICENSE)
