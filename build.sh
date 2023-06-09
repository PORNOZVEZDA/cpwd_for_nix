#!/bin/sh
#just a compilation
#fno-builtin-memset asks compiler do not optimize memset() calls

outfile=${1-cpwd}
gcc -Wall -fno-builtin-memset main.c scrypt/readpass.c scrypt/crypto_scrypt-nosse.c scrypt/sha256.c -o $outfile
