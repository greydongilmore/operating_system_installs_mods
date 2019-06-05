# NiftyReg Install

## Download NiftyReg

Obtain the newest version of [NiftyReg](https://sourceforge.net/projects/niftyreg/files/latest/download) or by running the following:

```console
mkdir ~/code/niftyreg_source
cd ~/code/niftyreg_source
git clone https://github.com/SuperElastix/niftyreg.git
```

## Run CMake/Make

Make the build and install directories. 

The default install location is ```/usr/local```, which falls on your PATH. This is the easiest location to install. If you want to install somwhere else then specify the path in the ```CMAKE_INSTALL_PREFIX``` variable.

```console
mkdir -p ~/bin/niftyreg
cd ~/bin/niftyreg
ccmake ~/code/niftyreg_source/niftyreg
```

The following options will be displayed, ensure you change ```CMAKE_INSTALL_PREFIX``` variable to the install directory path if you don't want to use default:

| Parameter                   | Value                                   |
|:----------------------------|:----------------------------------------|
|BUILD_ALL_DEP                | Set to ON if you want to build All the dependencies |
|BUILD_SHARED_LIBS            | Build the libraries as shared build the libraries as shared |
|BUILD_TESTING                | Set to ON if you want to build the unit tests |
|CMAKE_BUILD_TYPE             | Compiling options: Debug Release RelWithDebInfo MinSizeRel |
|CMAKE_INSTALL_PREFIX         | Set the path where the final install will be copied |
|M_LIBRARY                    | Path to a library. |
|PNG_INCLUDE_DIR              | Set if you want NiftyReg to support the PNG file format for 2D images. Note that CMake will try to find the libpng on your system and will build it automatically if it does not find it. |
|USE_CUDA                     | Set to ON if you want to build the GPU code. The CUDA toolkit must be install otherwise CMake will return an error message |
|USE_OPENCL                   | Set to ON to use OpenCL for multi-CPU implementation. |
|USE_OPENMP                   | Set to ON to use OpenMP for multi-CPU implementation. |
|USE_SSE                      | Set to ON to use SIMD based implementation, mostly for cubic B-Spline related computation. Note that SIMD implementation has only be done for single precision. |

Press __'c'__ to configure the NiftyReg project, press __'c'__ to configure the project. Once the project is correctly configured, press the __'g'__ key to generate the Makefiles. You can then build and install the project:

```console
sudo make
sudo make install
```

## Post-Install Configuration

The project should then be installed into the ```CMAKE_INSTALL_PREFIX``` directory you previously created. 

If you changed the install prefix directory, to one not on your PATH, you will need to add NiftyReg to your PATH. In order to use NiftyReg in any terminal, you will need to edit your ```.bashrc``` or ```.profile``` file by adding the following lines:

```
NREG=<path_to_your_niftyreg_install>
export PATH={NREG}/bin:${PATH}
export LD_LIBRARY_PATH={NREG}/lib:${LD_LIBRARY_PATH}
```

Close and re-open the linux terminal then run:

```console
reg_f3d
```
