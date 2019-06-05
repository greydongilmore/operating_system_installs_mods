# Make and Cmake install
## Install Make

Install build essentials and make first:

```console
sudo apt-get install make
sudo apt-get update && sudo apt-get install build-essential
```

## Install CMake
Download the latest version of the cmake executable [here](https://github.com/Kitware/CMake/releases/download/v3.13.3/cmake-3.13.3-Linux-x86_64.sh). 

In your linux shell run:

```console
chmod +x /mnt/c/Users/*[your_username]*/Downloads/cmake-*-Linux-x86_64.sh
sudo /mnt/c/Users/*[your_username]*/Downloads/cmake-*-Linux-x86_64.sh
export PATH=~/cmake-3.13.3-Linux-x86_64/bin/:$PATH
```
