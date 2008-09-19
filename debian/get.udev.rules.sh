#!/bin/bash

grep -r ".vendor" libfprint/drivers/*.c | sed -e s'/ },/,/' | sed s'/0x//g' | awk '{print $1 " " "ATTRS{idVendor}=="$5 " ATTRS{idProduct}==" $8 " MODE=\"0664\", GROUP=\"plugdev\"" }' 
| sed s/'==/&\"/g' | sed s/'==\"[[:alnum:]]*/&\"/g' | sed s'/libfprint\/drivers\//# Device /' | sed s'/\.c: /\n/'
