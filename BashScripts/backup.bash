#!/bin/bash
# Create a backup for directory <argument> in file "tmp/backup_2022-01-27.tar.gz"
#
#

root=(echo $PWD)
printf "\\n" "this is root" "$root" "\\n"

dir="$pwd/$1" 		# 1st argument is the directory to be copied
backupfile="tmp/backup_2022-01-25.tar.gz"

function usage
{
	local txt=(
		"Usage: backup.bash [OPTION] [argument]"
		"Copy a file/directory into a foretold file."
		""
		"Options:"
		"--help, -h		Print help."
	)
	Printf "%s\\n" "${txt[@]}"
}

if [ -f "$dir" ]; then
	if [ -f "$backupfile" ];  then
		echo "$backupfile exists"
	else
		touch "$root/$backupfile"
	fi

	cp -r "$dir" "$backupfile"

else
	echo "$dir doesn't exist"
fi 

## Print tips on how to use this script.

while (($#))
do
	case "$1" in
		--help | -h)
			usage
			exit 0
		;;
	esac
done 


