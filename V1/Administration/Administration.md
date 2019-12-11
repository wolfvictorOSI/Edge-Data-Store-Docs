---
uid: EdgeDataStoreAdministration
---

# Edge Data Store administration

Edge Data Store provides the following administration level functions:


## Retrieve Product Version Information

To retrieve the product version of the Edge Data Store, use any REST client ane make a request using the following:

```http
Method: GET
Endpoint: http://localhost:5590/api/v1/diagnostics/productinformation
Header: Content-Type application/json
```

Example using cURL:

```bash
curl -v -d "" -X POST http://localhost:5590/api/v1/Diagnostics/ProductInformation
```


- [Reset Edge Data Store](xref:ResetEdgeDataStore)
- [Reset the Storage component](xref:ResetTheStorageComponent)
- [Stop and start and EDS adapter](xref:StopAndStartAnEDSAdapter)




