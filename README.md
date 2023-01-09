# Linux Shell Scripting Learning
## First Try
in maiden.sh:

```
#! /bin/bash   #specify interpreter
echo "hello shell scripting"
```

```
chmod +x maiden.sh
./maiden.sh
>>>
    hello shell scripting
```

********

## Shell Key Word

in key_word.sh

```
#!/bin/bash 

echo "Hello Shell"

# read variable
read VAR
echo "VAR is $VAR"

# expr : expression evaluating
expr $VAR - 5

# testing string
if   test "Hello"="HelloWorld"
then echo "True"
else echo "False"
fi   

if test "Hello"!="HelloWorld"
then echo "True"
else echo "False"
fi   

if test -z ""       # string length is zero
then echo "True"
else echo "False"
fi   

if test -n "Hello"  # string length is not zero
then echo "True"
else echo "False"
fi   

# testing variable
if test $VAR -eq 10  # equal
then echo "True"
else echo "False"
fi

if test $VAR -lt 10  # less than
then echo "True"
else echo "False"
fi

if test $VAR -gt 10  # great than
then echo "True"
else echo "False"
fi

if test $VAR -ge 10  # great or equal
then echo "True"
else echo "False"
fi

if test $VAR -le 10  # less or equal
then echo "True"
else echo "False"
fi

# testing file or directory
if test -d ./shell     # dir exist
then echo "True"
else echo "False"
fi

if test -e maiden.sh   # exist
then echo "True"
else echo "False"
fi

if test -r ./shell     # readable
then echo "True"
else echo "False"
fi

if test -w ./shell     # writable
then echo "True"
else echo "False"
fi

if test -x ./shell     # executable
then echo "True"
else echo "False"
fi

# testing with logical expresion
if test -e maiden.sh -a $VAR -eq 10    # and
then echo "True"
else echo "False"
fi

if test -e maiden.sh -o $VAR -eq 10    # or
then echo "True"
else echo "False"
fi

if test !maiden.sh                     # not
then echo "True"
else echo "False"
fi

# execute another shell script and quit shell
exec ./maiden.sh

echo "test" # will not be print because exec command will execute maiden.sh and quit

exit
```

```
./key_word.sh
>>>
    Hello Shell
    10
    VAR is 10
    5
    True
    True
    True
    True
    True
    False
    False
    True
    True
    False
    True
    False
    False
    False
    True
    True
    True
    hello shell scripting
```

**remember that:exec will execute and quit**

*****

## Shell Variables

* **variables defined by user**
* **variables predefined**
* **environment variable**

```
VAR=10 # define, with no blankspace before and after"="
# note that we use uppercase for the name of variable habitually
```

```unset VAR # unset variable, also useful when it is environment variable```

```readonly VAR=10 # set read_only variable```

```export VAR=10 # define environment variable```

```export -p # list all environment variables```

```export -n VAR # unshow VAR in the following env```

### Predefined variables

```$0-9 : command line params, $0 for the name of your script```

```$# : command line params count```

```$@, $* : all command line params```

```$? : returned value of last command```

```$$ : ID of your process```

in vars.sh:
```
#!/bin/bash 

echo "print $"
echo "\$0 = $0"
echo "\$1 = $1"
echo "\${15} = ${15}"
echo "\$# = $#"
echo "\$@ = $@"
echo "\$* = $*"
echo "\$$ = $$"
echo "\$? = $?"
```

```
./vars.sh 1 2 3 4 5 6 a b c d e f g h i j
>>>
    print $
    $0 = ./vars.sh
    $1 = 1
    ${15} = i
    $# = 16
    $@ = 1 2 3 4 5 6 a b c d e f g h i j
    $* = 1 2 3 4 5 6 a b c d e f g h i j
    $$ = 35098
    $? = 0
```

### String

```
name="father"
str="this is a string, I'm your $name"
echo $str
>>>
    this is a string, I'm your father
```

String Length

```
str="yes"
echo ${#str}
>>>
    3
```

Substring

```
str="abcdefg"
echo ${str[1]} # "a" index start with 1
echo ${str:2:3} # "cde", index start with 0, from index 2, 3 chars
>>>
    a
    cde
```

Find Char In String

```
str="abcdef"
expr index $str a
>>>
    1 # index start with 1
```

### Shell Array

```
arr=(1 2 4 5) # space splited
echo $arr
>>>
    1 2 4 5

echo ${arr[1]} ${arr[4]} # index start with 1
>>>
    1 5

arr[1]=6
echo ${arr[1]}
>>>
    6

echo ${arr[@]} # all elements
>>>
    6 2 4 5

echo ${#arr}  # length of array
>>>
    4
```

#### Associated Array (关联数组， 类似于字典)

```
declare -A ascii=(['a']=97 ['b']=98 ['c']=99)
echo ${ascii[b]} # 注意此处没有引号，有教程上说需要引号，但Arch不能用
>>>
    98
```

*******