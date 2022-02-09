#!/bin/bash
#

URL=$1
echo $URL

function usage
{
	local txt=(
		"Usage: large_files.bash [OPTION]/[File-path]"
		"Print info of file declared in [Argument 1]."
		"Argument 1 must be a complete path to a directory or a file."
		""
		"Options:"
		"--help, -h		Print help."
	)
	Printf "%s\\n" "${txt[@]}"
}

wget -O newfile $URL

file="/Users/viktorstranne/Documents/GitHub/1DV721/BashScripts/newfile"
type=$(file -b $file | awk '{print $1}')
filesize=$(stat -f%z $file)

echo "Type: " $type


echo "Filesize: " $filesize

if [[ "$type" == "ASCII" ]]; then

    echo "Words: " 
    wc -w $file

    echo "Lines:"
    wc -l $file

    echo "Spaces:"
    tr -cd ' ' < $file| wc -c

    first=$(head -1 $file)
    echo "First line: " "$first"

    last=$(tail -1 $file)
    echo "Last line: " "$last"

else
    first=$(head -c 10 $file)
    echo "First 10 bytes: " "$first"

    last=$(tail -c 10 $file)
    echo "Last 10 bytes: " "$last"
fi

open -a safari $1

while (($#))
do
	case "$1" in
		--help | -h)
			usage
			exit 0
		;;
	esac
done 


# TODO: The type of the file
#The size of the file
#For textfiles:

#The number of lines in the file
#The number of words in the file
#The number of spaces in the file
#Print the first line of the file and the last line of the file
#For binary files:
#The number of bytes in the file
#Show the 10-ish first and the 10-ish last bytes of the file in printable representation


#Open the local downloaded file in your favorite web browser
