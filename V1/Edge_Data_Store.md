---
uid: EdgeDataStore
---

# Edge Data Store

Edge Data Store (EDS) is an embedded data server that runs on Linux and Windows. EDS provides a lightweight data collection and storage application designed to enable the capturing of data for historical storage and analysis at the edge of networks. A storage component based on sequential data storage technology is provided. You can configure and administer EDS through REST programming, configuration, administrative interfaces, and the EdgeCmd command line tool. EDS complements existing OSIsoft products, and is designed for small devices. You can install and run it on 64-bit Intel/AMD compatible, 32-bit ARM v7/v8 compatible, and 64-bit ARM v8 compatible chips.

While not a replacement for a PI System, EDS augments the PI System by providing historical data access in situations where deploying a full PI System is impractical. EDS provides native capability, via its Egress functionality, to send data to a PI System or to OSIsoft Cloud Services for long term historical storage and analysis.

EDS provides the following capabilities:

- OMF data ingress
- Edge connectivity through Modbus TCP and OPC UA
- Configurable data storage
- Data egress to PI Web API and OCS
- REST API to enable custom applications for visualization and analytics on Edge Data Store

## Edge Data Store architecture
The following diagram depicts the relationships of architectural components to one another in the Edge Data Store:

![EDS architecture](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSArchitecture.jpg "EDS architecture")

## Edge Data Store data flow
The following diagram depicts the flow of data in the Edge Data Store:

![EDS data flow](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview1.jpg "EDS data flow")

## Edge Data Store components
The following diagram depicts the relationship of key functions to relevant components of the Edge Data Store:

![EDS components](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOverview2.jpg "EDS components")

## Data ingress to Edge Data Store

Edge Data Store can ingress data in a number of ways. There are two built-in adapters: Modbus TCP EDS adapter and OPC UA EDS adapter. Data can also be ingressed using OSIsoft Message Format (OMF) and the Sequential Data Store (SDS) REST APIs.

The following diagram depicts an OMF data ingress scenario in the Edge Data Store:

![EDS OMF Ingress](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSOMFIngress.jpg "EDS OMF Ingress")

During installation of Edge Data Store, you can choose to install either a Modbus TCP EDS adapter or an OPC UA EDS adapter, or both. The Modbus TCP and OPC UA EDS adapters require configuration of data source and data selection before they can collect data in Edge Data Store. You can use OMF data ingress once Edge Data Store is installed, with no further configuration steps.

Edge Data Store is composed of components, and is designed to allow additional EDS adapters at a later point.


## Local data read and write access

You can access all data in Edge Data Store by using the Sequential Data Store (SDS) REST API. You can use this data for local applications that perform analytics or visualization. 

### Example EDS visualization application
The following diagram depicts the flow of data from a customer visualization application into Edge Data Store, via either OMF or SDS REST calls:

![EDS Visualization](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSVisualization.jpg "EDS Visualization")

### Example EDS analytics application
The following diagram depicts the flow of data from a customer analytics application into Edge Data Store, via either OMF or SDS REST calls:

![EDS Analytics](https://osisoft.github.io/Edge-Data-Store-Docs/V1/images/EDSAnalytics.jpg "EDS Analytics")

## Data egress from Edge Data Store

Edge Data Store can send data to both PI Data Archive using PI Web API and OSIsoft Cloud Services (OCS). After Edge Data Store is installed, additional configuration is necessary to send data to both OCS and PI Web API.

For information about using a component of EDS, see the corresponding quick start guide for that component.
