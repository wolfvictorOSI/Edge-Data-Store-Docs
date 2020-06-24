---
uid: sdsTypes1-0
---

# Types

The Sequential Data Store (SDS) stores streams of events and provides convenient ways to find and associate events. Events are stored in SdsStreams. An SdsType defines the shape or structure of the event and how to associate events within the SdsStream.

SdsTypes can define simple atomic types, such as integers, floats, strings, arrays, and dictionaries. They can also define complex types using SdsTypes. You can define complex, nested types using the Properties collection of an SdsType.

An SdsType used to define an SdsStream must have a key. A key is a property, or a combination of properties that constitute an ordered, unique identity. The key is ordered, so it functions as an index. It is known as the primary index. While a timestamp (DateTime) is a very common type of key, any type that can be ordered is permitted. Other indexes (secondary indexes), are defined in the SdsStream. For more details on indexes, see [Indexes](xref:sdsIndexes1-0).

When you define a type, consider how the events will be represented in a stream. The SdsType defines each event in the stream. An event is a single unit whose properties have values that relate to the index; that is, each property of an SdsType event is related to the event’s index. Each event is a single unit.

An SdsType is referenced by its identifier or Id field. SdsType identifiers must be unique within a Namespace.

An SdsType can also refer other SdsTypes by using their identifiers. This enables type reusability. Nested types and base types are automatically created as separate types. For further information, see [Type reusability](#type-reusability).

SdsTypes define how events are associated and read within a collection of events, or SdsStream. The read characteristics when attempting to read non-existent indexes, indexes that fall between, before or after existing indexes, are determined by the interpolation and extrapolation settings of the SdsType. For more information about read characteristics, see [Interpolation](xref:sdsReadingData1-0#interpolation) and [Extrapolation](xref:sdsReadingData1-0#extrapolation) in [Reading data](xref:sdsReadingData1-0).

SdsTypes are immutable. After you create an SdsType, you cannot change its definition. If the definition of an SdsType is incorrect, you must delete and recreate it. In addition, the SdsType may be deleted only if no streams, stream views, or types reference it.

Only SdsTypes used to define SdsStreams or SdsStreamViews are required to be added to the Sequential data store. SdsTypes that define properties or base types are contained within the parent SdsType and are not required to be added to the Data Store independently.

The following table shows the required and optional SdsType fields. Fields that are not included are reserved for internal SDS use.

For search limitations, see [Searching](xref:sdsSearching1-0).

| Property          | Type                   | Optionality | Searchable | Details |
|-------------------|------------------------|-------------|---------|---------|
| Id                | String                 | Required    | Yes | Identifier for referencing the type. |
| Name              | String                 | Optional    | Yes | Friendly name. |
| Description       | String                 | Optional    | Yes | Description text. |
| SdsTypeCode       | SdsTypeCode            | Required    | No | Numeric code identifying the base SdsType. |
| InterpolationMode | SdsInterpolationMode   | Optional    | No | Interpolation setting of the type. Default is Continuous. |
| ExtrapolationMode | SdsExtrapolationMode   | Optional    | No | Extrapolation setting of the type. Default is All. |
| Properties        | IList\<SdsTypeProperty\> | Required    | Yes, with limitations | List of SdsTypeProperty items. |

**Rules for the type identifier (SdsType.Id)**

1. Is not case sensitive.
2. Can contain spaces.
3. Cannot contain forward slash ("/").
4. Can contain a maximum of 100 characters. 
