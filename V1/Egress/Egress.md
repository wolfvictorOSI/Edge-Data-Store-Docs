---
uid: egress
---

# Data egress configuration

Edge Data Store provides an egress mechanism to copy and transfer data to another device or destination. Data is transferred through OMF. Supported destinations are OSIsoft Cloud Services or a PI Server.

Configuration of egress includes specifying zero or more endpoints. An egress endpoint represents a destination to which data will be sent. Each egress endpoint is comprised of the properties specified in the [Parameters](xref:configureEgress#parameters) section. It is executed independently of all other egress endpoints, and is expected to accept OMF messages. More than one endpoint for the same destination is allowed.

**Note:** Some types, and consequently containers and data, cannot be egressed. For more information, see [Egress Execution Details](xref:EgressExecutionDetails).

Edge Data Store supports one [tenant](xref:https://ocs-docs.osisoft.com/Documentation/Management/Account_Tenant.html) and two [namespaces](xref:https://ocs-docs.osisoft.com/Documentation/Management/Account_Namespace_1.html). The EDS tenant name is default, and the two namespaces are default (where adapter and OMF data is written) and diagnostics. Diagnostics is where the system and its components write information that can be used locally or egressed to a remote PI server or OCS for monitoring. You must create a separate egress definition for each namespace from which you want to egress data.

The other topics in this section provide instructions for the sequential steps required to egress EDS data to a PI server or OCS:

1. Prepare egress destinations in either a PI server or OCS. You will use the information produced by this action to define the endpoint in your egress configuration file.
2. Create an egress configuration file for each specific endpoint to which you want to egress data.
