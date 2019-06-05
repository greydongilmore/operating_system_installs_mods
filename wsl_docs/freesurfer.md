# Freesurfer
## Download software
Download the linux software version from [here](https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz)

Run the following command:

```console
sudo tar -C /usr/local -xzvf /mnt/c/Users/*[your_username]*/Downloads/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz
```

You will also need to install tcsh:

```console
sudo apt-get install tcsh
```

```console
sudo apt-get install libglu1
sudo apt-get install libxss1
```

You will then need to add Freesurfer to your path:

```console
echo "FREESURFER_HOME=/usr/local/freesurfer" >> ~/.bashrc
echo 'source $FREESURFER_HOME/SetUpFreeSurfer.sh' >> ~/.bashrc
```

If you have run the install correctly you will see this output:

```console
Setting up environment for FreeSurfer/FS-FAST (and FSL)
FREESURFER_HOME /usr/local/freesurfer
FSFAST_HOME     /usr/local/freesurfer/fsfast
FSF_OUTPUT_FORMAT nii
SUBJECTS_DIR    /usr/local/freesurfer/subjects
MNI_DIR         /usr/local/freesurfer/mni
```

## Define subjects_dir
FreeSurfer requires an environment variable called ```SUBJECTS_DIR```. This is the directory where subject data is stored.

```console
export SUBJECTS_DIR=<path to subject data>
```

## Obtain license
You will need to obtain a license key from [here](https://surfer.nmr.mgh.harvard.edu/registration.html)

Once you obtain the license.txt key file, copy it to your FreeSurfer installation directory. This is also the location defined by the FREESURFER_HOME environment variable.

```console
sudo mv /mnt/c/Users/*[your_username]*/Downloads/license.txt $FREESURFER_HOME
```


