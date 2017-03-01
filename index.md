# TOPPE: Use MATLAB to program pulse sequences on GE MRI scanners

TOPPE is a simple, modular development environment for rapid prototyping of pulse sequences on General Electric MRI scanners.

Working with TOPPE involves three basic steps:

1. Use MATLAB to define the RF and gradient waveforms you want to play out on the scanner.
1. Write each separate sequence block (or module) to a file using 'mat2mod.m', a script that is part of the TOPPE distribution.
1. Create 'scanloop.txt'

![My helpful screenshot](/figs/workflow.png)
