# Markdowh - short intro

- www.markdownguide.org
- en.wikipedia.org/wiki/Markdown

- preview vscode/vscodium
  - windows
  - ctrl+shift+v
  - mac
    - cmd+shift+v

## headers

# level 1

## level 2

### level 3

#### level 4

##### level 5

###### level 6

## text formatting

Some text _this is italic_ and **this is bold**

`code`

Two spaces at the end of line makes line break (empty line works the same)

## lists

- item 1
- item 2
  - subitem

## numbered lists

1. item 1
2. item 2

<div style="page-break-after:always;"></div>

## blockquoting

> this is the first level  
> more text
>
> > this is the nested quote
> >
> > > nested of nested

> # **function(a,b)**
>
> _description of the function_
>
> > parameter
> >
> > - a=value
> > - b=value
> >
> > return
> >
> > - sum of a and b

## code snippets

### terminal or shell

```shell
> node -v
```

### javascript

```js
const number = 12;
if (number > 10) {
  console.log("Winner!");
}
```

### json

```json
{
  "firstname": "Mike",
  "age": 25
}
```

<div style="page-break-after:always;"></div>

### html

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <h1>title</h1>
    <h2>some text</h2>
  </body>
</html>
```

### css

```css
h1 {
  color: green;
}
```

## tables

| header1 | header2 | header3 |
| :------ | ------: | :-----: |
| data1   |   data2 |  data3  |

| alignment |  tag  |
| --------- | :---: |
| left      | :---  |
| right     | ---:  |
| center    | :---: |
