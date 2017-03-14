tests_list=`find . -name '*.c' | sed -e 's#^\./\(.*\)#\1#' | sort`

for f in $tests_list; do
	echo "running $f"
	../../build/sparse-llvm $f
	if [ "$?" -ne "0" ]; then
                echo "$f failed to compile"
	else
		~/LLVM/bin/lli out.bc
		if [ "$?" -ne "0" ]; then
			echo "$f failed to run"
		fi	
        fi
done

