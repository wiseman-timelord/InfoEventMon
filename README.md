# InfoEventMon

### Status
Alpha; Consolidating, Performancer and WhaGoWan and maybe some other half-developed ones, into a single program "InfoEventMon", for system monitoring, device info and recent events...
1. Progress submenu options for "Device Information" to completion; Options on Submenu have been refined to, System, Graphics, Sound... 
- Layout of text needs work.
- if report is over 30 minutes long, then generate new report.
- it needs to detect up to 2 graphics cards and upto 3 sound devices (to fit in space). 
- add a drive info option to submenu, limit info per dive or drives to number or do horizontally.

## Description
InfoEventMon Will become a tool for, System Information, Device Monitoring, System Events, in one place, it will all be done through cmdlets, so, dont expect much.

### Features
**CPU/Network Monitoring:** Monitor the performance of your, Processor or Network, see `Preview` section below.
**Application/System Events:** Export recent events to a relevantly relating `ProgramEvents.Txt/SystemEvents.Txt`, with options to launch notepad and view it.  

### Preview
The Main Menu...
```
=========================( PerfEventMon )=========================











                     1. Performance Monitor,

                     2. DirectX Information,

                     3. Recent Events Report.










---------------------------------------------------------------
Select, Options = 1-3, Exit = X: :

```
- Monitoring Options (both screens)...
```
=========================( InfoEventMon )=========================

CPU Name: AMD Ryzen 9 3900X 12-Core Processor
Maximum Threads: 24
Maximum Clock Speed: 3801MHz
Current Clock Speed: 3793MHz
CPU Usage: 9.6%

---------------------------------------------------------------
Select; Back = B
Refreshing In 5 Seconds...

...

=========================( InfoEventMon )=========================

NIC Name: Realtek PCIe GbE Family Controller
Status: Up
Speed: 1 Gbps
IPv4 Address: XXX.XXX.XXX.XXX
Download Rate: 15.4 KB/s
Upload Rate: 13.5 KB/s
Discards Total: 0
Errors Total: 0

---------------------------------------------------------------
Select; Back = B
Refreshing In 5 Seconds...

```
- Production of Apps/System Events report...
```
Time: 02/15/2024 22:08:27, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:27Z. Reason: RulesEngine.
Time: 02/15/2024 22:07:57, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 21:12:54, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:54Z. Reason: RulesEngine.
Time: 02/15/2024 21:12:24, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 21:12:13, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:13Z. Reason: RulesEngine.
Time: 02/15/2024 21:11:43, ID: 1040, Level: Information, Message: Hardware has changed from previous boot.
Time: 02/15/2024 21:11:43, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 18:42:16, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:16Z. Reason: RulesEngine.
Time: 02/15/2024 18:41:45, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 18:08:59, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:59Z. Reason: RulesEngine.
Time: 02/15/2024 18:08:29, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 18:08:19, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:19Z. Reason: RulesEngine.
Time: 02/15/2024 18:07:48, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 17:33:09, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:09Z. Reason: RulesEngine.
Time: 02/15/2024 17:32:39, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 16:33:45, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:45Z. Reason: RulesEngine.
Time: 02/15/2024 16:33:15, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 15:59:19, ID: 16384, Level: Information, Message: Successfully scheduled Software Protection service for re-start at 2024-03-16T06:53:19Z. Reason: RulesEngine.
Time: 02/15/2024 15:58:49, ID: 16394, Level: Information, Message: Offline downlevel migration succeeded.
Time: 02/15/2024 15:58:00, ID: 0, Level: Information, Message: Service stopped.

```


## Usage
1. Unpack the program to a sensible location, sensible locations do not include, "C:\Program Files" or "C:\Program Files(x86)", though it may work in those locations.
2. Run `InfoEventMon.Bat`, select `Option 1`, the `main.ps1` script will then load.
3. Navigate the menus, select your options, as you prefer. 
4. Navigate `Back` to the main menu, then `Exit` the program, then `Exit` the Launcher.

### Requirements
(compatibility ranges require calculation)
- Windows based environment with, Scripting Host and Batch/PowerShell Support, Enabled.
- .Net 2.0+ - Breaking a loop is impossible without this, check out [SystemConfig](https://github.com/wiseman-timelord/SystemConfig) for offline install of .net 3.5 if your having issues. (this project is not currently complete)
- DirectX - For detailed device information, of course you can use DxDiag, but my program refines the info.
- PowerShell - If your having issues, then upgrade your PowerShell, or alternatively install, [PWSH 7.4 MSI](https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/PowerShell-7.4.0-win-x64.msi) or [PWSH 7.4](https://github.com/PowerShell/PowerShell/releases/tag/v7.4.0) (and make sure its on PATH). (compatibility ranges require calculation) 

## Notation
- This is a, consolidation and update and upgrade, of multiple of my other programs.

### Development
- TBA

## Disclaimer
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
