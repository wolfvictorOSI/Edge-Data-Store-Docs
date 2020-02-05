---
uid: StopAndStartAnEDSAdapter
---

# Stop and start an EDS adapter

By default, when Edge Data Store starts, all currently configured EDS adapters are started and remain running until the product shuts down.

## Stop an EDS adapter

Complete the follwing to stop an EDS adapter:

1. Start any tool capable of making HTTP requests.
2. Execute a POST command to the following endpoint, replacing `<adapterId>` with the adapter that you want to stop:

    ```http
    http://localhost:5590/api/v1/administration/<adapterId>/Stop
    ```

    Example **Stop the OpcUa1 adapter** using curl: 

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/OpcUa1/Stop
    ```

    An HTTP status 204 message indicates success.

## Start an EDS adapter

Complete the following to start an EDS adapter:

1. Start any tool capable of making HTTP requests.
2. Execute a POST command to the following endpoint, replacing `<adapterId>` with the adapter that you want to start:

    ```http
    http://localhost:5590/api/v1/administration/<adapterId>/Start
    ```

    Example **Stop the Modbus1 adapter** using curl:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/Modbus1/Start
    ```

    An HTTP status 204 message indicates success.
