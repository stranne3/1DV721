#!/bin/bash
#

URL=$1
curl $URL > values
file="/Users/viktorstranne/Documents/GitHub/1DV721/BashScripts/values"
type=$(file -b "$file")
filesize=$(stat -f%z $file)
echo "Type: " $type "Filesize: " $filesize

filecontent=$(</Users/viktorstranne/Documents/GitHub/1DV721/BashScripts/values)





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
