---
uid: commandLineLinuxQuickStart
---

# Edge Data Store command line quick start - Linux

One of the ways to configure the Edge Data Store is with the edgecmd command line tool. To access the tool on Linux open a command prompt. The utility is available to use in any directory on Linux.

```bash
debian@beaglebone:~$ edgecmd help

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

Most configurations options that can be done using REST can also be done using the edgecmd utility and command line arguments. Generally the configuration and administrative REST interfaces are exposed via the command line. Access to reading and writing data to the Edge Data Store Storage Component - OMF Ingress and SDS Read/Write capabilities are only available using the REST API.
