---
uid: ConfigurationTools
---

# Configuration tools

Edge Data Store and adapters can be configured with either the EdgeCmd utility, OSIsoft's proprietary tool for configuring the Edge Data Store and adapters, or commonly-used REST tools.

## EdgeCmd utility

The EdgeCmd utility enables EDS and adapter configuration on both Linux and Windows operating systems. For more information on using the EdgeCmd utility, see [EdgeCmd utility](xref:Installedgecmd).

## REST tools

The following tools can be used to make REST calls.

### curl

curl is a command line tool used to make HTTP calls and is supported on both Windows and Linux operating systems. curl can be scripted using Bash or PowerShell on either Linux or Windows, and can be used to perform EDS administrative and programming tasks. curl commands are used in configuration and management examples throughout this documentation.

### Postman

In instances where Edge Data Store is installed on a platform with a GUI component, Postman is a useful REST tool for learning more about Edge Data Store REST APIs and creating REST calls. 

### C#, Python, Go

Edge Data Store is designed to use platform-independent programming, and any modern programming language can be used to make REST calls to administer and write programs for Edge Data Store. Since the administrative and programming interfaces use REST, applications can manage Edge Data Store and read and write data. For example, an application can access the Diagnostics namespace locally to monitor and act upon the local system state.

### System Tools

Use Windows tools like PuTTY and WinSCP to facilitate working across platforms, such as to copy files and remotely access Linux command lines.
