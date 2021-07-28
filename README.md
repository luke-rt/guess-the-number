# guess-the-number-os
A bare metal operating system kernel to play Guess the Number on

## Features
- Guess the Number
- 32-bit
- custom bootloader
- pseudo-random number generator

## Running
Prerequisites:
- qemu-system-i386
- gcc
- nasm
- GNU make

Install these prerequisites for your OS, then download the most recent disk image from [releases](https://github.com/ltgr/guess-the-number/releases/)

Then, run
```sh
qemu-system-i386 -fda path/to/file/guess-the-number.iso
```
Replace `qemu-system-i386` with the name of your qemu path variable(varies with OS)

## Building from source
Clone this repository with
```sh
git clone https://github.com/ltgr/guess-the-number.git
```
then to build the disk image
```sh
make
```

To run, type
```sh
make run
```

If this doesn't work, change the `EMU` variable in Makefile to your corresponding qemu path variable
