# TOPPE: Use MATLAB to program pulse sequences on GE MRI scanners


## INTRODUCTION


### Overview

TOPPE is a simple, modular development environment for rapid prototyping of pulse sequences on General Electric MRI scanners.

![TOPPE workflow](/figs/workflow.png)

Working with TOPPE involves three basic steps:

1. Use **MATLAB** to define the RF and gradient waveforms you want to play out on the scanner.
1. Create TOPPE **sequence files** (orange box above). This is done by writing each unique sequence block (or **module**) to a file using **'mat2mod.m'** (a script that is part of the TOPPE distribution), and creating a file named **'scanloop.txt'** that specifies the order with which to play out the modules, and with what waveform amplitudes (orange box above). In addition, create a small file named 'modules.txt' that lists the various modules.
1. Place the files you created in /usr/g/bin/ on the scanner, and run the **TOPPE binary executable** (green box) which loads the files and executes the sequence on the scanner.


### Example 

The following figure shows an example of TOPPE files for a sequence containing four different modules:

![TOPPE files](/figs/files.png)



## DOWNLOAD TOPPE SOURCE CODE


### MATLAB code

TOPPE **MATLAB code** is open source and can be viewed here: [https://github.com/toppeMRI/toppe](https://github.com/toppeMRI/toppe/matlab/).
Alternatively, you can clone the github repository:

```
git clone https://github.com/toppemri/toppe.github.io
```

### EPIC code

The **TOPPE binary executable** is written in 'EPIC' and is available for download on the GE collaboration forum: [https://collaborate.mr.gehealthcare.com/](https://collaborate.mr.gehealthcare.com/).


## GETTING STARTED

The MATLAB code repository contains several complete pulse sequence examples, such as 3D spoiled gradient-echo (SPGR) and stack-of-spirals echo-shifted dynamic imaging (PRESTO fMRI).


## USING TOPPE AS A GE INTERPRETER FOR PULSEQ (under development)

Alternatively, TOPPE can be used as the interpreter for [Pulseq](https://pulseq.github.io), which involves converting a Pulseq file to TOPPE files using **'seq2ge.m'** MATLAB script:

![TOPPE files](/figs/pulseq.png)
