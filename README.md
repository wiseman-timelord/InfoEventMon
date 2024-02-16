# InfoEventMon

### Status
Beta - Was all going fine, but after a day of trying to get the Directx Information display to show more than 1 device, I'm wasting time on this now, that could go on other projects; this project will require re-visiting later. However, one more thing before I finish on it...
- Update batch launcher, to not automatically clean the log every time the powershell script exits, and instead have an option for this on the menu.
- Make an installer, and move the create ".\cache" folder to it, instead of it running every time. (yes just that).

## Description
A consolidation of, Performancer and WhaGoWan and some code from LLmPsBot~, into a single program "InfoEventMon". InfoEventMon is a tool for, System Information, Device Monitoring, System Events, in one place. It displays stuff basically, and the information it displays uses useful code for other powershell projects.

### Features
- **CPU/Network Monitoring:** Monitor the performance of your, Processor or Network, see `Preview` section below.
- **DirectX Information:** Output the popular information relevant to a DxDiag report, without having to sift through garbage.
- **Application/System Events:** Export recent events to a relevantly relating `ProgramEvents.Txt/SystemEvents.Txt`, with options to launch notepad and view it.  

### Preview
The Main Menu (there are submenus for each)...
```
=========================( PerfEventMon )=========================











                     1. Performance Monitor,

                     2. DirectX Information,

                     3. Recent Events Report.










---------------------------------------------------------------
Select, Options = 1-3, Exit = X: :

```
- Monitoring of Processor...
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
- DirectX Information for System (report overdue timer 30m)...
```
=========================( InfoEventMon )==========================

Checking Report..
..Report Overdue..
..Generating Report..
..Report Ready.

System Information:
Machine name: A320MPRO-F
Operating System: Windows 10 Pro 64-bit (10.0, Build 19041) (190...
Language: English (Regional Setting: English)
System Model: A320M Pro4-F
BIOS: P7.40 (type: UEFI)
Processor: AMD Ryzen 9 3900X 12-Core Processor             (24 C...
Memory: 65536MB RAM
Windows Dir: C:\Windows
DirectX Version: DirectX 12

-------------------------------------------------------------------
Select; Back = B:

```
- Recent events report for System...
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
1. Unpack the program to a sensible location, sensible locations do NOT include, "C:\Program Files" or "C:\Program Files(x86)", though it may work in those locations.
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
- It is deemed a somewhat faster system upgrade including, sorting parts and case removal and installation, would take 30 minutes minimum, hence valid Direct X report must be generated within 30 minutes.  

### Development
- DirectX Information: it needs to detect up to 2 graphics cards and upto 3 sound devices (to fit in space). 
- DirectX Information: options for, "Disk & DVD/CD-ROM Drives" and "DirectInput Devices", probably fit multiple of each per page.

## Disclaimer
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
