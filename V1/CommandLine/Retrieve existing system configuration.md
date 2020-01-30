---
uid: RetreiveExistingSystemConfiguration
---

# Retrieve existing system configuration

You can use the edgecmd utility to view the configuration for each part of Edge Data Store.

Complete the following to view the entire configuration for every component in Edge Data Store:

1. Open command line.
2. Type the following in the command line and press Enter.

   ```bash
      edgecmd Configuration
   ```

Complete the following to retrieve component specific configuration:

1. Open command line.
2. Type the following in the command line, replacing `<componentId>` with the ID of the component, and press Enter.

   ```bash
      edgecmd Configuration <componentId>
   ```

Complete the following to retrieve facet specific configuration of an Edge Data Store component:

1. Open command line.
2. Type the following in the command line, replacing `<componentId>` and `<facetName>` with the ID of the component and the facet name, and press Enter.

   ```bash
      edgecmd Configuration <componentId> <facetName>
   ```

Complete the following to retrieve the configuration for a specific facet entry:

1. Open command line.
2. Type the following in the command line, replacing `<componentId>` and `<facetName>` with the ID of the component and the facet name.

   ```bash
      edgecmd Configuration <componentId> <facetName> id=IndexToRetrieve
   ```

3. Add the parameters and their values for the facet to configure and press Enter.

#### Examples

##### View the configuration of the 'System' component

```bash
edgecmd Configuration System
{
  "Logging": {
    "logLevel": "Information",
    "logFileSizeLimitBytes": 34636833,
    "logFileCountLimit": 31
  },
  "HealthEndpoints": [],
  "Port": {
    "port": 5590
  },
  "Components": [
    {
      "componentId": "Storage",
      "componentType": "EDS.Component"
    }
  ]
}
```

##### View the configuration for the 'Logging' facet within the 'Storage' component

```bash
edgecmd Configuration Storage Logging
{
  "logLevel": "Information",
  "logFileSizeLimitBytes": 34636833,
  "logFileCountLimit": 31
}
```

##### View the configuration of a specific entry in the 'PeriodicEgressEndpoint' facet within the 'Storage' component

```bash
edgecmd Configuration Storage PeriodicEgressEndpoints id=Endpoint_1
{
  "id": "Endpoint_1",
  "executionPeriod": "2.00:00:00",
  "name": null,
  "description": null,
  "enabled": true,
  "endpoint": "http://localhost:5590",
  "clientId": null,
  "clientSecret": null,
  "userName": "user_54",
  "password": "***************",
  "validateEndpointCertificate": true,
  "tokenEndpoint": null,
  "debugExpiration": null,
  "namespaceId": "default",
  "backfill": false,
  "egressFilter": null,
  "streamPrefix": null,
  "typePrefix": null
}
```
