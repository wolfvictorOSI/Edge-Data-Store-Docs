---
uid: Performance
---

# Performance

Edge Data Store is designed to run on a variety of low powered devices and to serve data to custom applications that run on the same platform. To assist in determining the appropriate hardware and software configuration for a specific use, Edge Data Store was tested on a variety of different devices, from single board computers to industrial edge gateways, on Linux and Windows operating systems, with different data stream counts and with the supported ingress methods collecting data at different event rates. 

Use the following performance testing information to determine the appropriate hardware and software to use with Edge Data Store in your scenarios.

## Edge Data Store Performance Testing Hardware

Edge Data Store performance test cases were divided into three categories based on commonly available, consumer grade and industrial grade devices. Several devices in each category were tested to validate performance expectations and the results of these tests are summarized below in terms of the maximum supported data stream count and data ingress rate for each category. 

* Small devices (e.g., 1 core ARM CPU, 512 MB RAM, Linux): 30 data streams, 30 events / sec
* Medium devices (e.g., 2 core ARM or Intel CPU, 2 GB RAM, Linux or Windows): 300 data streams, 300 events / sec
* Large devices (e.g., 4 core ARM or Intel CPU, 4 GB RAM, Linux or Windows): 3,000 data streams, 3,000 events / sec

It is possible that lower performance results may be realized on other devices with similar hardware and software configurations. Other applications running on the same device may also affect actual performance of Edge Data Store. The data stream counts and throughput rates shown above are the upper limits of what is supported for the current release of Edge Data Store for each device category.

## Ingress Performance

Edge Data Store can ingress data using the EDS Modbus TCP adapter, the EDS OPC UA adapter, and/or a custom OMF application developed by others. Each of these data ingress methods have a different performance profile, so the performance of Edge Data Store using these different methods will vary. 

When selecting the device to host Edge Data Store, there are a few general principles that arose from the performance testing:

1. EDS adapters use less CPU than custom OMF applications when using the Edge Data Store OMF endpoint. In general, across all hardware platforms, CPU usage for EDS Modbus TCP and EDS OPC UA adapters is roughly half of that used by custom OMF applications at the same event rates.
2. RAM usage is largely determined by the number of data streams written to. More data streams collected in Edge Data Store by any data ingress method require additional RAM (in addition to requiring more storage space).
3. Edge Data Store is slightly more efficient running on Windows than Linux on similar devices. Both CPU and RAM usage are slightly lower when Edge Data Store is running on Windows 10 than on Linux when comparing them on the AMD64/Intel x64 devices, which support both operating systems. 
4. SSD storage is recommended for maximum performance and reliability. Edge Data Store performance testing was completed on a variety of storage media - SSDs, HDDs, eMMC, and SD cards. Edge Data Store performance testing was successful using all storage technologies but for maximum performance and reliability, SSD storage is the best choice.

## Periodic Egress Performance

Edge Data Store generates OMF messages when configured to egress data to a PI Server or to OSIsoft Cloud Services. An important part of periodic egress performance is the amount of network bandwidth available between the device hosting the Edge Data Store and the PI Web API OMF endpoint or the OSIsoft Cloud Services OMF endpoint. The performance numbers presented in this section reflect use of a network with a 1 GB LAN connection and a high-speed connection to the Internet. If Edge Data Store is installed on a device in a location with limited network bandwidth, a lower level of egress performance can be expected.

Data egress has a much smaller performance impact on Edge Data Store than data ingress. Generally speaking, the performance impact of data egress on CPU and RAM usage is only a small percentage of the CPU and RAM usage of data ingress, so data egress configuration is not a major factor in Edge Data Store system design.

### Periodic Egress Performance to PI Web API

Performance testing of periodic egress between Edge Data Store and the PI Web API OMF endpoint was completed with a 1 GB LAN connection between the Edge Data Store test device and the PI Web API. The PI Web API was hosted on server class PC that also included a PI Server. The Edge Data Store device was configured for backfill and several million events were sent to the PI Web API. In all cases, Edge Data Store egress performance exceeded 10,000 events per second. In addition, extended tests were run over several weeks with an egress rate of 3,000 events per second.

### Periodic Egress Performance to OSIsoft Cloud Services (OCS)

Performance testing of periodic egress between Edge Data Store and the OSIsoft Cloud Services OMF endpoint was completed with a high-speed Internet connection between the Edge Data Store test device and OSIsoft Cloud Services running in the Microsoft Azure West US Data Center, approximately 2,500 miles away. The Edge Data Store device was configured for backfill and several million events were sent to OSIsoft Cloud Services. In all cases, Edge Data Store egress performance exceeded 10,000 events per second. In addition, extended tests were run over several weeks with a lower egress rate.
