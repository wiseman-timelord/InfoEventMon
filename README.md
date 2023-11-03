# NetForm
## Status:
Working(ish). The batches for this program may only run on Windows 10 due to the different PowerShell launch commands required for various OS versions, that microsoft have bizarly chosen to use for each OS, and may cause endless launch loop on other systems.

## Description
NetForm is a PowerShell application designed for Windows users, providing real-time monitoring of network adapter statistics, including data rates, total data, errors, discards, and pause frames. 
The script offers a comprehensive view of network performance, allowing users to identify and diagnose network-related issues.
It's tailored to display statistics for all available network adapters, with the ability to customize the output format and include additional statistics as needed.
NetForm is better than the Network section of the Task Manager, because it displays transfer rate in KB/s not KBit/s, and additionally displays, Pauses, Discards and Errors. 

## Features

1. **Real-Time Monitoring:** Displays network adapter statistics, including data in/out rates, total data, errors, discards, and pause frames, updated every 5 seconds.
2. **Detailed Adapter Information:** Shows statistics for each network adapter separately, providing a granular view of network performance.
3. **Customizable Output:** The script can be modified to include additional statistics or change the display format, allowing users to tailor the output to their needs.
4. **Idle Time Tracking:** Monitors the idle time for each adapter, helping to identify potential connectivity issues or underutilized resources.

## Output
The app looks like this..
```


                    NetForm


Adapter: vEthernet (WSL) - Idle Time: 01:45:46

Data In Rate: 0.00 KB/s, Data In Total: 0.00 GB
Pauses In:0, Discards In: 0, Errors In: 0.
Data Out Rate: 0.00 KB/s, Data Out Total: 0.03 GB
Pauses Out:0, Discards Out: 0, Errors Out: 0.


Adapter: Ethernet - Idle Time: 00:14:25

Data In Rate: 0.06 KB/s, Data In Total: 33.45 GB
Pauses In:0, Discards In: 0, Errors In: 0.
Data Out Rate: 0.04 KB/s, Data Out Total: 0.66 GB
Pauses Out:0, Discards Out: 0, Errors Out: 0.


Adapter: vEthernet (Default Switch) - Idle Time: 04:49:47

Data In Rate: 0.00 KB/s, Data In Total: 0.00 GB
Pauses In:0, Discards In: 0, Errors In: 0.
Data Out Rate: 0.00 KB/s, Data Out Total: 0.00 GB
Pauses Out:0, Discards Out: 0, Errors Out: 0.
```

## Usage

1. Execute the batch "NetForm.bat" to launch the netform.ps1 PowerShell script.
2. Observe the real-time statistics for each network adapter, including data rates, total data, errors, discards, and pause frames.
3. The script will continue to run, updating the statistics every 5 seconds, until manually terminated.
4. The "NetForm.lnk" shortcut provided with preset arguements to run ".bat" on taskbar.

## Requirements

- Windows with PowerShell support (Windows 2008 R2, 2012, 8.1, 10)
- Network adapters for monitoring.

## Disclaimer

NetForm is designed to provide real-time monitoring of network adapter statistics. While it does not modify or interfere with network operations, users should be aware that the information provided is subject to the capabilities and configuration of the network adapters and underlying system. Interpretation and use of the data should be done with an understanding of networking principles and the specific network environment.
