# InfoEventMon

### Status
Alpha; Consolidating, Performancer and WhaGoWan and maybe some other half-developed ones, into a single program "InfoEventMon", for system monitoring, device info and recent events...
1. Progress submenu options for "Device Information" to completion; Options on Submenu have been refined to, System, Graphics, Sound... 
- Layout of text needs work.
- if report is over 30 minutes long, then generate new report.
- it needs to detect up to 2 graphics cards and upto 3 sound devices (to fit in space). 
- add a drive info option to submenu, limit info per dive or drives to number or do horizontally.
2. the prompts for monitoring require instant activation of keypresses, so, all functions must now have this for consistency.

## Description
InfoEventMon Will become a tool for, System Information, Device Monitoring, System Events, in one place, it will all be done through cmdlets, so, dont expect much.

### Features
- **CPU/Network Monitoring:** Monitor the performance of your, Processor or Network, see `Preview` section below.
- **DirectX Information:** Output the popular information relevant to a DxDiag report, without having to sift through garbage.
- **Application/System Events:** Export recent events to a relevantly relating `ProgramEvents.Txt/SystemEvents.Txt`, with options to launch notepad and view it.  

### Preview
The Main Menu (those are submenus)...
```
=========================( PerfEventMon )=========================











                     1. Performance Monitor,

                     2. DirectX Information,

                     3. Recent Events Report.










---------------------------------------------------------------
Select, Options = 1-3, Exit = X: :

```
- DirectX Information for System/Graphics/Audio...
```
=========================( InfoEventMon )==========================

Checking For Report..
Graphics Information:
Manufacturer: To Be Filled By O.E.M.
Card name: Radeon (TM) RX 470 Graphics
Dedicated Memory: 8171 MB
Feature Levels: 12_0,11_1,11_0,10_1,10_0,9_3,9_2,9_1
Monitor Model: UMC SHARP
Monitor Name: Generic PnP Monitor
Native Mode: 1366 x 768(p) (59.964Hz)
Current Mode: 2000 x 1126 (32 bit) (55Hz)

-------------------------------------------------------------------
Select; Back = B:

```
- Monitoring of Processor/Network...
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

```
- Produce and open, Apps/System Events reports...
```
=========================( InfoEventMon )==========================

Requesting System Events..
..System Events Received.

Exporting Report to SystemEvents.Log..
..SystemEvents.Log Report Exported.

-------------------------------------------------------------------
Select; Open = O, Back = B:

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
