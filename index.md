
# INTRODUCTION

## Overview

TOPPE is a simple, modular framework for rapid prototyping of pulse sequences on General Electric MRI scanners.

Working with TOPPE involves three basic steps:

![TOPPE workflow](/figs/workflow.png)

1. **Design** the RF and gradient waveforms you want to play out on the scanner, using any suitable method.
1. Create TOPPE **sequence files** (gray boxes). This is done by first writing each unique sequence block, or module, to a **'.mod'** file using the **'mat2mod.m'** MATLAB script. 
You then create a file named **'scanloop.txt'** that specifies the order in which to play out the modules, waveform amplitudes, and other dynamic sequence information. 
Finally, create a small file named **'modules.txt'** that lists the various modules.
1. Copy the files you created to **/usr/g/bin/** on the scanner, and run the **TOPPE binary executable** (green box) which loads the files and executes the sequence.
The TOPPE executable only needs to be compiled and installed once per scanner software upgrade.



## Example 

The following example shows the TOPPE files for a sequence containing four different modules:

![TOPPE files](/figs/files.png)



# DOWNLOAD TOPPE SOURCE CODE



## MATLAB code

TOPPE MATLAB code is open source and is available at:

<https://github.com/toppeMRI/matlab/>

Alternatively, from a console you can copy the entire MATLAB repository to a local folder as follows:

```
git clone https://github.com/toppemri/matlab
```


## EPIC code

The **TOPPE binary executable** (psd) is written in 'EPIC' and is available for download from the following private repository: 

<https://github.com/toppeMRI/psd/>

Please contact <jfnielse@umich.edu> for access to this repository (requires a GE research agreement).



# GETTING STARTED


## Compiling the TOPPE interpreter

To compile the TOPPE binary psd (e.g., 'toppev2'), navigate to the '/psd/' subfolder in the EPIC source distribution and compile in the usual way:
```
prep_psd_dir; psdqmake hw;
```
Copy the resulting executable files, i.e., toppev2 and toppev2.psd.o, to /usr/g/bin/ on the scanner.


## Running an example TOPPE sequence

The MATLAB code repository contains several complete [pulse sequence examples](https://github.com/toppeMRI/matlab/tree/master/examples/), such as 3D spoiled gradient-echo (SPGR) and stack-of-spirals echo-shifted dynamic imaging (PRESTO fMRI).
For example, to execute the 3D SPGR example, do the following:

1. Navigate to <https://github.com/toppeMRI/matlab/tree/master/examples/v2>, select the '3dspgr' folder, and download the file 'scan,3dspgr.tgz'.
2. Copy scan,3dspgr.tgz to /usr/g/bin/ on the scanner and untar: ```tar xzf scan,3dspgr.tgz```
3. Prescribe the TOPPE interpreter, i.e., toppev2:
  + Select Axial 2D pulse sequence; Family: ’Gradient Echo’; pulse: ’GRE’; PSD Name: ’toppev2’;
  + Prescribe a single axial slice.
  + Other settings do not matter but must be specified. Suggested values are: Slice thickness 3, slice spacing 0, number of slices 1.
4. Download the sequence, run auto-prescan, and scan.


## The TOPPE User Guide

Additional details and instructions are provided in 
[this MRM paper](http://onlinelibrary.wiley.com/doi/10.1002/mrm.26990/full)
and in the 
[TOPPE user guide](https://github.com/toppeMRI/UserGuide/blob/master/TOPPE_UserGuide.pdf).
Latex source code for this guide is open-source, available in the following repository: 

<https://github.com/toppeMRI/UserGuide/>

To get a copy of the repository, do:
```
git clone https://github.com/toppemri/UserGuide
```

<dl>
<!-- This is a comment -->
</dl>




# USING TOPPE AS A GE INTERPRETER FOR Pulseq (under development)

Pulseq (<https://pulseq.github.io>) is a platform-independent file format for specifying arbitrary MR sequences.
In preliminary work we have used TOPPE as a GE interpreter of Pulseq files, which involves converting a Pulseq file to TOPPE files using the **'seq2ge.m'** MATLAB script included in the TOPPE distribution.
We also provide a script **'ge2seq.m'** for converting TOPPE to Pulseq format.
For more details about Pulseq, see the following paper: 

[DOI: 10.1002/mrm.26235](http://onlinelibrary.wiley.com/doi/10.1002/mrm.26235/abstract)

![TOPPE files](/figs/pulseq.png)


# Contact us

TOPPE was developed at the fMRI laboratory at University of Michigan.

For questions, contact Jon-Fredrik Nielsen at <jfnielse@umich.edu> or <jfnielsen@gmail.com>.
