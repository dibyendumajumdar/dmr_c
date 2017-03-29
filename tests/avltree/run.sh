sh runtests.sh -O1 > got1
sh runtests.sh > got0
echo "expect vs got1"
diff got1 expect
echo "got1 vs got0"
diff got1 got0
