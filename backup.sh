#!/bin/sh
#last modified by vegetablebird 2018.09.19

#Description: Backup current directory
#USAGE:
#	$ cd ${directory_to_backup}/
#	$ ~/.backup/backup.sh

path=~/.backup/$(date +%F)_$(uname -n)$(pwd)
name=$(date +%F)_$(uname -n)_${PWD##*/}.tar

if [ -f "$path/$name" ]
then
	echo $path/$name exists!
	exit
fi

mkdir -p $path
tar -cvf $path/$name $(ls)

echo
echo compressing tarball $path/$name ...

#bzip2 -9 $path/$name
gzip $path/$name
