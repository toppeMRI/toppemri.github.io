# News

## MRI Together global workshop

![MRI Together](/figs/mri_together_esmrmb_banner.png)

Join us for a live demonstration of TOPPE at 
[MRI Together](https://mritogether.github.io/),
a global workshop on open science and reproducible MR research hosted by ESMRMB, 
Dec 17-21, 2021.  
Session: **Pulseq & TOPPE on GE**  
Time: **Dec 15 at 18:00-20:00 UTC**


## Funding to develop harmonized fMRI protocols

(Sep 20201) TOPPE and Pulseq recently received funding from an 
[NIH U24 grant](https://reporter.nih.gov/search/Kwg7fwR620KvAQYWZNqzKg/project-details/10306940)
to develop
and disseminate **harmonized protocols for multi-site fMRI studies**.
Contact us if you'd like to learn more, or stay tuned for updates!



# Table of Contents
1. [Introduction](#introduction)
2. [Download the source code](#getsource)
3. [Getting started](#gettingstarted)
4. [Using TOPPE as a Pulseq interpreter](#pulseq)


# INTRODUCTION <a name="introduction"></a>

## Overview 

TOPPE is a simple, modular framework for rapid prototyping of pulse sequences on General Electric MRI scanners.

This framework is currently being updated to version 4.

All content related to this project, except the GE EPIC source code for the interpreter, is hosted on Github: <https://github.com/toppeMRI/toppe>

Working with TOPPE involves three basic steps:

![TOPPE workflow](/figs/workflow.png)

1. **Design** the RF and gradient waveforms you want to play out on the scanner, using any suitable method.
1. Create TOPPE **sequence files** (gray boxes). This is done by first writing each unique sequence block, or module, to a **'.mod'** file using the **'writemod.m'** MATLAB script. 
You then use the toolbox function **'write2loop.m'** to create a file named **'scanloop.txt'** that specifies the order in which to play out the modules, waveform amplitudes, and other dynamic sequence information. 
Finally, create a small file named **'modules.txt'** that lists the various modules.
1. Copy the files you created to the scanner, and run the **interpreter** (green box) which loads the files and executes the sequence.
The TOPPE executable only needs to be compiled and installed once per scanner software upgrade.

<iframe width="560" height="315" src="https://www.youtube.com/embed/S817b0Yfe3I?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## Example 

The following example shows the TOPPE files for a sequence containing four different modules:

![TOPPE files](/figs/files.png)



# DOWNLOAD TOPPE SOURCE CODE <a name="getsource"></a>

## MATLAB code

TOPPE MATLAB code is open source and is available at:

<https://github.com/toppeMRI/toppe/>

Alternatively, from a console you can copy the entire MATLAB repository to a local folder as follows:

```
git clone https://github.com/toppemri/toppe
```


The **TOPPE binary executable** (psd) is written in 'EPIC' and is available for download in the following private Github repository:

<https://github.com/jfnielsen/TOPPEpsdSourceCode>

For access, please email your Github user name to <jfnielse@umich.edu> or <jfnielsen@gmail.com>.

Access is limited to institutions that have signed the GE Research Community Sharing License.



# GETTING STARTED <a name="gettingstarted"></a>


## Running an example TOPPE sequence (UPDATED May 2019)

The [examples/ISMRM2019_SoftwareDemo](https://github.com/toppeMRI/toppe/tree/master/examples/ISMRM2019_SoftwareDemo) folder contains two complete examples to get you started: 2D GRE and 2D EPI. See the README.md file in that folder for usage.

These sequences will be/was demonstrated at ISMRM in Montreal on Sun May 12 during the educational session titled 'Open-Source Software Tools for MR Pulse Design, Simulation & Reconstruction'. The specific demonstration is titled 'Live Cross-Vendor Sequence Programming with Pulseq'.


## Additional information

Additional details and instructions are provided in 
[this MRM paper](http://onlinelibrary.wiley.com/doi/10.1002/mrm.26990/full)
and in the 
[TOPPE Matlab toolbox respository](https://github.com/toppeMRI/toppe/)

<dl>
<!-- This is a comment -->
</dl>



## Discussion forum

<https://groups.google.com/forum/#!forum/mr-pulse-sequence-prototyping-with-toppe>

<!--
<https://github.com/toppeMRI/toppemri.github.io/wiki>

<https://github.com/orgs/toppeMRI/teams/discussion-forum>

The discussion forum is set up as a Github 'team'. To become a member of the discussion forum team, email your Github user name to Jon-Fredrik Nielsen at <jfnielse@umich.edu> or <jfnielsen@gmail.com>.
-->


# USING TOPPE AS A GE INTERPRETER FOR Pulseq (under development) <a name="pulseq"></a>

Pulseq (<https://pulseq.github.io>) is a platform-independent file format for specifying arbitrary MR sequences.
In preliminary work we have used TOPPE as a GE interpreter of Pulseq files, 
which involves converting a Pulseq file to TOPPE files using the **'seq2ge.m'** MATLAB script 
available at the following repository: <https://github.com/toppeMRI/PulseGEq>.
We also provide a script **'ge2seq.m'** for converting TOPPE to Pulseq format.
For more details about Pulseq, see the following paper: 
[DOI: 10.1002/mrm.26235](http://onlinelibrary.wiley.com/doi/10.1002/mrm.26235/abstract)

![TOPPE files](/figs/pulseq.png)



# Contact us

TOPPE is being developed at the fMRI laboratory at University of Michigan.

For questions, contact Jon-Fredrik Nielsen at <jfnielse@umich.edu> or <jfnielsen@gmail.com>.
