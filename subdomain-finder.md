> Find Subdomains and Their Ip's
-------------------------------------------------------

```
$ - wget <SITE.domain>
------------------------------------
$ - grep "href=" index.html | cut -d "/ -f 3 | grep "\." | cut -d '"' -f 1 | sort -u > subdomains.txt
------------------------------------
$ - for url in $(cat subdomains.txt); do host $url; grep "has address" | cut -d "  -f 4 | sort -u
```
