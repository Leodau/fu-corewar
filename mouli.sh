# test 1
$1 header2.s
diff header.cor header2.cor
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "KO"
fi
