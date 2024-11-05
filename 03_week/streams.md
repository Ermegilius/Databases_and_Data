# redirecting inputs and outputs

## redirect output to a file

```shell
$ ls >textfile.txt
```

```shell
$ history >hist.txt
```

## redirect input from a file

```shell
$ myProgram <textfile.txt
```

## run script

```shell
mysql -u root -p <createStatement.sql
```

```shell
mysql -u root -p <"/home/longPath/subfolder/createStatement.sql"
```
