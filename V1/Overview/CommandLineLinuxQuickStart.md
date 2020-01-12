---
uid: commandLineLinuxQuickStart
---

# Command line quick start - Linux

You can configure Edge Data Store with the edgecmd.exe command line tool, in addition to curl commands and REST calls. 

Complete the following to access edgecmd on Linux:

1. Open a command prompt. The utility is available to use in any directory on Linux.

   ```bash
   debian@beaglebone:~$ edgecmd help
   ```
   
 2. Type help and press Enter.
 
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
