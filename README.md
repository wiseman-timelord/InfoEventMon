# InfoEventMon

### Status
Alpha, Consolidating, Performancer and WhaGoWan, into a single program "PerfEvent", for system monitoring and recent events...
1. Progress submenu options for "Performance Monitor" to completion. This includes..
- Test and fix "Processor Monitoring".
- Test and fix "Network Monitoring".
2. Progress submenu options for "Device Information" to completion; this may have to result in usage of DirectX.

## Description
InfoEventMon Will become a tool for, System Information, Device Monitoring, System Events, in one place, it will all be done through cmdlets, so, dont expect much.

### Features
**Application/System Events Report:** Export recent events to a relevantly relating `ProgramEvents.Txt/SystemEvents.Txt`.  

### Preview
The Main Menu...
```
=========================( PerfEventMon )=========================











                     1. Performance Monitor,

                     2. Device Information,

                     3. Recent Events Report.










---------------------------------------------------------------
Select, Options = 1-3, Exit = X: :

```
- Monitoring Options (both screens)...
```

=========================( InfoEventMon )=========================

CPU Name: AMD Ryzen 9 3900X 12-Core Processor
Max Clock Speed: 3801MHz
Current Clock Speed: 3793MHz
CPU Usage: 9.1%

---------------------------------------------------------------
Select; Back = B

=========================( InfoEventMon )=========================

Name: Ethernet
Interface: Realtek PCIe GbE Family Controller
Status: Up
Speed: 1 Gbps
IPv4 Address: 192.168.1.2
Download Rate: 15.4 KB/s
Upload Rate: 13.5 KB/s
Discards Total: 0
Errors Total: 0

---------------------------------------------------------------
Select; Back = B


```

## Usage
1. Unpack the program to a sensible location, sensible locations do not include, "C:\Program Files" or "C:\Program Files(x86)", though it may work in those locations.
2. Run `InfoEventMon.Bat`, select `Option 1`, the `main.ps1` script will then load.
3. Navigate the menus, select your options, as you prefer. 
4. Navigate `Back` to the main menu, then `Exit` the program, then `Exit` the Launcher.

### Requirements
To be detailed.
- Windows supporting Batch operations (compatibility ranges require calculation).
- .Net 2.0+ - Breaking a loop is impossible otherwise, check out [SystemConfig](https://github.com/wiseman-timelord/SystemConfig) for offline install of .net 3.5 if your having issues.
- DirectX - For Device Information (compatibility ranges require calculation).
- PowerShell - Check out, [PWSH 7.4](https://github.com/PowerShell/PowerShell/releases/tag/v7.4.0) (and make sure its on PATH) or [PWSH 7.4 MSI](https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/PowerShell-7.4.0-win-x64.msi), if your having issues. 

## Notation
- This is a, consolidation and update and upgrade, of multiple of my other programs.

### Development
- introduce new main menu item "Drirect X Stats~", to extend the stat/info past the limits of cmdlets.

## Disclaimer
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
