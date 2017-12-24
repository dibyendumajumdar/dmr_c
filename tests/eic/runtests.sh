opt=$1
tests_list=`find . -name '*.c' | sed -e 's#^\./\(.*\)#\1#' | sort`

for f in $tests_list; do
	echo "running $f"
	sparse-llvm $opt $f 2>/dev/null
	if [ "$?" -ne "0" ]; then
                echo "$f failed to compile"
	else
		lli out.bc
		if [ "$?" -ne "0" ]; then
			echo "$f failed to run"
		fi	
        fi
done

