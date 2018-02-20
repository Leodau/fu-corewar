#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function test
{
    if [ $2 -eq 0 ]
    then
	./asm_ref $3.s &> err.out
	mv $3.cor "$3"2.cor
    fi
    $1 $3.s &> err.out
    status=$?
    if [ $2 -eq 0 ]
    then
	diff $3.cor "$3"2.cor
    fi
    if [ $status -eq $2 ]
    then
	echo -e "${GREEN}OK${NC}"
    else
	echo -e "${RED}KO${NC}"
    fi
}

test $1 0 "header"
test $1 0 "good_header1"
test $1 0 "good_header2"
test $1 0 "good_header3"
test $1 84 "bad_header1"
test $1 84 "bad_header2"
test $1 84 "bad_header3"
test $1 84 "bad_header4"
test $1 84 "bad_header5"
