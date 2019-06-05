# FMRIB Software Library

Easy install by downloading this [python script](https://fsl.fmrib.ox.ac.uk/fsldownloads_registration/)

You will need to register. On the subsequent page you will download the ```fslinstaller.py``` file.

Run the following:

```console
python /mnt/c/Users/*[your_username]*/Downloads/fslinstaller.py
```
The install will take awhile.

You will also need to install the package ```wxpython```:

```console
pip install wxpython
```

If that does not work then run:

```console
pip install -U -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-16.04 wxPython
```

## Libraries you may need to install

### Multiple-image Network Graphics library (libmng)

```console
sudo apt-get install libmng2
sudo apt-get install libmng-dev
```

You may receive a few errors about lib files, run these lines.

### PNG library - development (libpng-dev)

```console
sudo apt-get install libpng-dev
```

### Optimized BLAS (linear algebra) library (libopenblas-base)

```console
sudo apt-get install libopenblas-base
export LD_LIBRARY_PATH=/usr/lib/openblas-base/
```

### libmng.so.1 Error

You will need to create a symbolic link for the library dll ```libmng.so.1```:

```console
sudo ln -s /usr/lib/x86_64-linux-gnu/libmng.so.2 /usr/lib/x86_64-linux-gnu/libmng.so.1
```

### Independent JPEG Group's JPEG runtime library (libjpeg62)

```console
sudo apt-get install libjpeg62
```

### PNG library - runtime (libpng12.deb)
```console
wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
  && sudo dpkg -i /tmp/libpng12.deb \
  && rm /tmp/libpng12.deb
```

### GTK+ graphical user interface library (gtk2.0)

```console
sudo apt-get install gtk2.0
```

## May need pulseaudio for other random libraries

```console
sudo apt-get install pulseaudio
```

## You may also receive an error ```No D-BUS daemon running```, run the following:

```console
sudo chown -R *[your username]*:admin ~/.dbus
```
