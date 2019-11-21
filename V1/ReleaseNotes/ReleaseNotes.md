---
uid: releaseNotes
---

# Edge Data Store release notes

## Overview

Edge Data Store is supported on a variety of platforms and processors. OSIsoft provides ready to use install kits for the following platforms:

* Windows 10 x64 - EdgeDataStore.msi (Intel/AMD 64 bit processors)
* Debian 9 or later x64/AMD64 - EdgeDataStore_linux-x64.deb (Intel/AMD 64 bit processors)
* Debian 9 or later ARM32 - EdgeDataStore_linux-arm.deb (Raspberry PI 2,3,4, BeagleBone devices, other ARM v7 and ARM v8 32 bit processors)

In addition to ready to use install kits, OSIsoft also provides examples of how to create Docker containers in a separate file. tar.gz files are provided with binaries for customers who want to build their own custom installers or containers for Linux.

## Differences from Release Candidate 2

### General

* Many performance and resiliency improvements were made to the product.
* Issues related to long-term memory growth of the product have been addressed.
* The "System Reset" and "Storage Reset" features of the Edge Data Store are more resilient.
* The installation kits for the Edge Data Store were updated to create a better experience when upgrading installed instances.
* The installation kits have been updated to ensure only necessary files are included. 

### Modbus Adapter

*	Improved Modbus adapter performance when large data points are selected for data collection.
* Modbus data selection can be deselected via edgecmd, which wasn't supported in RC2.
* Modbus logs the data source and data selection configuration in verbose mode instead of information mode.

### OPC UA Adapter

* An option was added to override SDK certificate checks when NONE security is configured.

### Storage

* Backfilling can now be enabled/disabled by changing the value of the backfill property on an egress configuration. Previously, the configuration needed to be removed and re-added with the changed value. 
* For Linux installations, the number of allowed file handles for the service has been tuned to allow for up to 5,000 data streams.
* Fixed an issue with periodic egress where, in very specific scenarios, adding values immediately after egress started would result in only the last value being sent rather than all the values just added. 
* Attempts to update to an egress configuration with changes identical to the current configuration are now ignored.
* Issues related to data queries returning incorrect data were addressed.
* The type identifier of the underlying storage component for Edge Data Store was changed from "EDS.Component" to "Storage".

## Install Edge Data Store on a Device using an install kit

To use any of the installers, first copy the appropriate file to the file system of the device.

### Windows (Windows 10 x64)

Double click the EdgeDataStore.msi file in Windows Explorer or execute the file from a command prompt. You will be prompted for install location and default port, and when the install finishes, the EdgeDataStore will be installed and running on either the default port 5590 or the port you specified during the install.

### Debian 9 or later Linux (Ubuntu  Raspberry PI, BeagleBone, other Debian based Linux distros)

Complete the following:

1. Open a terminal window and type:

```bash
sudo apt install ./EdgeDataStore_linux_<either x64 or arm depending upon processor>.deb
```

A check will be done for prerequisites. If the Linux operating system is up to date, the install will succeed. If the install fails, run the following commands from the terminal window and try the install again:

```bash
sudo apt update
sudo apt upgrade
```

2. After the check for prerequisites succeeds, a prompt will display asking if you want to change the default port (5590). If you want to change the port, type in another port number in the acceptable range for the operating system you are using. If 5590 is acceptable, press Enter.

The install will complete and EdgeDataStore will be running on your device. You can verify that EdgeDataStore is correctly installed by running the following script from the terminal window. **Note:** Depending on the processor, memory, and storage, it may take the system a few seconds to start up.

```bash
curl http://localhost:5590/api/v1/configuration
```

If the installation was successful, you will get back a JSON copy of the default system configuration:

```json
{
  "Modbus1": {
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    },
    "DataSource": {},
    "DataSelection": []
  },
  "OpcUa1": {
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    },
    "DataSource": {},
    "DataSelection": []
  },
  "Storage": {
    "PeriodicEgressEndpoints": [],
    "Runtime": {
      "streamStorageLimitMb": 2,
      "streamStorageTargetMb": 1,
      "ingressDebugExpiration": "0001-01-01T00:00:00",
      "checkpointRateInSec": 30,
      "transactionLogLimitMB": 250,
      "enableTransactionLog": true
    },
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    }
  },
  "System": {
    "Logging": {
      "logLevel": "Information",
      "logFileSizeLimitBytes": 34636833,
      "logFileCountLimit": 31
    },
    "HealthEndpoints": [],
    "Port": {
      "port": 5590
    },
    "Components": [
      {
        "componentId": "OpcUa1",
        "componentType": "OpcUa"
      },
      {
        "componentId": "Modbus1",
        "componentType": "Modbus"
      },
      {
        "componentId": "Storage",
        "componentType": "Storage"
      }
    ]
  }
}
```

If you get back an error, wait a few seconds and try it again. On a device with limited processor, memory, and slow storage, it may take some time before Edge Data Store is fully initialized and running for the first time.
