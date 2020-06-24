---
uid: sdsStreams1-0
---

# Streams

SDS stores collections of events and provides convenient ways to find and associating events. Events of consistent structure are stored in streams, called SdsStreams. An SdsType defines the structure of events in an SdsStream.

SdsStreams are referenced by their identifier or Id field. SdsStream identifiers must be unique within a namespace.

An SdsStream must include a TypeId that references the identifier of an existing SdsType. When an SdsStream contains data, you must use a stream view to update the stream type.

The following table shows the required and optional SdsStream fields. Fields not listed are reserved for internal SDS use.

| Property          | Type                             | Optionality | Searchability | Details |
|-------------------|----------------------------------|-------------|------------|---------|
| Id                | String                           | Required    | Yes        | An identifier for referencing the stream. |
| TypeId            | String                           | Required    | Yes        | The SdsType identifier of the type to be used for this stream. |
| Name              | String                           | Optional    | Yes        | Friendly name. |
| Description       | String                           | Optional    | Yes        | Description text. |
| Indexes           | IList\<SdsStreamIndex\>          | Optional    | No         | Used to define secondary indexes for stream. |
| InterpolationMode | SdsInterpolationMode             | Optional    | No         | Interpolation setting of the stream. Default is null. |
| ExtrapolationMode | SdsExtrapolationMode             | Optional    | No         | Extrapolation setting of the stream. Default is null. |
| PropertyOverrides | IList\<SdsStreamPropertyOverride\> | Optional    | No   | Used to define unit of measure and interpolation mode overrides for a stream. |

**Rules for the stream identifier (SdsStream.Id)**

1. Is not case sensitive.
2. Can contain spaces.
3. Cannot contain forward slash ("/").
4. Can contain a maximum of 100 characters.

## Indexes

* The Key or Primary Index is defined at the SdsType. Secondary Indexes are defined at the SdsStream.

* Secondary indexes are applied to a single property; there are no compound secondary indexes. Only SdsTypeCodes that can be ordered are supported for use in a secondary index.

* For more information about indexes, see [Indexes](xref:sdsIndexes1-0).

## Interpolation and extrapolation

The InterpolationMode, ExtrapolationMode, and [PropertyOverrides](#propertyoverrides) can be used to determine how a specific stream reads data. These read characteristics are inherited from the type if they are not defined at the stream level. For more information about type read characteristics and how these characteristics dictate how events are read, see [Types](xref:sdsTypes1-0).

## PropertyOverrides

PropertyOverrides provide a way to override interpolation behavior and unit of measure for individual SdsType properties for a specific stream.

The ``SdsStreamPropertyOverride`` object has the following structure:

| Property          | Type                 | Optionality | Details |
|-------------------|----------------------|-------------|---------|
| SdsTypePropertyId | String               | Required    | SdsTypeProperty identifier. |
| InterpolationMode | SdsInterpolationMode | Optional    | Interpolation setting. Default is null. |
| Uom               | String               | Optional    | Unit of measure. |

The unit of measure can be overridden for any type property defined by the stream type, including primary keys and secondary indexes. For more information about type property units of measure, see [Types](xref:sdsTypes1-0).

Read characteristics of the stream are determined by the type and the PropertyOverrides of the stream. The interpolation mode for non-index properties can be defined and overridden at the stream level. For more information about type read characteristics, see [Types](xref:sdsTypes1-0).

When specifying property interpolation overrides, if the SdsType InterpolationMode is ``Discrete``, it cannot be overridden at any level. When InterpolationMode is set to ``Discrete`` and an event it not defined for that index, a null value is returned for the entire event.
