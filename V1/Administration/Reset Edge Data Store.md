---
uid: ResetEdgeDataStore
---

# Reset Edge Data Store

Edge Data Store provides a method by which you can perform a complete reset of the product. When you perform a reset, all event data and Edge Data Store configuration is deleted, and the product is restarted.

**Note:** All configuration and stored data will be lost as a result of performing this action.

Complete the following to reset Edge Data Store:

1. Start any [Configuration tool](xref:ConfigurationTools) capable of making HTTP requests.
2. Execute a POST command to the following endpoint:

  ```http
  http://localhost:5590/api/v1/administration/System/Reset
  ```

  Example using curl:

  ```bash
  curl -v -d "" http://localhost:5590/api/v1/Administration/System/Reset
  ```

  An HTTP status 204 message indicates success.
