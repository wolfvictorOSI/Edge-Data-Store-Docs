---
uid: linuxWindows
---

# Linux and Windows platform differences

When developing applications to work with the Edge Data Store, there is no difference between Linux and Windows installations in expected behavior. Edge Data Store installation best practices differ between Linux and Windows, as described in the following sections:

## File locations

### Windows

Program binaries are placed in the _C:\Program Files\OSIsoft\EdgeDataStore_ directory by default. For information about changing this location, see the [installation](#installationOverview) documentation. 

Configuration, log, and data files are placed under _C:\ProgramData\OSIsoft\EdgeDataStore_ This is not configurable. This folder structure will not be automatically removed during uninstallation.  For information about clearing these files, see the [installation](#installationOverview) documentation.

Key material for configuration files' encrypted secrets is stored using the Windows DPAPI in a secure Windows store. This is not configurable.

### Linux

Program binaries are placed in the _/opt/EdgeDataStore_ directory.  Configuration, log, and data files are placed under _/usr/share/OSIsoft/EdgeDataStore_. This folder structure will not be automatically removed during uninstallation. For information about clearing these files, see the [installation](#installationOverview) documentation.

Key material for configuration files' encrypted secrets are stored using limited access files under _/usr/share/OSIsoft/EdgeDataStore_. You cannot configure file locations for Linux.

When the Debian installer is used, Edge Data Store is installed using the service identity osisoft.edgedatastore.service. If you need to restart the service from the Linux command line, you can use the following command:

```bash
sudo systemctl restart osisoft.edgedatastore.service
```

## File descriptors (handles)

Linux operating systems impose a limit on the number of file descriptors used in a process. The number of open file descriptors is directly related to the number of streams used in EDS (e.g. data ingress). Overall, every stream utilizes two file descriptors. EDS will no longer function properly when it reaches the limit of available file descriptors. To prevent this, it is necessary to either limit the number of streams used in EDS or increase the maximum allowed file descriptors per process.

The following figures were identified on a Raspberry Pi 3 Model B+ using a Raspbian operating system. An installation of EDS with no user-defined streams had an average of 424 open file descriptors. The same installation with 250 streams had an average of 932 open file descriptors. The file descriptor limit per process for the operating system used was 1024.

**Note**  Figures will differ on other Linux operating systems and devices, and may differ slightly from execution to execution, so it's important to understand the system you are using.

Windows has an object called a handle that is used in much the same way that Linux uses file descriptors. However, Windows does not have the same sort of limitation just described.
