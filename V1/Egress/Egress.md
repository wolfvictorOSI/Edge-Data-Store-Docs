---
uid: egress
---

# Data egress configuration

Edge Data Store provides an egress mechanism to copy and transfer data to another device or destination. Data is transferred through OMF. Supported destinations are OSIsoft Cloud Services or a PI Server.

Configuration of egress includes specifying zero or more endpoints. An egress endpoint represents a destination to which data will be sent. Each egress endpoint is comprised of the properties specified in the [Parameters](#parameters) section. It is executed independently of all other egress endpoints, and is expected to accept OMF messages. More than one endpoint for the same destination is allowed.

**Note:** Some types, and consequently containers and data, cannot be egressed. For more information, see [Egress Execution Details](#egress-execution-details).

One tenant and two namespaces are supported in the Edge Data Store. The tenant is default, and the two namespaces are default (where adapter and OMF data is written) and diagnostics. Diagnostics is where the system and its components write information that can be used locally or egressed to a remote PI server or OCS for monitoring. To egress both namespaces two egress definitions are required.

