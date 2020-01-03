---
uid: RetrieveProductVersionInformation
---

# Retrieve product version information

- To retrieve the product version of the Edge Data Store, use any REST client to make a request using the following syntax:

  ```http
  Method: GET
  Endpoint: http://localhost:5590/api/v1/diagnostics/productinformation
  Header: Content-Type application/json
  ```

  Example using cURL:

  ```bash
  curl -v -d "" -X POST http://localhost:5590/api/v1/Diagnostics/ProductInformation
  ```
