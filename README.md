# multos-sample-app
Sample MULTOS smart card application. Used to test multosapploader


## Prerequisites
 - Windows Operating System


## Setup MULTOS SmartDeck Compiler

 1. Install [MULTOS SmartDeck](https://www.multos.com/developer_centre/tools_and_sdk).
 2. Add the installation's bin folder to the PATH environment variable. E.g. C:\Program Files (x86)\SmartDeck\bin
 3. Add the installation's include folder to the INCLUDE environment variable. E.g C:\Program Files (x86)\SmartDeck\include 

## Build
```
make
```
Outputs are located in the bin folder:
* sample.hzx (SmartDeck binary)
* sample.alu (MULTOS binary)
* sample.alc (Application load certificate for developer cards)
* sample.adc (Application delete certificate for developer cards)
* sample.lst (Application map file)