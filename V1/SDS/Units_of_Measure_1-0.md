---
uid: unitsOfMeasure1-0
---

# Units of measure

The Sequential Data Store (SDS) provides a collection of built-in units of measure (Uom). These units of measure can be associated with SdsStreams and SdsTypes to provide unit information for stream data that model measurable quantities. If data has unit information associated with it, SDS is able to support unit conversions when retrieving data. For more information, see [Reading data](xref:sdsReadingData1-0).

Since a unit of measurement (such as meter) defines the magnitude of a quantity (such as Length), SDS represents this through two objects: SdsUom and SdsUomQuantity.

## SdsUom

An SdsUom represents a single unit of measure, such as 'meter'.

The following table shows the required and optional SdsUom fields.

| Property         | Type   | Optionality | Description | Example  |
| ---------------- | ------ | ----------- | ------- | -------- |
| Id               | String | Required    | Unique identifier for the unit of measure | meters per second |
| Abbreviation     | String | Optional    | Abbreviation for the unit of measure  | m/s |
| Name             | String | Optional    | Full name for the unit of measure | Meters per second |
| DisplayName      | String | Optional    | Friendly display name for the unit of measure | meters per second |
| QuantityId       | String | Required    | The identifier for the quantity that this unit of measure quantifies| Velocity|
| ConversionFactor | Double | Required    | Used for unit conversions.  When a value of this unit is multiplied by the ConversionFactor and then incremented by the ConversionOffset, the value in terms of the base unit of the corresponding quantity is returned. | 1.0 |
| ConversionOffset | Double | Required    | Used for unit conversions. See details for ConversionFactor. | 0.0  |

## SdsUomQuantity

Represents a single measurable quantity, such as length).

The following table shows the required and optional SdsUomQuantity fields.

| Property   | Type    | Optionality | Description| Example  |
| ---------- | ------- | ----------- | ------- | ---------|
| Id         | String  | Required    | Unique identifier for the quantity | Velocity |
| Name       | String  | Optional    | Full name for the quantity | Velocity |
| BaseUom    | SdsUom  | Required    | The base unit of measure for this quantity. All other Uoms measuring this quantity will have ConversionFactors and ConversionOffsets relative to the BaseUom.  | SdsUom representing "meters per second" |
| Dimensions | short[] | Optional    | Reserved for internal use. Represents the seven base SI dimensions: Length, Mass, Time, Electric Current, Thermodynamic Temperature, Amount of Substance, and Luminous Density. | [1,0,-1,0,0,0,0] |

## Supported quantities

A list of the supported quantities and their base unit of measures follows. Supported quantities are read-only.

| Quantity Id                                 | Base Uom Id               |
| ------------------------------------------- | ------------------------- |
| Angular Velocity                            | radian per second         |
| Area                                        | square meter              |
| Computer Storage                            | byte                      |
| Density                                     | kilogram per cubic meter  |
| Dynamic Viscosity                           | pascal second             |
| Electric Charge                             | coulomb                   |
| Electric Current                            | ampere                    |
| Electric Potential                          | volt                      |
| Electric Resistance                         | ohm                       |
| Energy                                      | joule                     |
| Entropy and Heat Capacity                   | joule per kelvin          |
| Force                                       | newton                    |
| Frequency                                   | hertz                     |
| Length                                      | meter                     |
| Luminous Intensity                          | candela                   |
| Mass                                        | kilogram                  |
| Mass Flow Rate                              | kilogram per second       |
| Molar Flow Rate                             | mole per second           |
| Molecular Weight                            | kilogram per mole         |
| Amount of Substance                         | mole                      |
| Plane Angle                                 | radian                    |
| Power                                       | watt                      |
| Pressure                                    | pascal                    |
| Quantity                                    | count                     |
| Ratio                                       | percent                   |
| Specific Energy                             | joule per kilogram        |
| Specific Entropy and Specific Heat Capacity | joule per kilogram kelvin |
| Specific Volume                             | cubic meter per kilogram  |
| Speed                                       | meter per second          |
| Temperature                                 | kelvin                    |
| Temperature (Delta)                         | delta kelvin              |
| Time                                        | second                    |
| Volume                                      | cubic meter               |
| Volume Flow Rate                            | cubic meter per second    |
