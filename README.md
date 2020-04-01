This repo contains implementations of programs given in The Linux Programming Interface.

First you have to install WSL2 if you are on windows. 
https://docs.microsoft.com/en-us/windows/wsl/wsl2-install

This repo has a very useful script that: 
Downloads and builds the source
Creates a helper bash function and adds it to your ~/.bashrc file. 

To run the script, you run make setup after cloning this repo in the root directory. 

This allows you to write code from TLPI and then compile them as follows: 
  tcc path/to/file.c 

This command will create an object file at path/to/file.o

Thats it. :D
