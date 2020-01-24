---
uid: ResetTheStorageComponent
---

# Reset the Storage component

You can delete and reset all event and configuration data related to the Storage component, after which the product will be restarted.

- To reset the Storage component, use any tool capable of making HTTP requests to execute a POST command to the following endpoint:

    ```http
    http://localhost:5590/api/v1/administration/Storage/Reset
    ```

    Example using curl:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/Storage/Reset
    ```

    An HTTP status 204 message indicates success.
