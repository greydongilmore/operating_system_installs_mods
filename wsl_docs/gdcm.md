cd SOMEWHERE

```console
git clone https://git.code.sf.net/p/gdcm/gdcm gdcm-gdcm
```

```console
mkdir gdcmBin
cd gdcmBin
ccmake ../gdcm-gdcm
```

Toggle and adjust the required options and parameters 

| Parameter                   | Value                                     |
|:----------------------------|:------------------------------------------|
| GDCM_BUILD_APPLICATIONS     | |
| GDCM_BUILD_EXAMPLES         | |
| GDCM_BUILD_SHARED_LIBS      | |
| GDCM_BUILD_TESTING          | |
| GDCM_DOCUMENTATION          | Build source documentation using doxygen. |
| GDCM_USE_VTK                | vtk bridge ? |
| GDCM_WRAP_CSHARP            | build csharp wrapping |
| GDCM_WRAP_JAVA              | |
| GDCM_WRAP_PYTHON            | |
 
hit c (a couple times, until no stars appear, in order configure)
hit g (generate makefiles)
hit q (quit ccmake)

```console
make
make install
```
