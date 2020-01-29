---
uid: RetrieveProductVersionInformation
---

# Retrieve product version information

The product version information includes the Edge Data Store version number, the .NET Core version, the Core CLR version, and the operating system. This information can be useful for troubleshooting purposes.

To retrieve the product version of the Edge Data Store, use any [Configuration tool](xref:ConfigurationTools) capable of making HTTP requests to execute a GET command to the following endpoint:

  ```http
  http://localhost:5590/api/v1/diagnostics/productinformation
  ```

  Example using curl:

  ```bash
  curl -v -d "" http://localhost:5590/api/v1/Diagnostics/ProductInformation
  ```
