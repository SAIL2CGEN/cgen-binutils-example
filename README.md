# CGEN for Binutils Example Flow
This repository is meant to be an example of how to run the CGEN tool for binutils. The goal is to provide clear step by step directions so that anyone can replicate the example flow.

## Steps to Build and Compile
No need to clone this repo before going through steps.
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
3. Install Binutils(2.31) and CGEN(snapshot 2018/06/01)
    - Run the commands in the [install.sh](./install.sh) manually
        ```
        wget https://sourceware.org/pub/binutils/releases/binutils-2.31.1.tar.bz2
        tar -xzf binutils-2.31.tar.gz
        wget https://sourceware.org/pub/cgen/snapshots/cgen-20180601.tar.bz2
        mkdir cgen-20180601
        tar -xvjf cgen-20180601.tar.bz2 -C ./cgen-20180601
        ```
    - Copy CGEN folder into Binutils folder
        ```
        cp -r ./cgen-20180601/src/cgen ./binutils-2.31
        ```
    - Create directory for where Binutils tools will be placed
        ```
        mkdir lm32-binutils
        realpath lm32-binutils
        ```
        NOTE: The absolute path will be used later to configure binutils

    - Create directory for building Binutils
        ```
        mkdir build
        cd build
        ```
4. Build and install Binutils for lm32
    - Configure Binutils
        ```
        ../binutils-2.31/configure --target=lm32-unknown-linux-gnu --prefix=[lm32-binutils path] --enable-cgen-maint
        ```
    - Build and install Binutils
        ```
        make -j6
        make install
        ```
    - You should now see that the `lm32-binutils` directory is now populated with binary tools
        ```
        ls ../lm32-binutils/bin
        ```
