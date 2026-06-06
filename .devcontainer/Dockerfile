FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gcc-i686-linux-gnu \
    binutils-i686-linux-gnu \
    nasm \
    make \
    qemu-system-x86 \
    libncurses5 \
    clang-format \
    git \
    && rm -rf /var/lib/apt/lists/*
