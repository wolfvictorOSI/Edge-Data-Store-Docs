---
uid: RetrieveProductVersionInformation
---

# Retrieve product version information

The product version information includes the Edge Data Store version number, the .NET Core version, the Core CLR version, and the operating system. This information can be useful for troubleshooting purposes.

Complete the following to retrieve the product version of the Edge Data Store:

1. Start any [Configuration tool](xref:ConfigurationTools) capable of making HTTP requests.
2. Execute a GET command to the following endpoint:

  ```http
  http://localhost:5590/api/v1/diagnostics/productinformation
  ```

   Example using curl:

   ```bash
   curl -v http://localhost:5590/api/v1/Diagnostics/ProductInformation
   ```
