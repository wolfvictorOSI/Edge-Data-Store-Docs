---
uid: Performance
---

# Performance

Edge Data Store is designed to run on a variety of low powered hardware platforms and to serve data to custom applications that run on the same platform. To assist in determining the appropriate hardware and software configuration for a specific use, Edge Data Store was tested on a variety of different hardware platforms, with different data stream counts and with the supported ingress protocols at different event rates. 

This topic is provided to assist the user in determining the appropriate hardware and software where Edge Data Store can be used to meet the needs of different scenarios.

## Edge Data Store Performance Testing Hardware

Edge Data Store performance test cases were divided into three categories based on commonly available hardware platforms. The exmaple devices used in these test cases, the maximum supported data stream count and data ingress rate for each category are listed below. 

* Small devices (BeagleBone Pocket Beagle, 1 core ARM32 CPU, 512 MB RAM): 30 data streams, 30 events / sec
* Medium devices (Raspberry Pi 3B+, 4 core ARM32 CPU, 1 GB RAM): 300 data streams, 300 events / sec
* Large devices (Dell, 4 core Intel x64 CPU, 8 GB RAM): 3,000 data streams, 3,000 events / sec

It is possible that lower performance resutls may be realized on other hardware and software configurations and/or due to other tasks running on the device. The data stream counts and throughput rates shown above are the upper limits of what is supported for the current release of Edge Data Store for each device category.

## Ingress Performance

Data in Edge Data Store can be ingressed the EDS Modbus TCP adapter, the EDS OPC UA adapter and/or with a custom OMF application. Each of these data ingress methods have a different performance profile, so the performance of Edge Data Store using these different methods will vary. 

When selecting the hardware to host Edge Data Store, there are a few general principles that come out of the performance testing:

1. EDS adapters use less CPU than custom OMF applications using the Edge Data Store OMF endpoint. In general, across all hardware platforms, CPU use for EDS Modbus TCP and EDS OPC UA adapters is about half of that used by custom OMF applcations at the same event rates.
2. RAM use is largely determined by the number of data streams written to. More data streams require additional RAM (in addition to requiring more storage space).
3. Edge Data Store is slightly more efficient running on Windows than Linux on similar hardware. Both CPU and RAM usage are slightly lower when Edge Data Store is running on Windows 10 than on Linux when comparing them on the AMD64/Intel x64 platform where both operating systems are supported. 
4. SSD storage is recommended for maximum performance and reliability. Edge Data Store performance testing was completed on a variety of storage media - SSDs, HDDs, eMMC, and SD cards. Edge Data Store performance testing was successful using all storage technologies but for maximum performance and reliability, SSD storage is the best choice.

## Periodic Egress Performance

Edge Data Store generates OMF messages when configured to egress data to a PI Server or to OSIsoft Cloud Services. An important part of periodic egress performance is the amount of network bandwidth available between the device hosting the Edge Data Store and the PI Web API OMF endpoint or the OSIsoft Cloud Servcies OMF endpoint. The performance numbers presented in this section reflect use of a network with a 1 GB LAN connection and a high speed connection to the Internet. If Edge Data Store is installed on a device in an location with limited network bandwidth, a lower level of egress performance can be expected.

Data egress has a much lower performance impact on Edge Data Store than data ingress. Generally speaking, the peformance impact of data egress on CPU and RAM usage is only a small percentage of the CPU and RAM use of data ingress, so data egress configuration is not a major factor in Edge Data Store system design.

### Periodic Egress Performance to PI Web API

Performance testing of periodic egress between Edge Data Store and the PI Web API OMF endpoint was completed with a 1 GB LAN connection between the Edge Data Store device and the PI Web API. The PI Web API was hosted on server class PC that also included a PI Server. The Edge Data Store test device was configured for backfill and several million events were sent to the PI Web API. In all cases, Edge Data Store egress performance exceeded 10,000 events per second. In addition, extended tests were run over several weeks with an egress rate of 3,000 events per second.

### Periodic Egress Performance to OSIsoft Cloud Services (OCS)

Performance testing of periodic egress between Edge Data Store and the OSIsoft Cloud Services OMF endpoint was completed with a high speed Internet connection between the Edge Data Store and OSIsoft Cloud Services running in the Microsoft Azure West US Data Center, approximately 2,500 miles apart. The Edge Data Store test device was configured for backfill and several million events were sent to OSIsoft Cloud Services. In all cases, Edge Data Store egress performance exceeded 10,000 events per second. In addition, extended tests were run over several weeks with a lower egress rate.
