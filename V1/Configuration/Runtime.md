---
uid: storageruntime
---

# Storage runtime configuration

The Edge Data Store provides a mechanism for configuring runtime characteristics of the storage component.  

> **Note:** The configured defaults are sufficent for most scenarios.  Modification of these values should only be done after consultation with OSIsoft Support personnel.

## Configure storage runtime

Complete the following to update the storage runtime configuration:

1. Using any text editor, create a file that contains the storage runtime configuration in JSON form
    - For content structure, see the following [Examples](#examples). 
    - For a table of all available runtime parameters, see [Parameters](#parameters).
2. Save the file.
3. Use any tool capable of making HTTP requests to execute a PUT command with the contents of that file to the following endpoint: `http://localhost:5590/api/v1/configuration/storage/Runtime/`

Example using cURL:

```bash
curl -i -d "@Storage_Runtime.config.json" -H "Content-Type: application/json" -X PUT http://localhost:5590/api/v1/configuration/storage/Runtime
```

> **Note** The @ symbol is a required prefix for the above command.


### Parameters

| Parameter                       | Required | Type     | Description                                        |
|---------------------------------|----------|----------|----------------------------------------------------|
| **IngressDebugExpiration**      | Required | string   | If set, defines how long OMF ingress debug files should be produced. |
| **StreamStorageLimitMb**        | Required | integer  | The maximum size in megabytes that a stream can reach. |
| **StreamStorageTargetMb**       | Required | integer  | The size in megabytes that a stream will be reduced to after StreamStorageLimitMb size is reached for a single stream. |
| **EnableTransactionLog**        | No       | bool     | Enables or disables the transaction log.  The transaction log helps to ensure no data is lost should a device lose power. |
| **TransactionLogLimitMB**       | No       | integer  | Maximum size for transaction log file.  Transaction log files larger than this size will be deleted, resulting is loss of data should the device lose power. |
| **CheckpointRateInSec**         | No       | integer  | How often to flush new data to store.  |


### Examples

The following is a valid runtime configuration example.

```json
{
  "streamStorageLimitMb": 2,
  "streamStorageTargetMb": 1,
  "ingressDebugExpiration": "0001-01-01T00:00:00",
  "checkpointRateInSec": 30,
  "transactionLogLimitMB": 250,
  "enableTransactionLog": true
}```
