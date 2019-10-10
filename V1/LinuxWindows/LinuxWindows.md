---
uid: linuxWindows
---

# Linux and Windows platform differences

When developing applications to work with the Edge Data Store, there is no difference between Linux and Windows installations in expected behavior. To follow best practices on both platforms, there are some differences in how Edge Data Store is installed between Linux and Windows. 

## Windows file locations

Program binaries are placed in the _C:\Program Files\OSIsoft\EdgeDataStore_ directory by default. For information about changing this location, see the [installation](#installationOverview) documentation. 

Configuration, log, and data files are placed under _C:\ProgramData\OSIsoft\EdgeDataStore_ This is not configurable. This folder structure will not be automatically removed during uninstallation.  For information about clearing these files, see the [installation](#installationOverview) documentation.

Key material for configuration files' encrypted secrets is stored using the Windows DPAPI in a secure Windows store. This is not configurable.

## Linux file locations

Program binaries are placed in the _/opt/EdgeDataStore_ directory.  Configuration, log, and data files are placed under _/usr/share/OSIsoft/EdgeDataStore_. This folder structure will not be automatically removed during uninstallation. For information about clearing these files, see the [installation](#installationOverview) documentation.

Key material for configuration files' encrypted secrets are stored using limited access files under _/usr/share/OSIsoft/EdgeDataStore_. You cannot configure file locations for Linux.

When the Debian installer is used, Edge Data Store is installed using the service identity osisoft.edgedatastore.service. If you need to restart the service from the Linux command line, you can use the following command:

```bash
sudo systemctl restart osisoft.edgedatastore.service
```

