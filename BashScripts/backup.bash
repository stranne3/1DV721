#!/bin/bash
# Create a backup for directory <argument> in file "tmp/backup_2022-01-27.tar.gz"
#
dir=[1;7t4[1;5t$1
if [ -f "$dir" ]; then
	if [ -f "$backupfile" ];  then
		echo "$backupfile" exists"[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[D[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C."
	else
		touch "$backupfile"
