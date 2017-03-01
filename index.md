# TOPPE: Use MATLAB to program pulse sequences on GE MRI scanners

TOPPE is a simple, modular development environment for rapid prototyping of pulse sequences on General Electric MRI scanners.

Working with TOPPE involves three basic steps:

1. Use MATLAB to define the RF and gradient waveforms you want to play out on the scanner.
1. Write each separate sequence block (or module) to a file using 'mat2mod.m' (a script that is part of the TOPPE distribution), and create a file named 'scanloop.txt' that specifies the order with which to play out the modules, and with what waveform amplitudes (orange box below). 
1. Run the TOPPE binary executable (green box) which loads the files you created and executes the sequence on the scanner.

![My helpful screenshot](/figs/workflow.png)

Alternatively, TOPPE can be used as the interpreter for ![Pulseq](pulseq.github.io)

![My helpful screenshot](/figs/files.png)
