# Edge-Data-Store-Docs

# Configuration tools

Edge Data Store and adapters can be configured with either the EdgeCmd utility, OSIsoft's proprietary tool for configuring the Edge Data Store and adapters, or a commonly-used REST tool.

## EdgeCmd utility

The EdgeCmd utility enables EDS and adapter configuration on both Linux and Windows operating systems. For more information on using the EdgeCmd utility, see [EdgeCmd utility](https://osisoft.github.io/Edgecmd-Docs/index.html).

## REST tools

The following tools can be used to make REST calls.

### curl

curl is a command line tool used to make HTTP calls and is supported on both Windows and Linux operating systems. curl is easily scripted using Bash or PowerShell on either Linux or Windows, and can be used to perform EDS administrative and programming tasks. curl commands are used in configuration and management examples throughout this document.

### Postman

Postman is an effective REST tool for systems with GUI components. Edge Data Store is supported on platforms that lack this capability. It is particularly useful for learning more about Edge Data Store REST APIs.

### C#, Python, Go

Edge Data Store is designed to use platform-independent programming, and any modern programming language can be used to make REST calls to administer and write programs for Edge Data Store. Since the administrative and programming interfaces use REST, you can write applications that both manage Edge Data Store and read and write data. For example, an application can access the Diagnostics namespace locally to monitor and act upon the local system state.

### System Tools

Use Windows tools like PuTTY and WinSCP to facilitate working across platforms, such as to copy files and remotely access Linux command lines.
