# guess-the-number OS
A bare metal operating system kernel to play Guess the Number on

![screenshot](screenshots/1.png)

## Features
- Guess the Number
- 32-bit
- custom bootloader
- pseudo-random number generator

## Resources
Thanks to [@cfenollosa](https://github.com/cfenollosa)'s amazing [os-tutorial](https://github.com/cfenollosa/os-tutorial) repository for teaching me how to write an operating system!

## Running
Download the most recent disk image from [releases](https://github.com/ltgr/guess-the-number/releases/)

Then, run
```sh
qemu-system-i386 -fda path/to/file/guess-the-number.iso
```

## Building from source
### Requirements
#### Linux
With your package manager, install
- qemu
- gcc(i386 elf)
- GNU Make
- nasm

#### Mac
> NOTE: does not work on M1 chip

Install dependencies with
```sh
brew install qemu nasm
brew tap nativeos/i386-elf-toolchain
brew install i386-elf-binutils i386-elf-gcc
```

### Steps

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
make qemu
```

## TODO
- Better random number generator(currently has pseudo random digits but that repeat with each boot)
- Better bug checking with strtonum in string.c
- Stop user from deleting the prompt

## License
[MIT License](https://github.com/ltgr/guess-the-number/blob/master/LICENSE)
