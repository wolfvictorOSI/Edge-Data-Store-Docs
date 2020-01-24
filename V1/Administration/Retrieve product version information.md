---
uid: RetrieveProductVersionInformation
---

# Retrieve product version information

- To retrieve the product version of the Edge Data Store, use any tool capable of making HTTP requests to execute a POST command to the following endpoint:

  ```http
  http://localhost:5590/api/v1/diagnostics/productinformation
  ```

  Example using curl:

  ```bash
  curl -v -d "" http://localhost:5590/api/v1/Diagnostics/ProductInformation
  ```
