# CGEN for Binutils Example Flow
This repository is meant to be an example of how to run the CGEN tool for binutils. The goal is to provide clear step by step directions so that anyone can replicate the example flow.

## Steps to Build and Compile
No need to clone this repo before going through steps
1. Create a docker container
    - Install the `debian/eol:jessie` docker container
        ```
        docker run -it --name cgen-container debian/eol:jessie /bin/bash 
        ```
    - This older linux environment contains older libraries and packages needed for CGEN such as Guile 1.8
    - You should continue with the rest of the instructions from inside this container
2. Setup enviroment for CGEN and Binutils
    - Install library/package dependencies
        ```
        apt update
        apt install -y \
            build-essential \
            texinfo \
            flex \
            bison \
            libtool \
            autoconf \
            automake \
            libgmp-dev \
            libmpfr-dev \
            libmpc-dev \
            zlib1g-dev \
            libexpat1-dev \
            gettext \
            guile-1.8 \
            git \
            wget \
            gawk \
            pkg-config
        ```
3. Install Binutils(2.25) and CGEN(1.1)
    - You can use the provided script in this repo to install 
        ```
        git clone https://github.com/SAIL2CGEN/cgen-binutils-example.git
        ./install.sh
        ```
    - OR if you do not want to clone this repo, run the commands in the [install.sh](./install.sh) manually
        ```
        wget ftp://sourceware.org/pub/binutils/releases/binutils-2.25.tar.gz
        tar -xzf binutils-2.25.tar.gz
        wget ftp://sourceware.org/pub/cgen/releases/cgen-1.1.tar.gz
        tar -xzf cgen-1.1.tar.gz
        ```
    - Copy CGEN folder into Binutils folder
        ```
        cp -r ./cgen-1.1/cgen ./binutils-2.25
        ```
4. Build Binutils
    - Configure and build Binutils
        ```
        cd binutils-2.25
        ./configure
        make -j6
        ```
5. Run CGEN for lm32 architecture
    - Go to opcodes directory and generate new files for Binutils targeting lm32 architecture
        ```
        cd ../opcodes
        make stamp-lm32
        ```
    - You should see the following in the output messages
        ```
        Generating lm32-desc.h ...
        Generating lm32-desc.c ...
        Generating lm32-opc.h ...
        Generating lm32-opc.c ...
        Generating lm32-ibld.in ...
        Generating lm32-asm.in ...
        Generating lm32-dis.in ...
        Generating lm32-opinst.c ...
        touch stamp-lm32
        ```
