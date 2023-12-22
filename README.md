# PerforMancer-BaP7 Previously NetForm
## STATUS: Development (O_o/'
The, scripts for NetForm and bits of my other projects, will be, re-used and re-written in, Batch and PWSH 7.4. It will instead show themes of statistical output in text based display interface, therein...
- Available stats will be explored, but will likely turn out to be minimal in some of the themes with PWSH 7.4 by itself, so this will be the best stats it has to offer, while being limited to stats that actually change.
- Multi-platform compatibility with core scripts due to PWSH (see requirements).
- Each of the themes of stats will be in its own script, the loops will be in their own processes.

## WORK:
- Features for next update...
1. The scripts need converting from dot link to module, dot link no work.
- Work under way...
1. The stats to be used for each theme need to be, reviewed and decided upon, and then implemented.
2. Some method of breaking loop and returning to main menu.
3. Layout improvement and code upgrades.
4. Testing and Fixing.


## PREVIEW:
```
===================( PerforMancer-BaP7 )====================












                    Stat Theme Selection

                    1. CPU (Processors)
                    2. GPU (Graphics)
                    3. AUD (Sound)
                    4. NET (Connections)

                    0. Exit Program











Enter your choice (1-0):

```
```

===================( PerforMancer-BaP7 )====================













                   Processor Statistics:

                    Total CPU Load: 1%
                  Internal Clock: 3800 MHz
                  External Clock: 100 MHz












```

## REQUIREMENTS:
- Batch Support for `PerforMancer-BaP7.Bat` Launcher.
- [PWSH 7.4](https://github.com/PowerShell/PowerShell/releases/tag/v7.4.0) for other scripts (Windows x64 `.msi` installer [here](https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/PowerShell-7.4.0-win-x64.msi)) 

## Disclaimer
This program is provided "as is" without, warranties and/or support. Users are responsible for the content they, download and/or use, as well as, any resulting damage to, software and/or hardware.





<BR>
<BR>
<BR>
<BR>
<BR>
<BR>

<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
HERE IS THE OLD README.MD...


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
