---
uid: omfOverview
---

# OSIsoft Message Format (OMF)

The Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. The OMF ingress functionality is the same technology that is used in OSIsoft Cloud Services (OCS). Writing an OMF application to run on EDS is very similar to writing an OMF application to write data to OCS. No authentication is necessary for writing to Edge Data Store, as long as the application is running on the same device as Edge Data Store. Remote access to OMF data ingress is currently not supported.

## OMF specification

You can find the OMF specification here: <http://omf-docs.osisoft.com/en/v1.1/?_ga=2.260486986.697819576.1580490598-1442617055.1580490598#>

EDS uses OMF technology developed for use on OSIsoft Cloud Services (OCS). The behavior of OMF in EDS is very similar to OCS. Dynamic messages are supported, but static messages (usually used for creating PI AF assets) are not supported by EDS. Any static OMF messages sent to the EDS OMF REST endpoint will be ignored.

## OMF endpoint

The route to the OMF endpoint provided by the Edge Storage component is the following:

```http
Method: POST
Endpoint: http://localhost:5590/api/v1/tenants/default/namespaces/default/omf
```

## Supported functionality

The OMF endpoint for the Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. If you specify a later version of OMF, errors will be returned. The OMF endpoint for the Edge Storage component can only create messages; it does not support the update action. If a create data message is sent with the same time index, the values will be replaced at that index value.

For efficiency reasons, OSIsoft recommends batching OMF messages that are sent to the EDS endpoint. Sending single messages or a small number of messages to the OMF endpoint can be successful, but it is relatively inefficient. When a single message or a small number of messages are sent at a time, the HTTP overhead of creating the request and processing the response on a small device is more expensive than the processing of the OMF message itself. While a large number of OMF messages per second can be processed by EDS platforms,  OSIsoft recommends keeping the number of HTTP calls per second low to increase efficiency.
