---
uid: StopAndStartAnEDSAdapter
---

# Stop and start an EDS adapter

By default, when Edge Data Store starts, all currently configured EDS adapters are started and remain running until the product shuts down.

## Stop an EDS adapter

To stop an EDS adapter, use any [Configuration tool](xref:ConfigurationTools) capable of making HTTP requests to execute a POST command to the following endpoint:

    ```http
    http://localhost:5590/api/v1/administration/EDS adapterId/Stop
    ```

    Example using curl:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/OpcUa1/Stop
    ```

    **Note:** Replace _EDS adapterId_ with the ID of the EDS adapter you want to stop.

    An HTTP status 204 message indicates success.

## Start an EDS adapter

To start an EDS adapter, use any [Configuration tool](xref:ConfigurationTools) capable of making HTTP requests to execute a POST command to the following endpoint:

    ```http
    http://localhost:5590/api/v1/administration/EDS adapterId/Start
    ```

    Example using curl:

    ```bash
    curl -v -d "" http://localhost:5590/api/v1/Administration/Modbus1/Start
    ```

    **Note:** Replace _EDS adapterId_ with the ID of the EDS adapter you want to start.

    An HTTP status 204 message indicates success.
