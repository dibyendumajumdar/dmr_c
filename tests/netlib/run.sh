sh runtests.sh -O1 > got1
sh runtests.sh > got0
echo "expect vs got1"
diff expect got1 
echo "expect vs got0"
diff expect got0
