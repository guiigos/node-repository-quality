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

<details>
  <summary>
    <strong>:heavy_check_mark: Prettier</strong>
  </summary>
  <br>

[**Documentation**](https://prettier.io/)

```bash
$ npm install --save-dev prettier
```

Tool that complements the formatting of codes, being opinionated. It supports several different languages ​​and can automate code formatting automatically when saving. The main settings we use are the validation of quotation marks, number of characters per line and other settings that it makes available.

[`.prettierrc`](/.prettierrc)

```json
{
  "semi": true,
  "singleQuote": true,
  "trailingComma": "es5",
  "printWidth": 100
}
```

</details>

<details>
  <summary>
    <strong>:heavy_check_mark: ESLint</strong>
  </summary>
  <br>

[**Documentation**](https://eslint.org/)

It is a code analysis tool, to identify patterns that do not match the styleguide being used. It is complemented with the previous configurations, allowing the creation of rules related to coding.

```bash
$ npm install --save-dev eslint-plugin-prettier
$ npm install --save-dev eslint-config-prettier
$ npx eslint --init
```

- **How would you like to use ESLint?** - _`To check syntax, find problems, and enforce code style`_
- **What type of modules does your project use?** - _`JavaScript modules`_
- **Which framework does your project use?** - _`None of these`_
- **Does your project use TypeScript?** - _`No`_
- **Where does your code run?** - _`Node`_
- **How would you like to define a style for your project?** - _`Use a popular style guide`_
- **Which style guide do you want to follow?** - _`Airbnb`_
- **What format do you want your config file to be in?** - _`JSON`_
- **Would you like to install them now with npm?** - _`Yes`_

[`.eslintrc`](/.eslintrc)

```json
{
  "env": {
    "es2021": true,
    "node": true
  },
  "extends": ["airbnb-base", "prettier"],
  "parserOptions": {
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "plugins": ["prettier"],
  "rules": {
    "prettier/prettier": ["error"]
  }
}
```

[`package.json`](/package.json)

```json
"scripts": {
  "test:lint": "eslint src --ext .js",
  "test:lint:fix": "npm run test:lint -- --fix"
}
```

</details>

<details>
  <summary>
    <strong>:heavy_check_mark: LintStaged</strong>
  </summary>
  <br>

[**Documentation**](https://github.com/okonet/lint-staged)

Tool that runs commands for code lint only on files that will be added at commit. It makes it easy to test only files that are being worked on. This tool must be installed together with a git hook command tool.

```bash
$ npm install --save-dev husky
$ npm install --save-dev lint-staged
```

[`.huskyrc`](/.huskyrc)

```json
{
  "hooks": {
    "pre-commit": "lint-staged --quiet --allow-empty --no-stash"
  }
}
```

[`package.json`](/package.json)

```json
"lint-staged": {
  "src/**/*.js": [
    "eslint --fix",
    "prettier --write"
  ]
}
```

</details>

<details>
  <summary>
    <strong>:heavy_check_mark: CommitLint</strong>
  </summary>
  <br>

[**Documentation**](https://commitlint.js.org/)

```bash
$ npm install --save-dev @commitlint/{config-conventional,cli}
```

The standardization of commits messages is important to maintain a consistent view of the changes made, avoiding messages with little information and without content.

[`.commitlintrc`](/.commitlintrc)

```json
{
  "extends": ["@commitlint/config-conventional"]
}
```

[`.huskyrc`](/.huskyrc)

```json
{
  "hooks": {
    "commit-msg": "commitlint --env HUSKY_GIT_PARAMS"
  }
}
```

</details>

<details>
  <summary>
    <strong>:heavy_check_mark: Commitizen</strong>
  </summary>
  <br>

[**Documentation**](http://commitizen.github.io/cz-cli/)

```bash
$ npm install --save-dev commitizen
$ npm install --save-dev cz-conventional-changelog
```

Tool that makes it easy to write commit messages following the informed pattern. It is presented in the form of a command prompt, requesting the information that composes the message.

[`package.json`](/package.json)

```json
"scripts": {
  "commit": "cz"
},
"config": {
  "commitizen": {
    "path": "cz-conventional-changelog"
  }
}
```

</details>

<details>
  <summary>
    <strong>:heavy_check_mark: SemanticRelease</strong>
  </summary>
  <br>

[**Documentation**](https://semantic-release.gitbook.io/semantic-release/)

```bash
$ npm i --save-dev @semantic-release/{npm,git,github,changelog,commit-analyzer,release-notes-generator}
```

Fully automated version package generator, adding version according to [semver](https://semver.org/). It also generates the application changelog based on the commits made in the current version. Facilitates the process of creating a new application distribution. There are several configurations that can be used in this tool, the simplest ones are applied to this repository.

[`.releaserc`](./.releaserc)

```json
{
  "plugins": [
    "@semantic-release/github",
    "@semantic-release/changelog",
    "@semantic-release/commit-analyzer",
    "@semantic-release/release-notes-generator",
    [
      "@semantic-release/npm",
      {
        "npmPublish": false
      }
    ],
    [
      "@semantic-release/git",
      {
        "assets": [
          "package.json",
          "CHANGELOG.md"
        ],
        "message": "chore(release): ${nextRelease.version} [skip ci]"
      }
    ]
  ],
  "branches": [
    "main"
  ]
}
```

[`Makefile`](./Makefile)

```mk
include .env

release:
	GITHUB_TOKEN=${GH_TOKEN} npx semantic-release --no-ci
```

[`package.json`](./package.json)

```json
"scripts": {
  "release": "make release"
}
```

</details>
<br>

## Scripts

```bash
# Perform lint validation
$ npm run test:lint

# Perform lint validation by correcting errors
$ npm run test:lint:fix

# Commit command prompt
$ npm run commit

# Create new release
$ npm run release
```

## License

Project developed for academic purposes.

[![License: MIT](https://img.shields.io/github/license/guiigos/node-repository-quality?color=black)](./LICENSE)
