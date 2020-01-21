---
uid: disasterRecovery
---

# Disaster recovery

This topic provides procedures for creating a backup of Edge Data Store stream data and configuration files, moving them to a new system, and then restoring the back up files onto the new system. Procedures are provided for Windows and Linux systems.
 
**Prequisite:**  This topic does not provide instruction for backing up or restoring credentials. All credentials are encrypted for security purposes, so they cannot be copied or transferred. After the new system has had the storage and configuration files copied over, and the service has started, do the following:

1. Re-enter the credentials for the system using API calls. 
2. After updating, restart the Edge Data Store service. 
	
	The new edge device will be running as the previous device, and will contain all the data up to the point the previous device went down.


## Windows recovery

### Create a backup from the failed system

**Prerequisite:** Administrative access on the device to successfully restore on Windows system.

1. If your device is still able to boot, verify that Edge Data Store service has stopped. Use the Windows Service Manager or Task Manager Services tab to stop the Edge Data Store service.
2. Locate the storage and configuration files.

   **Note:** Windows storage and configuration files should be in the following locations:
	     _C:\ProgramData\OSIsoft\EdgeDataStore\Configuration_
	     _C:\ProgramData\OSIsoft\EdgeDataStore\Storage_
	     The ProgramData folder is typically hidden, so if it is not visible, go to the **View** tab in **Windows Explorer** and check **Hidden**.

3. Create a zip or tar file containing the storage and configuration directories, and move it to a USB device or other safe location. File transfer can be done with WinSCP, SFTP, or external device.

### Move the files to the new hardware

When the new hardware has been installed with Edge Data Store, the new system will have a default configuration. 

1. Stop the Edge Data Store service using the Windows Service Manager or Task Manager service tab.
2. Once the service has stopped, navigate to the _C:\ProgramData\OSIsoft\EdgeDataStore_ directory, and delete the default storage and configuration folders from the new device.

### Restore backed up data files

1. Copy or unzip the backup storage and configuration files into the _C:\ProgramData\OSIsoft\EdgeDataStore_ directory.

   **Note:** The C: drive may not be the default drive letter of your system. Refer to My Computer, This PC, or open a command prompt to verify the default drive letter.

2. Restart the Edge Data Store service using the Windows Service Manager or Task Manager service tab.

# Linux recovery

### Create a backup from the failed system

**Prerequisite:** Root access on the Linux device is required.

1. If your device is still able to boot, verify that Edge Data Store service has stopped, using the following command: 

	  ```
	  sudo systemctl stop osisoft.edgedatastore
	  ```

2. Locate the storage and configuration files.

   **Note:** Linux storage and configuration files should be in the following locations:
			_/usr/share/OSIsoft/EdgeDataStore/Configuration_
			_/usr/share/OSIsoft/EdgeDataStore /Storage_

3. Create a zip or tar file containing the storage and configuration directories, and move it to a USB device or other safe location. 

	File transfer can be done with WinSCP, SFTP, or external device.

   **Note:** Using the _cp_ command may result in a change in file ownership to the current user. 

### Move the files to the new hardware

When the new hardware has been installed with Edge Data Store, the new system will have a default configuration. 

1. Stop the Edge Data Store service using the following command:

	  ```
	  sudo systemctl stop osisoft.edgedatastore
	  ```

2. Once the service has stopped, navigate to the _/usr/share/OSIsoft/EdgeDataStore_ directory and extract your zip or tar file in that directory again using WinSCP, SFTP, or external device.

### Restore backed up data files

1. Delete the default storage and configuration folders from the _/usr/share/OSIsoft/EdgeDataStore_ directory.
2. Copy or unzip the backup storage and configuration files into the EdgeDataStore directory.
3. If the ownership of the two directories does not match, update it to _edgedatastore_ for the user and group. 
4. Start the Edge Data Store service with the following command:

	  ```
	  sudo systemctl start osisoft.edgedatastore
	  ```

5. Verify that Edge Data Store is running with the following command:

	  ```
	  sudo systemctl status osisoft.edgedatastore
	  ```

   **Note:** Default directory permissions are set to 755, and each subsequent file is 644. If you do not use tar it is possible to have permission issues with the recovery files. Tar matches via string name rather than the account ID/UID.
