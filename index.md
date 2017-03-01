# TOPPE: Use MATLAB to program pulse sequences on GE MRI scanners

TOPPE is a simple, modular development environment for rapid prototyping of pulse sequences on General Electric MRI scanners.

![TOPPE workflow](/figs/workflow.png)

Working with TOPPE involves three basic steps:

1. Use *MATLAB* to define the RF and gradient waveforms you want to play out on the scanner.
1. Write each separate sequence block (or *module*) to a file using *'mat2mod.m'* (a script that is part of the TOPPE distribution), and create a file named *'scanloop.txt'* that specifies the order with which to play out the modules, and with what waveform amplitudes (orange box above). 
1. Run the *TOPPE binary executable* (green box) which loads the files you created and executes the sequence on the scanner.

## Download MATLAB source code

TOPPE MATLAB code is open source and can be viewed here: [toppe MATLAB source link](https://github.com/toppeMRI/toppe).
Alternatively, you can clone the github repository:

```
git clone https://github.com/toppemri/toppe.github.io
```


## Using TOPPE as the GE interpreter for Pulseq (under development)

Alternatively, TOPPE can be used as the interpreter for [Pulseq](https://pulseq.github.io), which involves converting a Pulseq file to TOPPE files using *'seq2ge.m'* MATLAB script:

![TOPPE files](/figs/pulseq.png)
