#!/bin/bash

read -p "Enter the ip: " ip

sudo nmap -A -p80 --open $ip/24 -oG nmap-scan_$ip-254

for ip in $(cat nmap-scan_$ip-254 | grep 80 | grep -v "Nmap" | awk '{print $2}')
do
    cutycapt --url="$ip" --out="$ip.png"
done
if [ $? -eq 0 ]
then
    echo "Screenshots are saved in the current directory"
    echo "Screenshots are saved in the current directory" >> web-vuln.html
    echo "<html>" >> web-vuln.html
    echo "<body>" >> web-vuln.html
    echo "<h1>Web Vulnerability Scanner</h1>" >> web-vuln.html
    echo "<h2>Screenshots</h2>" >> web-vuln.html
    echo "<img src="$ip.png" alt="$ip" />" >> web-vuln.html
    echo "</body>" >> web-vuln.html
    echo "</html>" >> web-vuln.html
    firefox web-vuln.html
fi