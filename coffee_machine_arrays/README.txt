YAKINDU Coffee Machine EXAMPLE

This is a comprehensive example for the deep integration of YAKINDU statecharts 
with manually written C code. The example is implemented as a simple command
line tool. It makes use of POSIX threads. So you need a compiler tool chain and
 a 'pthread' library to build an run the example. 
 

1) STATECHART AND SOURCE CODE
First you may want to take a look at the model and source code artifacts. These
are all located in the 'src' folder. File names that include 'coffee' or 'cm_'
include application specific implementations and those with 'sc_' prefix are 
generic parts that belong to the state machine infrastructure. 


2) SET UP YOUR SYSTEM
As mentioned above you need a compiler tool chain and the 'pthread' libraries. 
If you have a Linux or Mac OS Xsystem you likely have everything installed. If 
you run Windows than we propose to install cygwin tools (https://www.cygwin.com).


3) SET UP THIS PROJECT
This project is preconfigured for Windows with cygwin. If you use another system:

- right-click on project 'coffee_machine' in the 'Project Explorer' 
- choose 'Properties'
- a dialog appears - choose 'C/C++ Build' 
- select 'Tool Chain Editor'
- choose the appropriate tool chain for 'current tool chain'
- click 'OK'

... and your project should be ready to build


4) BUILD
- right-click on project 'coffee_machine' in the 'Project Explorer' 
- choose 'Build Project'


5) RUN THE EXAMPLE
In the 'Debug' or 'Release' folder you will find an executable 'coffee_machine.exe'
(even on Linux and Mac OS X). Right-click on this and choose:
	- 'Run As > Local C/C++ Application'. 
The embedded Eclipse console shows up and you can follow the instructions. Enter 
'o' to start the coffee machine...


6) SIMULATE
Additionally you can simulate the statechart by right-click and choose:

	- 'Run As > Statechart Simulation'
   
You'll find more information on using the simulation in the help. 


7) CHANGE THE MODEL
You may want to change or extend the model. Within the embedded expression editor 
you can press 'Ctrl-Space' to get proposals, which also include the C elements from 
the imported C header files. 


8) GENERATE STATE MACHINE CODE
If you have changed the model you can generate state machine code by right-click on 
'CoffeeMachine.sgen' and choose 'Generate Code Artefacts'. This will generate:

- CoffeeMachine.h
- CoffeeMachineRequired.h
- CoffeeMachine.c
