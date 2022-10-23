#!/bin/bash

#install sudo
#o | apt install sudo

#create ftpgroup
addgroup ftpgroup

#remove the first line. Read the file line by line till the end
sed 1d Shell_Userlist.csv | cat | while read line

#assign each field to a variable
do

	a1=$(echo "$line" | cut -d "," -f 1)
	a2=$(echo "$line" | cut -d "," -f 2)
	a3=$(echo "$line" | cut -d "," -f 3)
	a4=$(echo "$line" | cut -d "," -f 4)
	a5=$(echo "$line" | cut -d "," -f 5)
# creat user
useradd -u $a1 -m -g ftpgroup "$a2-$a3" -p $a4

# 
if [ "$a5" = "Admin" ]
then
	usermod -aG sudo "$a2-$a3"	
else
fi
#useradd -u "$a1" -m "$a2"
#echo "$a2:$a4" | chpasswd
#adduser "$a2" ftpgroup

#if [ "$a5" = "User" ]
#	then
#		adduser "$a2" ftpgroup
#		usermod -d "/home/$a2" -s "/bin/false" "$a2"

#elif [ "$a5" = "Admin" ]
#	then
#		adduser "$a2" sudo
#		usermod -d "/home/$a2" -s "/bin/bash" "$a2"

#else
#		echo "incorrect line"
#	fi
done< Shell_Userlist.csv

