# Bomberman 64 (USA)
A WIP decomp of Bomberman 64 (USA).

It builds the following ROM(s):

* bm64.z64: `md5: 093058ece14c8cc1a887b2087eb5cfe9`

Note: To use this repository, you must already have a rom for the game.

# Prerequisites

Under Debian / Ubuntu (which we recommend using), you can install them with the following commands:

```bash
sudo apt update
sudo apt install make git build-essential binutils-mips-linux-gnu python3 python3-pip
```

**Please also ensure that the Python version installed is >3.7.**

The build process has a few python packages required that are located in `requirements.txt`.

To install them simply run in a terminal:

```bash
python3 -m pip install -r requirements.txt
```

# To use
1. Place the USA Bomberman 64 rom into the root of the repository as "baserom.z64".
2. Set up tools and extract the rom: `make setup`
3. Re-assemble the rom: `make`
