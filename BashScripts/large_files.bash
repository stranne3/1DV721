#!/bin/bash
#

path="$1"


if [ -d "$path" ]; then

# Skriv ut hur stora de 5 största filerna är.
echo "Largest files in directory: "
find $path -printf '%s %p\n' | sort -nr | head -5

###du -ahx $path | sort -n -r | head -5



echo "Total size of the largets files: "
find $path -type f -exec ls -l {} \; | awk '{sum += $5} END {print sum}' | sort -nr | head -5 

echo "Total files scanned: "
find $path -type f | wc -l
exit 0



else
    echo "$path"  " is not a valid path to a directory."
    echo "Exit code: 1"
    exit 1
fi



#Do the following and document it in the lab report.
#Write a script large_files.bash <path> that takes an directory path as an argument and scans it recursivly to find all files and their size.
#The script should check if the path exists, otherwise it should produce an error message.
#The script should write a report on the 5 largest files found and the total size of these files should be printed.
#The script should also write out the total number of files scanned and the total filesize for the target path.