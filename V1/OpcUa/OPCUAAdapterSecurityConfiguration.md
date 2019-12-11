---
uid: OPCUAAdapterSecurityConfiguration
---

# Adapter security

The OPC UA security standard is concerned with the authentication of client and server applications, the authentication of users and confidentiality of their communication. As the security model relies heavily on Transport Level Security (TLS) to establish a secure communication link with an OPC UA server, each client, including the EDS adapter, must have a digital certificate deployed and configured. Certificates uniquely identify client applications and machines on servers, and allow for creation of a secure communication link when trusted on both sides.

EDS adapter for OPC UA generates a self-signed certificate when the first secure connection attempt is made. Each OPC UA EDS adapter instance creates a certificate store where its own certificates, as well as those of the server, will be persisted.

## Configure OPC UA EDS adapter security

1. Configure the data source to use secure connection (Set UseSecureConnection as true).
2. Add server's certificate to the adapter's trust store.
3. Add adapter's certificate to the server's trust store.

### Data source configuration

```json
{
"EndpointUrl": "opc.tcp://IP-Address/TestOPCUAServer",
"UseSecureConnection": true,
"UserName": null,
"Password": null,
"RootNodeIds": null,
"IncomingTimestamp": "Source"
}
```

> **Note:** OSIsoft strongly recommends using secure connections in production environment(s).

### Adapter Certificate store

**Adapter Certificate store location:**

Windows: `%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates`

Linux: `/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates`

**Adapter Trust store location:**

Windows: `%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\Trusted\certs`

Linux: `/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/Trusted/certs`

**Adapter Rejected certificates location:**


Windows: `%programdata%\OSIsoft\EdgeDataStore\{ComponentId}\Certificates\RejectedCertificates\certs`

Linux: `/usr/share/OSIsoft/EdgeDataStore/{ComponentId}/Certificates/RejectedCertificates/certs`


The adapter verifies whether the server certificate is present in the adapter trust store location and is therefore trusted. In case the certificates were not exchanged upfront, the adapter persists the server certificate within the RejectedCertificates folder and the following warning message about the rejected server certificate will be printed:

```bash
~~2019-09-08 11:45:48.093 +01:00~~ [Warning] Rejected Certificate: "DC=MyServer.MyDomain.int, O=Prosys OPC, CN=Simulation
```

After the certificate is reviewed and approved, it can be manually moved from the “RejectedCertificates\certs” folder to the “Trusted\certs" folder using a file explorer or command-line interpreter.

- Linux example using command-line:

```bash
 mv /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/RejectedCertificates/certsSimulationServer\ \[F9823DCF607063DBCECCF6F8F39FD2584F46AEBB\].der /usr/share/OSIsoft/EdgeDataStore/OpcUa1/Certificates/Trusted/certs/
```

> **Note:** Administrator or root privileges are required to perform this operation.

When the certificate is in the adapter trust store, the adapter trusts the server and the connection attempt proceeds in making the  connection call to the configured server. Connection succeeds only when the adapter certificate is trusted on the server side. See your OPC UA server documentation for more details on how to make a client certificate trusted. In general, servers work in a similar fashion to the clients; hence a similar approach for making the server certificate trusted on the client side can be taken on the server.

When certificates are mutually trusted, the connection attempt succeeds and the adapter is connected to the most secure endpoint provided by the server.

