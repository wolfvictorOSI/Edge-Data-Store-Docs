---
uid: VerifyInstallation
---

# Verify installation

On a device with limited processor, memory, and slow storage, it may take some time before the Edge Data Store is fully initialized and running for the first time. After allowing time for start up, use the following steps to verify that Edge Data Store is correctly installed. 

1. Run the following script:

    ```bash
    curl http://localhost:5590/api/v1/configuration
    ```
2. If you receive an error, wait a few seconds and try the script again. If the installation was successful, a JSON copy of the default system configuration is returned:

    ```json
        {
        "Storage": {
            "PeriodicEgressEndpoints": [],
            "Runtime": {
            "streamStorageLimitMb": 2,
            "streamStorageTargetMb": 1,
            "ingressDebugExpiration": "0001-01-01T00:00:00",
            "checkpointRateInSec": 30,
            "transactionLogLimitMB": 250,
            "enableTransactionLog": true
            },
            "Logging": {
            "logLevel": "Information",
            "logFileSizeLimitBytes": 34636833,
            "logFileCountLimit": 31
            }
        },
        "System": {
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
        }
    ```
