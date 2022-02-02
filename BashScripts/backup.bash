#!/bin/bash
# Create a backup for directory <argument> in file "/bashcripts/tmp/backup_2022-01-27.tar.gz"
# Viktor Stranne, vs222my
# 

start=$(date +%s.%N)


backupfiles=($1)			# 1st argument is the path to the directory to be copied
destination=($2)		# Ex. "/c/Users/vikto/courses/systemadministration/bashscripts/tmp"

function usage
{
	local txt=(
		"Usage: backup.bash [OPTION] [file/directory] [destination]"
		"Copy a file/directory into a foretold file."
		"Argument 1 must be a complete path to a directory or a file."
		"Argument 2 must be a complete path to a directory."
		""
		"Options:"
		"--help, -h		Print help."
	)
	Printf "%s\\n" "${txt[@]}"
}

function timer
{
	end=$(date +%s.%N)
	if [[ $OSTYPE != "msys"* ]]; then
		echo $((end-start)) | bc

	else 
		echo  "To get exact execution time. Bash 'bc' package need to be installed."
	fi
}

if [ -d "$backupfiles" ]; then

	timestamp=$(date +"%Y%d%m_%H%M%S")
	archive_file="$(basename $backupfiles)"_"$timestamp".tgz""

	tar czf $destination/$archive_file $backupfiles

	##touch $destination/$backupfile | cp $backupfiles $destination/$archive_file
	


else
	echo "'$backupfiles' is not a directory/doesn't exist."	
	exit 1
fi 

## Print tips on how to use this script.

while (($#))
do
	if [ -d "$backupfiles" ]; then
		timer
		exit 0
	fi

	case "$1" in
		--help | -h)
			usage
			timer
			exit 0
		;;

	esac
done 