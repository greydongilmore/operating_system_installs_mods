# Automatic Registration Toolbox

Download the newest version of [ART](https://www.nitrc.org/projects/art/)

Make a new directory for the install and extract the tar package into it:

```console
mkdir ART
cd ART
tar -xvzf /mnt/c/Users/[your_username]/Downloads/acpcdetect2.0*.tar.gz
```

Set the ```ARTHOME``` environment variable and add the binary directory to your path

```console
export ARTHOME=path/to/ART
export PATH=$ARTHOME/bin:$PATH
```

You may get an error when executing ```acpcdetect```:

```console
acpcdetect: error while loading shared libraries: liblapack.so.3: cannot open shared object file: No such file or directory
```

If you get this error, run the following:

```console
sudo apt-get install libatlas-base-dev
```

You will also need to install ```pnmtopng```

```console
sudo apt-get install -y pnmtopng
```
