---
uid: omfOverview
---

# OSIsoft Message Format (OMF)

The Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. The OMF ingress functionality is the same technology that is used in OSIsoft Cloud Services (OCS). Writing an OMF application to run on EDS is very similar to writing an OMF application to write data to OCS. No authentication is necessary for writing to Edge Data Store, as long as the application is running on the same device as Edge Data Store. Remote access to OMF data ingress is currently not supported.

## OMF specification

You can find the OMF specification here: [The OSIsoft Message Format](http://omf-docs.osisoft.com/en/v1.1/).

EDS uses OMF technology developed for use on OSIsoft Cloud Services (OCS). The behavior of OMF in EDS is very similar to OCS. Dynamic messages are supported, but static messages (usually used for creating PI AF assets) are not supported by EDS. Any static OMF messages sent to the EDS OMF REST endpoint will be ignored.

## OMF endpoint

The route to the OMF endpoint provided by the Edge Storage component is shown below. Replace _<port_number>_ with the port configured for your EDS system:

```http
Method: POST
Endpoint: http://localhost:<port_number>/api/v1/tenants/default/namespaces/default/omf
```

## Supported functionality

The OMF endpoint for the Edge Storage component supports both OMF version 1.0 and OMF version 1.1 for data ingress. If you specify a later version of OMF, errors will be returned. The OMF endpoint for the Edge Storage component can only create messages; it does not support the update action. If a create data message is sent with the same time index, the values will be replaced at that index value.

Dynamic messages are supported, but static messages are not supported by EDS. Any static OMF messages sent to the EDS OMF REST endpoint will be ignored.

For efficiency reasons, OSIsoft recommends batching OMF messages that are sent to the EDS endpoint. Sending single messages or a small number of messages to the OMF endpoint can be successful, but it is relatively inefficient. When a single message or a small number of messages are sent at a time, the HTTP overhead of creating the request and processing the response on a small device is more expensive than the processing of the OMF message itself. While a large number of OMF messages per second can be processed by EDS platforms,  OSIsoft recommends keeping the number of HTTP calls per second low to increase efficiency.

## HTTPS status codes

Edge Data Store returns the following status codes to provide feedback when an OMF ingress message is received. If an error occurs because of an issue with the server (408 Request Timeout or 503 Service Unavailable), the application can retry the request. It is up to the application developer to determine how many times to retry a request.

| Status Code        | Description               | Common Causes               |
|--------------------|---------------------------|-----------------------------|
| 204 No Content     | The OMF message was successfully processed, but there is no additional information to return. | |
| 400 Bad Request    | The OMF message was malformed or not understood. The client should not retry sending the message without modifications.| The body or headers of the OMF message were incorrect. Verify the validity of the request contents and headers.
| 408 Request Timeout| The server did not reply to a request within the time that the client was prepared to wait. The client may repeat the request without modifications at any later time.| Server busy or over-loaded with other requests.|
| 409 Conflict       | The request could not be completed due to a conflict with the current state of the server.| The information in the OMF message contradicts the data currently stored in EDS.|
| 413 Payload Too Large| Payload size exceeds OMF body size limit.| The body of an OMF message has a maximum size of 192KB. A request with a body size exceeding the maximum will be rejected with this error code.|
| 500 Internal Server Error| The server encountered an unexpected condition.| Review EDS logs for more insight.|
| 503 Service Unavailable| The server is currently unavailable, retry later.| The EDS server is performing maintenance on one or more streams.|
