#!/bin/bash

function prompt() {
    printf "\n> $1"
}

#1: Download and extract archive
if [ -e tlpi.tar.gz ]; then
    prompt "tlpi.tar.gz Exists, Do you want to continue? [Y/n] "
    read option
    if [ "$option" = "Y" ];then 
        curl http://man7.org/tlpi/code/download/tlpi-200106-dist.tar.gz --output tlpi.tar.gz
        tar xvf tlpi.tar.gz
    fi
fi

#2: Install dependencies
echo "Please give sudo access to install dependencies: "
echo "CMD: sudo apt install libcap-dev libacl1-dev libselinux1-dev libseccomp-dev"
sudo apt install libcap-dev libacl1-dev libselinux1-dev libseccomp-dev

#3: Building source
if [ -e "$(pwd)/tlpi-dist/libtlpi.a" ];then
    prompt "libtlpi.a Exists, Do you want to continue? [Y/n] "
    read option
    if [ "$option" = "Y" ];then 
        echo "Running make in tlpi_hdr now, building all source, will take some time. "
        cd tlpi-dist
        make
        cd ..
    fi
fi

#4: Append bash function in .bashrc
prompt "I strongly suggest adding these to bashrc for easy usage\n"
echo export TLPI_LIB=$(pwd)/tlpi-dist/libtlpi.a
echo export TLPI_HDR=$(pwd)/tlpi-dist/lib
cat ./scripts/append.sh   
prompt "Do you want to add these? [Y/n] "
read bashAddOption
if [ "$bashAddOption" = "Y" ];then
    echo "" >> ~/.bashrc
    echo export TLPI_LIB=$(pwd)/tlpi-dist/libtlpi.a >> ~/.bashrc
    echo export TLPI_HDR=$(pwd)/tlpi-dist/lib >> ~/.bashrc
    cat ./scripts/append.sh >> ~/.bashrc
    echo "Reloading bash now"
    source ~/.bashrc    
fi

