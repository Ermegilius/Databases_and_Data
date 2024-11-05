# Markdown - short intro

- www.markdownguide.org
- en.wikipedia.org/wiki/Markdown

- preview
    - windows
        -  ctrl + shift + v
    - mac
        - cmd + shift +v

## headers

# level 1
## level 2
### level 3
#### level 4
##### level 5
###### level 6

## text formatting
 Some text *this is in italic* and **this is bold**
 `code`  
 Two spaces at the end of line makes line break

## lists

 -  item 1
 -  item 2
    -   subitem 

## numbered list
1.  item
2.  item

<div style="page-break-after:always;"></div>

## blockquoting
>this is first level  
>more text
>>this is the nested quote
>>>nested of nested

># **function(a,b)**
>description
>>parameters
>>- a=value
>>- b=value 
>>
>>returns
>>
>>- sum on a and b

## code snippets

### terminal or shell
```shell
> node -v
```

### javascript

```js
const number=12;
if(number>10){
    console.log('winner!');
}
```
### json

```json
{
    "firstname":"Mike",
    "age":25
}
```
<div style="page-break-after:always;"></div>

### html

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <h1>title</h1>
</body>
</html>
```

### css

```css
h1{
    color:green;
}
```

## tables

header1|header2|header3
:---|---:|:---:
d1|d2|d3

|alignment   |tag  |
|------------|:---:|
|left        |:--- |
|right       |---: |
|center      |:---:|