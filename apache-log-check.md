> Bash Commands to Check Apache Logs 
--------------------------------------------------------------
``` 
$ - cat access.log | cut -d " " -f 1 | sort -u | uniq -c | sort -urn 
```
```
$ - cat access.log | grep <"SUSPICIOS IP ADDRESS"> | grep -v "/admin"
```




