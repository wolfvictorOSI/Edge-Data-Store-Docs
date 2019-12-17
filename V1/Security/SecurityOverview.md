---
uid: security
---
# Security
The following topics discuss basic Edge Data Store security practices.

## REST APIs
Edge Data Store supports REST APIs for configuration, data reading (through SDS), and data writing (through OMF and SDS). Edge Data Store provides only localhost access to REST APIs. Any code that reads or writes to the REST APIs must reside on the computer or device on which Edge Data Store is running. 

REST access is through HTTP. The default port is 5590. The port number can be changed during installation, or during configuration after installation. URLs must be of the form http://<i></i>localhost:{port}/ or http://<i></i>127.0.0.1:{port}/. 

**Note:** Do not use the host's name or IP Address in the URL.

**Note:** Docker users must use the "host" networking mode for the container. For an example of running a container using this mode, see the section pertaining to [Docker containers](xref:edgeDocker).

## Data egress
Writing data to OSIsoft Cloud Services or OSIsoft PI Web API is not limited to the local machine. You can write data to either of these destinations using HTTPS.


## EDS Adapters
Modbus and OPC UA are not limited to the local machine. Both are enabled to access remote data sources through binary protocols.

## Secure storage
Sensitive information such as passwords and client secrets are saved in configuration files in an encrypted form. Only the Edge Data Store runtime can properly store and retrieve these protected data items. 

**Note:** Do not manually edit configuration files. Altering encrypted values will cause failures.

The only time unencrypted values for sensitive information are available is when you provide them to the system through the REST API, such as with initial configuration or update. From that point forward, the unencrypted values are not available, neither in the configuration files nor through the REST API. The REST API will only return a placeholder string for such values.

You should use caution when you submit sensitive data items. For example, remove any temporary file containing unencrypted credentials used to submit configuration to the REST API from the system.

## Service and file system security

The installer creates a specific user account that the Edge Data Store service runs under. You can only use this account for running the service.  For example, you cannot use it for interactive sessions. You cannot typically configure this service account. Modifying the service configuration in this respect could cause system failure.

The Edge Data Store binary files, configuration files, and data files are configured by the installer and runtime to allow appropriate access by the service account. You do not normally need to modify the permission and ownership assignments for these files, and should not as failures could occur.
 





