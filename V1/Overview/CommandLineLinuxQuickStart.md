---
uid: commandLineLinuxQuickStart
---

# Command line quick start - Linux

This topic provides quick start instructions for using EdgeCmd in the Linux environment. You can utilize the edgecmd.exe command line tool to configure Edge Data Store, in addition to curl commands and REST calls. 

You can install EdgeCmd from the Linux command prompt. Complete the following to access edgecmd on Linux:

1. Open a command prompt. 
2. Enter the following command to start the edgecmd.exe tool from any directory.

   ```bash
   debian@beaglebone:~$ edgecmd help
   ```
   
 3. Type edgecmd help and press Enter.
 
 The edgecmd utility launches, displaying the following introductory material and a command prompt at the end:
   
   ```
   ************************************************************************************************************************
     Welcome to OSIsoft Edge Data Store configuration utility. Utility version: 1.0.0.148

   ************************************************************************************************************************
   ---------------------------------------------------------------------------------------------------------
               Command-line options => 'Configuration', 'Help'
   ---------------------------------------------------------------------------------------------------------
   Please enter ID of a component you would like to configure or to get component specific help output.
   Example:
   ./edgecmd Help ComponentId
   ./edgecmd Configuration ComponentId

   To get set of components registered to the Edge Data Store please run: ./edgecmd Configuration System Components

   To configure the system, please use 'System' as the ComponentId.
   Example of getting System help output: ./edgecmd Help System
   Example of configuring System Logging level: ./edgecmd Configuration System logging LogLevel=Warning
   debian@beaglebone:~$
   ```
