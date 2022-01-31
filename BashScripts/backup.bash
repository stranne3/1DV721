#!/bin/bash
# Create a backup for directory <argument> in file "/tmp/backup_2022-01-27.tar.gz"
# Viktor Stranne, vs222my
# 

start="$date +%s"
root="/c/Users/vikto/courses/systemadministration/bashscripts/tmp"
dir=($1)			# 1st argument is the path to the directory to be copied


function usage
{
	local txt=(
		"Usage: backup.bash [OPTION] [argument]"
		"Copy a file/directory into a foretold file."
		"Argument must be a complete path to directory or file."
		""
		"Options:"
		"--help, -h		Print help."
	)
	Printf "%s\\n" "${txt[@]}"
}

if [ -d "$dir" ]; then


	timestamp=$(date +"%Y%d%m_%H:%M:%S")
	filename=$(basename $1)
	backupfile=$filename"_"$timestamp".tar.gz"

	####echo "backupfile:::" "$backupfile"
	touch "$root/$backupfile"

	cp -r "$dir" "$backupfile"


else
	echo "'$dir' is not a directory/doesn't exist."
	end="$date+%s"
	runtime="$((end-start))"
	echo "$runtime"
		
	exit 1
fi 



## Print tips on how to use this script.

while (($#))
do
	if [ -d "$dir" ]; then
		end="$date+%s"
		runtime="$((end-start))"
		echo "$runtime"
		exit 0
	fi

	case "$1" in
		--help | -h)
			usage
			end="$date+%s"
			runtime="$((end-start))"
			echo "$runtime"
			exit 0
		;;

	esac
done 