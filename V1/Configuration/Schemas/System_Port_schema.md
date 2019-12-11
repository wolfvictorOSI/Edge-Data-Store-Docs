---
uid: system_Port_schema
---

# Sample system port configuration

```json
{
  "Port": 5590
}
```

# System port configuration schema

| Abstract            | Extensible | Status       | Identifiable | Custom properties | Additional properties | Defined in                                         |
| ------------------- | ---------- | ------------ | ------------ | ----------------- | --------------------- | -------------------------------------------------- |
| Can be instantiated | Yes        | Experimental | No           | Forbidden         | Forbidden             | [System_Port_schema.json](System_Port_schema.json) |

# System port configuration properties

| Property      | Type      | Required | Nullable | Defined by                      |
| ------------- | --------- | -------- | -------- | ------------------------------- |
| [Port](#port) | `integer` <br> minimum value: `1024` <br> maximum value: `65535` | Optional | No       | PortConfiguration (this schema) |

**Note:**  All of the following _requirements_ need to be fulfilled.

#### Requirement 1

- []() – `#/definitions/EdgeConfigurationBase`

#### Requirement 2

`object` with following properties:

| Property | Type    | Required |
| -------- | ------- | -------- |
| `Port`   | integer | Optional |
