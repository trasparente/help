# help
Kind of snippetrosh

Todo
- login
- themes

CSS
- themes: LaTex

Keywords reserved
- code
- comment
- link/links
- todo

### Assets

**Coffeescript**

- `assets/script.coffee`

Include files in `_includes/js/`, no need for front matter.

```liquid
---
---
{% include js/storage.coffee %}
```

**Sass**

- `assets/style.sass` needs front matter.

Import files in `_sass`, no need for front matter.

```sass
---
---
@import "serif"
```

### Data hierarchy (Kind of help)

```yml
- level_0: command
- level_1, level_1_a: command
- level_1, level_1_b: command
- level_2, level_2_1, level 2_1_a: command
- level_2, level_2_1, level 2_1_b: command
- level_2, level_2_2, level 2_2_a: command
- level_2, level_2_2, level 2_2_b: command
```
