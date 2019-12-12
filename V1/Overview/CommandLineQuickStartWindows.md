---
uid: commandLineWindowsQuickStart
---

# Command line quick start - Windows

You can configure Edge Data Store with the edgecmd.exe command line tool, in addition to curl commands and REST calls. 

Complete the following to access edgecmd on Windows:

1. Open a command prompt.
2. Navigate to the directory where Edge Data Store is installed. This is usually in the following location:

   ```cmd
   C:\Program Files\OSIsoft\EdgeDataStore\
   ```

3. Do not copy or delete any files in that directory. Instead, use the full path from a different directory to invoke the tool:

   ```cmd
   C:\Users\John>"C:\Program Files\OSIsoft\EdgeDataStore\edgecmd.exe" Help
   ```
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
   .\edgecmd.exe Help ComponentId
   .\edgecmd.exe Configuration ComponentId

   To get set of components registered to the Edge Data Store please run: .\edgecmd.exe Configuration System Components

   To configure the system, please use 'System' as the ComponentId.
   Example of getting System help output: .\edgecmd.exe Help System
   Example of configuring System Logging level: .\edgecmd.exe Configuration System logging LogLevel=Warning

   C:\Users\John>
   ```

* Most configuration options that can be done using REST can also be done using the edgecmd utility and command line arguments. 
* Generally the configuration and administrative REST interfaces are exposed through the command line. 
* Access to reading and writing data to the Edge Data Store Storage Component - OMF Ingress and SDS Read/Write capabilities are only available using the REST API.
