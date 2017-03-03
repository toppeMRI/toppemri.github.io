# TOPPE: MR pulse sequence programming in MATLAB


## INTRODUCTION

### Overview

TOPPE is a simple, modular development environment for rapid prototyping of pulse sequences on General Electric MRI scanners.

Working with TOPPE involves three basic steps:

![TOPPE workflow](/figs/workflow.png)

1. Use **MATLAB** to define the RF and gradient waveforms you want to play out on the scanner, using any suitable method.
1. Create TOPPE **sequence files** (orange box). This is done by first writing each unique sequence block, or module, to a so-called **'.mod'** file using the **'mat2mod.m'** MATLAB script. 
You then create a file named **'scanloop.txt'** that specifies the order in which to play out the modules, waveform amplitudes, and other dynamic sequence information. 
Finally, create a small file named **'modules.txt'** that lists the various modules.
1. Copy the files you created to **/usr/g/bin/** on the scanner, and run the **TOPPE binary executable** (green box) which loads the files and executes the sequence.
The TOPPE executable only needs to be compiled and installed once per scanner software upgrade.


### Example 

The following example shows the TOPPE files for a sequence containing four different modules:

![TOPPE files](/figs/files.png)



## DOWNLOAD TOPPE SOURCE CODE



### MATLAB code

TOPPE MATLAB code is open source and can be viewed here: <https://github.com/toppeMRI/matlab/>.
Alternatively, from a console you can copy the entire MATLAB repository to a local folder as follows:

```
git clone https://github.com/toppemri/matlab
```


### EPIC code

The **TOPPE binary executable** (psd) is written in 'EPIC' and is available for download on the GE collaboration forum: <https://collaborate.mr.gehealthcare.com/>.



## GETTING STARTED


### Compiling the TOPPE interpreter

To compile the TOPPE binary psd (e.g., 'toppev1'), navigate to the '/psd/' subfolder in the EPIC source distribution and compile in the usual way:
```
prep_psd_dir; psdqmake hw;
```
Copy the resulting executable files, i.e., toppev1 and toppev1.psd.o, to /usr/g/bin/ on the scanner.


### Running an example TOPPE sequence

The MATLAB code repository contains several complete [pulse sequence examples](https://github.com/toppeMRI/matlab/tree/master/examples/), such as 3D spoiled gradient-echo (SPGR) and stack-of-spirals echo-shifted dynamic imaging (PRESTO fMRI).
For example, to execute the 3D SPGR example, do the following:

1. Navigate to <https://github.com/toppeMRI/matlab/tree/master/examples/>, select the '3dspgr' folder, and download the file 'scan.tgz'.
2. Copy scan.tgz to /usr/g/bin/ on the scanner and untar: ```tar xzf scan.tgz```
3. Prescribe the TOPPE interpreter, e.g., toppev1:
  + Select Axial 2D pulse sequence; Family: ’Gradient Echo’; pulse: ’GRE’; PSD Name: ’toppev1’;
  + Prescribe a single axial slice.
  + Set shim to 'off'.
  + Other settings do not matter but must be specified. Suggested values are:
    + Slice thickness: 3
    + Slice spacing: 0
    + Number of slices: 1;
4. Download the sequence, run auto-prescan, and scan.


### The TOPPE User Guide

Additional details and instructions are provided in the [TOPPE user guide](https://github.com/toppeMRI/UserGuide/blob/master/TOPPE_UserGuide.pdf).
This guide is open-source, with Latex source code available in the following repository: <https://github.com/toppeMRI/UserGuide/>.
To get a copy of the repository, do:
```
git clone https://github.com/toppemri/UserGuide
```

<dl>
<!-- This is a comment -->
</dl>



## USING TOPPE AS A GE INTERPRETER FOR PULSEQ (under development)

Pulseq (<https://pulseq.github.io>) is platform-independent file format for specifying arbitrary MR sequences.
In preliminary work we have used TOPPE as a GE interpreter of Pulseq files, which involves converting a Pulseq file to TOPPE files using the **'seq2ge.m'** MATLAB script included in the TOPPE distribution.
For more details about Pulseq, see the following paper: [DOI: 10.1002/mrm.26235](http://onlinelibrary.wiley.com/doi/10.1002/mrm.26235/abstract).

![TOPPE files](/figs/pulseq.png)


## Contact us

For questions about TOPPE, contact Jon-Fredrik Nielsen at jfnielse@umich.edu.
