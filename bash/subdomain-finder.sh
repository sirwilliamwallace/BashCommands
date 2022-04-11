#!/bin/bash

read -p "Enter the domain:  " domain
read -p "Enrter the folder to write the output with full path: " folder
if [ ! -d "$folder" ];
then
    mkdir -p $folder
elif [ -z "$folder" ];
then
    folder="/tmp/subdomains"
fi



wget -O $folder/subdomains-$domain.html  $domain # download the subdomains html file
if [ $? -eq 0 ];
then 
    grep -o '[^/]*\.$domain\.\w*' $folder/subdomains-$domain.html | sort -u > $folder/subdomains-sorted-$domain.txt
    echo "Subdomains found and sorted"
    for subdomain in `cat $folder/subdomains-sorted-$domain.txt`
    do
        host $subdomain | grep "has address" | cut -d " " -f 4 >> $folder/subdomains-ip-$domain.txt
    done
    echo "Results saved in $folder"
else
    echo "Something went wrong please check the folder path"
fi
