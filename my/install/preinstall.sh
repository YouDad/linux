OS=`lsb_release -i | cut -d : -f 2 | cut -f 2`

function check_retval() {
	if [[ $? != 0 ]]; then
		echo "ins: $1 failed"
		exit $?
	fi
}

function need_dir() {
	dir_name=$1
	if [ ! -d $dir_name ]; then
		mkdir $dir_name
		check_retval "need dir: $dir_name"
	fi
}

function check_dir() {
	dir_name=$1
	if [ -d $dir_name ]; then
		echo "already exist dir: $dir_name"
		exit 1
	fi
}

