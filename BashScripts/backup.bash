#!/bin/bash
# Create a backup for directory <argument> in file "tmp/backup_2022-01-27.tar.gz"
# Viktor Stranne, vs222my
#

root=($PWD)
dir=($1)			# 1st argument is the path to the directory to be copied
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

if [ -d "$dir" ]; then
	if [ -f "$root/$backupfile" ];  then
		echo "$backupfile exists"
	else
		touch "$root/$backupfile"
		printf "%s\\n" "Creating backup file..."
	fi

	cp -r "$dir" "$backupfile"
	exit 0

else
	echo "'$dir' is not a directory/doesn't exist."
	exit 1
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
