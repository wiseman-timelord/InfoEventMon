# Netformancer
Status: Working.

## Description
Netformancer is a PowerShell application designed for Windows users, providing real-time monitoring of network adapter statistics, including data rates, total data, errors, discards, and pause frames. 
The script offers a comprehensive view of network performance, allowing users to identify and diagnose network-related issues.
It's tailored to display statistics for all available network adapters, with the ability to customize the output format and include additional statistics as needed.

## Features

1. **Real-Time Monitoring:** Displays network adapter statistics, including data in/out rates, total data, errors, discards, and pause frames, updated every 5 seconds.
2. **Detailed Adapter Information:** Shows statistics for each network adapter separately, providing a granular view of network performance.
3. **Customizable Output:** The script can be modified to include additional statistics or change the display format, allowing users to tailor the output to their needs.
4. **Idle Time Tracking:** Monitors the idle time for each adapter, helping to identify potential connectivity issues or underutilized resources.

## Output
It looks like this..
```
                  Netformancer

Adapter: Ethernet - Idle Time: 00:00:00

Data In Rate: 0 KB/s, Data In Total: 0.00 GB
Pauses In: 0, Discards In: 0, Errors In: 0.
Data Out Rate: 0 KB/s, Data Out Total: 0.00 GB
Pauses Out: 0, Discards Out: 0, Errors Out: 0.


Adapter: vEthernet (Default Switch) - Idle Time: 00:00:00

Data In Rate: 0 KB/s, Data In Total: 0.00 GB
Pauses In: 0, Discards In: 0, Errors In: 0.
Data Out Rate: 0 KB/s, Data Out Total: 0.00 GB
Pauses Out: 0, Discards Out: 0, Errors Out: 0.
```

## Usage

1. Execute the batch "Netformancer.bat" to launch the netformancer.ps1 PowerShell script.
2. Observe the real-time statistics for each network adapter, including data rates, total data, errors, discards, and pause frames.
3. The script will continue to run, updating the statistics every 5 seconds, until manually terminated.

## Requirements

- Windows with PowerShell support (Windows 2008 R2, 2012, 8.1, 10)
- Network adapters for monitoring.

## Disclaimer

Netformancer is designed to provide real-time monitoring of network adapter statistics. While it does not modify or interfere with network operations, users should be aware that the information provided is subject to the capabilities and configuration of the network adapters and underlying system. Interpretation and use of the data should be done with an understanding of networking principles and the specific network environment.
