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