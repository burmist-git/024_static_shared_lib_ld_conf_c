#!/bin/bash

# File description: example and reminder use of the ld (The GNU linker) 

function ldd_sh {
    echo "ldd rezult"
    ldd rezult
    #A static library have no such list of dependencies.
    #A static library is nothing more than an archive of object files.
    #And as object files doesn't know what libraries they depend on,
    #neither can a static library.
    echo "ldd rezultstatlib"
    ldd rezultstatlib
    echo "objdump -p libfs.a"
    objdump -p libfs.a
    echo "ldd rezultlibdyn"
    ldd rezultlibdyn
}

function etc_ld_so_conf {
    echo "more /etc/ld.so.conf"
    more /etc/ld.so.conf
    echo "ls /etc/ld.so.conf.d/"
    ls /etc/ld.so.conf.d/
    echo "more /etc/ld.so.conf.d/test.conf"
    more /etc/ld.so.conf.d/test.conf
}

function rm_test_conf {
    sudo rm /etc/ld.so.conf.d/test.conf
}

function cp_test_conf {
    sudo cp ./test.conf /etc/ld.so.conf.d/test.conf
}

function ldconfig_sh {
    #ldconfig - configure dynamic linker run-time bindings
    echo "sudo ldconfig"
    sudo ldconfig
}

function def_LD_LIBRARY_PATH {
    libDir="/home/burmist/home2/training/024_static_shared_lib_ld_conf_c/"
    #LD_LIBRARY_PATH=$libDir:${LD_LIBRARY_PATH}
    echo "Please execute : LD_LIBRARY_PATH=$libDir:${LD_LIBRARY_PATH}; export LD_LIBRARY_PATH;"
    #echo "printenv | grep LD_LIBRARY_PATH"
    #printenv | grep LD_LIBRARY_PATH
}

function undef_LD_LIBRARY_PATH {
    echo "Please execute : unset LD_LIBRARY_PATH"
    #echo "Please execute : LD_LIBRARY_PATH=\"\"; export LD_LIBRARY_PATH;"
    #LD_LIBRARY_PATH=""
    #export LD_LIBRARY_PATH
    #echo "printenv | grep LD_LIBRARY_PATH"
    #printenv | grep LD_LIBRARY_PATH
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -ldd          : print shared object dependencies default"
    echo " -ld_conf      : print ld conf"
    echo " -ldconfig     : update ld configuration files"
    echo " -rm_test_conf : remove test.conf file"
    echo " -cp_test_conf : copy test.conf file"
    echo " -def_LD_LIBRARY_PATH   : define LD_LIBRARY_PATH"
    echo " -undef_LD_LIBRARY_PATH : undefine LD_LIBRARY_PATH"
    echo " -p2           : second parameter"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-ldd" ]; then
        ldd_sh
    elif [ "$1" = "-ld_conf" ]; then
	etc_ld_so_conf
    elif [ "$1" = "-ldconfig" ]; then
	ldconfig_sh
    elif [ "$1" = "-rm_test_conf" ]; then
	rm_test_conf
    elif [ "$1" = "-cp_test_conf" ]; then
	cp_test_conf
    elif [ "$1" = "-def_LD_LIBRARY_PATH" ]; then
	def_LD_LIBRARY_PATH
    elif [ "$1" = "-undef_LD_LIBRARY_PATH" ]; then
	undef_LD_LIBRARY_PATH
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
        printHelp
    fi
fi
