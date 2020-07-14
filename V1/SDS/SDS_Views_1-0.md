---
uid: sdsStreamViews1-0
---

# Stream views

An SdsStreamView provides a way to map stream data requests from one data type to another. You can apply a stream View to any read or GET operation. SdsStreamView is used to specify the mapping between source and target types.

SDS attempts to determine how to map Properties from the source to the destination. When the mapping is straightforward, such as when the properties are in the same position and of the same data type, or when the properties have the same name, SDS will map the properties automatically.

When SDS is unable to determine how to map a source property, the property is removed. If SDS encounters a target property that it cannot map to, the property is added and configured with a default value.

To map a property that is beyond the ability of SDS to map on its own, you should define an SdsStreamViewProperty and add it to the SdsStreamView’s Properties collection.

The following table shows the required and optional SdsStreamView fields. Fields that are not included are reserved for internal SDS use. For more information on search limitations, see [Search in SDS](xref:sdsSearching1-0).

| Property     | Type                   | Optionality | Searchability | Details |
|--------------|------------------------|-------------|------------|---------|
| Id           | String                 | Required    | Yes        |Identifier for referencing the stream view. |
| Name         | String                 | Optional    | Yes        |Friendly name. |
| Description  | String                 | Optional    | Yes        |Description text. |
| SourceTypeId | String                 | Required    | Yes        |Identifier of the SdsType of the SdsStream. |
| TargetTypeId | String                 | Required    | Yes        |Identifier of the SdsType to convert events to. |
| Properties   | IList\<SdsStreamViewProperty\> | Optional    | Yes, with limitations  |Property level mapping. |

**Rules for the stream view identifier (SdsStreamView.Id)**

1. Is not case sensitive.
2. Can contain spaces.
3. Cannot contain forward slash ("/").
4. Can contain a maximum of 100 characters.

## Properties / SdsStreamViewProperty

The SdsStreamView Properties collection provides detailed instructions for specifying the mapping of event properties. Each SdsStreamViewProperty in the properties collection defines the mapping of an event’s property. SdsStreamView properties are required only when property mapping is not straightforward. Additionally, if you do not want a type property mapped, it is not necessary to create an SdsStreamView property for it.

The following table shows the required and optional SdsStreamViewProperty fields.

| Property | Type    | Optionality | Details |
|----------|---------|-------------|---------|
| SourceId | String  | Required    | Identifier of the SdsTypeProperty from the source SdsType Properties list. |
| TargetId | String  | Required    | Identifier of the SdsTypeProperty from the target SdsType Properties list. |
| SdsStreamView  | SdsStreamView | Optional    | Additional mapping instructions for derived types. |

The SdsStreamView field supports nested properties.

## SdsStreamViewMap

When an SdsStreamView is added, SDS defines a plan mapping. Plan details are retrieved as an SdsStreamViewMap. The SdsStreamViewMap provides a detailed property-by-property definition of the mapping.

The following table shows the SdsStreamViewMap fields. The SdsStreamViewMap cannot be written to SDS, so required and optional have no meaning.

| Property     | Type                     | Optionality  | Details |
|--------------|--------------------------|--------------|---------|
| SourceTypeId | String                   | Required     | Identifier of the SdsType of the SdsStream. |
| TargetTypeId | String                   | Required     | Identifier of the SdsType to convert events to. |
| Properties   | IList\<SdsStreamViewMapProperty\>| Optional     | Property level mapping. |

### Properties / SdsStreamViewMapProperty

The SdsStreamViewMapProperty is similar an SdsStreamViewProperty but adds a mode detailing one or more actions taken on
the property.

The following table shows the SdsStreamViewMapProperty fields. The SdsStreamViewMap cannot be written; it can only be
retrieved from SDS, so required and optional have no meaning.

| Property     | Type        | Details |
|--------------|-------------|---------|
| SourceTypeId | String      | Identifier of the SdsType of the SdsStream. |
| TargetTypeId | String      | Identifier of the SdsType to convert events to. |
| Mode         | SdsStreamViewMode | Aggregate of actions applied to the properties. SdsStreamViewModes are combined via binary arithmetic. |
| SdsStreamViewMap   | SdsStreamViewMap  | Mapping for derived types. |

The available SdsStreamViewModes are shown in the following table.

| Name                   | Value  | Description |
|------------------------|--------|-------------|
| None                   | 0x0000 | No action.   |
| FieldAdd               | 0x0001 | Add a property matching the specified SdsTypeProperty. |
| FieldRemove            | 0x0002 | Remove the property matching the specified SdsTypeProperty. |
| FieldRename            | 0x0004 | Rename the property matching the source SdsTypeProperty to the target SdsTypeProperty. |
| FieldMove              | 0x0008 | Move the property from the location in the source to the location in the target. |
| FieldConversion        | 0x0016 | Converts the source property to the target type. |
| InvalidFieldConversion | 0x0032 | Cannot perform the specified mapping. |

## Changing stream type

Stream Views can be used to change the type defining a stream. You cannot modify the SdsType; types are immutable. But you can map a stream from its current type to a new type.

To update a stream's type, define an SdsStreamView and PUT the stream view to the following:

```text
PUT api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Type?streamViewId={streamViewId}
```

For details, see [Update Stream Type](xref:sdsStreamsAPI1-0#update-stream-type).

## Working with SdsStreamViews

When working with Stream Views either invoke HTTP directly or use some of the sample code. Both Python and JavaScript samples have SdsStreamView definitions.

The JSON for a simple mapping between a source type with identifier Sample and a target type with identifier Sample1 would appear as follows.

```json
{  
  "Id":"StreamView",
  "Name":"StreamView",
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1"
}
```

The SdsStreamViewMap would appear as follows.

```json
{  
  "SourceTypeId":"Simple",
  "TargetTypeId":"Simple1",
  "Properties":[  
      {  
        "SourceId":"Time",
        "TargetId":"Time"
      },
      {  
        "SourceId":"State",
        "TargetId":"State"
      },
      {  
        "SourceId":"Measurement",
        "TargetId":"Value",
        "Mode":4
      }
  ]
}
```