---
uid: InstallEdgeDataStore
---

# Install Edge Data Store

Install Edge Data Store using an install kit, as described in this section, or by using Docker containers. For more information, see [Install Edge Data Store using Docker](xref:edgeDocker).

For a list of supported platforms and processors, see [System requirements](xref:SystemRequirements).

**Note:**  The port assignment can be changed either during or after installation. For more information on how to change the port number after installation, see [System port configuration](xref:SystemPortConfiguration).

## Windows (Windows 10 x64)

You must have administrative privileges to run the installer. Complete the following steps to install Edge Data Store on Windows:

1. Download the Windows .msi file from the [OSIsoft Customer portal (https://customers.osisoft.com/s/products)](https://customers.osisoft.com/s/products).

       **Note:** Customer login credentials are required to access the portal.

2. Copy the _EdgeDataStore.msi_ file to the file system of the device.
3. To start the installer, double-click the _EdgeDataStore.msi_ file in Windows Explorer.

    **Note:** To specify an alternate location for Edge Data Store's binary components for the default location of "C:\Program Files\OSISoft\EdgeDataStore", use a command prompt to enter the following command and update the <file_path> with the path to the directory where you want to install the files. OSIsoft recommends you use the default path. Use the optional PORT parameter (must be in all caps) to specify a different port than the default of 5590. If the "quiet" or "no ui" flag for msiexec is specified and the PORT value on the command line is not valid, the install will proceed with the default 5590 value.
    
    ```bash
    msiexec /i EdgeDataStore.msi PORT=5590 INSTALLFOLDER="<file_path>"
    ```

4. In the OSIsoft Edge Data Store Setup window, click **Next**.
5. Optional: Change the install folder and port number (default port is 5590).

   **Note:** Valid values for the port number are in the range of 1024 to 65535 and only an unused port number should be entered.  
    
6. Optional: Select to add a Modbus TCP EDS Adapter system component, an OPC UA EDS Adapter system component, or both.

    **Note:** The Modus TCP EDS adapter and the OPC UA EDS adapter are both installed, regardless of whether a system component is added. Additional system components can be added for each adapter after installation.

7. Click **Next** > **Install**.
    
8. Click **Finish**.

For instructions on how to verify the Edge Data Store installation, see [Verify installation](xref:VerifyInstallation).

## Linux

You must have administrative privileges to install the software, for example root or sudo privilege, and the Linux OS must be up to date for the install to succeed. Complete the following steps to install Edge Data Store on Linux:

1. Download the Linux distribution file from the [OSIsoft Customer portal (https://customers.osisoft.com/s/products)](https://customers.osisoft.com/s/products).

       **Note:** Customer login credentials are required to access the portal.

2. Open a terminal window and run the sudo apt install command for the installation kit appropriate to your operating system and processor. 

    **Debian 9 or later (Intel/AMD 64 bit processors)**

    ```bash
    sudo apt install ./EdgeDataStore_linux-x64.deb
    ```

    **Debian 9 or later (ARM32, Raspberry PI 2,3,4: Raspbian, BeagleBone)**

    ```bash
    sudo apt install ./EdgeDataStore_linux-arm.deb
    ```

    ![alt text](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/LinuxInstall1.jpg "Linux Installation")

    **Debian 9 or later (Raspberry PI 3,4: Ubuntu ARM64 Server, Google Coral Dev Board, Nvidia Nano Jetson)**

    ```bash
    sudo apt install ./EdgeDataStore_linux-arm64.deb
    ```

    A validation check for prerequisites is performed. 

3. If the install fails, run the following commands from the terminal window and try the install again:

    ```bash
    sudo apt update
    sudo apt upgrade
    ```

4. Optional: Change the port number (default port is 5590) and press Enter. 

   **Note:** If you specify an invalid value for the port, the install will proceed with the default value of 5590.

5. Optional: Select to add a Modbus TCP EDS Adapter system component, an OPC UA EDS Adapter system component, or both, and press Enter.

    **Note:** The Modus TCP EDS adapter and the OPC UA EDS adapter are both installed, regardless of whether a system component is added. Additional system components can be added for each adapter after installation.

For instructions on how to verify the Edge Data Store installation, see [Verify installation](xref:VerifyInstallation).
