# Intro

## Storing data

- memory
  - memory will be cleaned on every boot/programm start
- disk
  - for persistance

## disk storage

    - binary  file
        - data in binary format
        - images
        - audio
        - video
        - compiled programs

### bits 0 and 1

- 1 bit can represent 2 states: 0 or 1
- with 2 bits you have 4 states: 00, 01, 10, 11
- 3 bits - 8 states (2ˆ3)
  binary system in base 2 positional system

- octodecimal system use 3 bits
  421

  - 000 = 0 => 0\*4+0\*2+0\*1 => 0\*2ˆ2+0\*2ˆ1+0\*2ˆ0
  - 001 = 1
  - 010 = 2
  - 011 = 3 => 0\*4+1\*2+1\*1 => 0+2+1=3
  - 100 = 4
  - 101 = 5
  - 110 = 6
  - 111 = 7

- plain text file

### text file containing "unstructured" free text

```
Matt River
2024

Memo

This year 2024 was great start in the development of GTX series. This new product was made by Vera River who also was attending the launch...
```

```
Memo

This year 2024 was great start in the development of GTX series. This new product was made by Vera River who also was attending the launch...

Matt River
2024
```

Problem: hard to process programmatically

```
made by MAtt River
year 2024

Memo
This year 2024 was great start in the development of GTX series. This new product was made by Vera River who also was attending the launch...
```

Better, but still not good

Solution: structured text format

### XML

```xml
<document>
    <writer>
        <firstname>Matt</firstname>
        <lastname>River</lastname>
    </writer>
    <year>2024</year>
    <title>Memo</title>
    <text>
        This year 2024 was great start in the development of GTX series. This new product was made by Vera River who also was attending the launch...
    </text>
</document>

```

### JSON

```json
{
  "writer": {
    "firstname": "Matt",
    "lastname": "River"
  },
  "year": 2024,
  "title": "Memo",
  "text": [
    "This year 2024 was great start in the development",
    "of GTX series. This new product was made by",
    "Vera River who also was attending the launch..."
  ]
}
```

### structured text files

- xml (www.w3.org)
- json (www.json.org)
- csv/tsv (Comma Separated Value/Tab Separated Value)
  - nice format for transfering tabular data between spreadsheet and your programm.
- ini
- html/css (https://html.spec.whatwg.org/multipage)
- markdown
- svg (for images, xml files)

### Examples

#### XML

```xml
<?xml version="1.1" encoding="UTF-8">
<persons>
  <person>
    <firstname>Matt</firstname>
    <lastname>River</lastname>
    <age>28</age>
  </person>
    <person>
    <firstname>Vera</firstname>
    <lastname>River</lastname>
    <age>27</age>
  </person>
</persons>
```

#### JSON

```json
[
  {
    "firstname": "Matt",
    "lastname": "River",
    "age": 28
  },
  {
    "firstname": "Vera",
    "lastname": "River",
    "age": 27
  }
]
```

#### csv

```csv
firstname,lastname,age
Matt,River,28
Vera,River,27
```

```csv
"firstname","lastname","age"
"Matt","River, Jr","28"
"Vera","River","27"
```

#### ini

```ini
;this is a comment in ini file
[database]
driver=mysql
host=localhost
port=3306
database=personbd
[user]
username=zeke
```

#### html

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

#### css

```css
h1 {
  color: green;
}
```

#### svg

<svg width="200" height="200">
  <rect x="2" y="2" width="196" height="196" fill="lime" stroke-width="4" stroke="pink" />
  <circle cx="100" cy="100" r="75" fill="orange" />
</svg>
