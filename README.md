# PerfEvent

## STATUS: Development (O_o/'
Alpha, Consolidating, Performancer and WhaGoWan, into a single program "PerfEvent", for system monitoring and recent events.
- Produce initial scripts
- Work on scripts.
- introduce new main menu item "Drirect X Stats~", to extend the stat/info past the limits of cmdlets.


## DESCRIPTION:
Performancer is a Batch and PWSH 7.4-based system monitoring tool. It offers a text-based interface for real-time CPU and network stats, with limited GPU and audio data due to PWSH 7.4 constraints. Its modular design allows for efficient, isolated processing of different system metrics, ensuring cross-platform compatibility and ease of use. The tool stands out for its dynamic updating capability, user-friendly interface, and customizable appearance, making it a practical solution for diverse system performance monitoring needs.

## FEATURES:
- **Comprehensive System Monitoring:** Offers real-time insights into key system performance metrics, including CPU load, clock speeds, network data transfer rates, and more.
- **Modular Functionality:** Equipped with separate modules for CPU, GPU, Audio, and Network statistics, enabling focused monitoring on specific aspects of system performance.
- **Dynamic User Interface:** Features an interactive and user-friendly main menu, allowing easy navigation and selection of different statistical views.
- **Real-Time Updates:** Continuously refreshes performance data at regular intervals, ensuring up-to-date monitoring.
- **Customizable Display:** Users can personalize the console's appearance, including text color and console dimensions, for an enhanced user experience.
- **Error Handling Capabilities:** Incorporates basic error handling within each module, ensuring reliable operation and feedback in case of issues.

## USAGE:
1. Run the "Performancer.bat" file to initiate the program. This batch file sets up the environment and launches the main PowerShell script, or otherwise just run the `main.ps1` powershell script in whatever OS you are in.
2. Upon launch, the program displays the main menu, presenting options to view CPU, GPU, Audio, and Network statistics.
3. Choose the desired option (CPU, GPU, Audio, Network) by entering the corresponding number. Each choice leads to a specific module displaying real-time statistics.
4. The CPU and Network statistics modules provide some performance metrics, updated continuously. Note that GPU and Audio statistics are placeholders, demonstrating the limitations of PowerShell 7.4.
5. If you are on the main menu, you may exit the program, select the 'Exit Program' option from the main menu.

## INTERFACE:
```
===================( Performancer )====================












                    Stat Theme Selection

                    1. CPU (Processors)
                    2. GPU (Graphics)
                    3. AUD (Sound)
                    4. NET (Connections)

                    0. Exit Program











Enter your choice (1-0):

```
```

===================( Performancer )====================













                   Processor Statistics:

                    Total CPU Load: 1%
                  Internal Clock: 3800 MHz
                  External Clock: 100 MHz










Press Esc to break the loop...

```

## REQUIREMENTS:
- Batch Support for `Performancer.Bat` Launcher.
- [PWSH 7.4](https://github.com/PowerShell/PowerShell/releases/tag/v7.4.0) for other scripts (Windows x64 `.msi` installer [here](https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/PowerShell-7.4.0-win-x64.msi)) 

## NOTATION:
This project was originally intended as the first of my attempts to merge smaller projects, specifically, NetForm and StatStream, however, this became somewhat impossible to do pure in PWSH 7.4 when I realised these programs, were, written in Python or required Windows components or required libraries.

## DISCLAIMER
This software is subject to the terms in License.Txt, covering usage, distribution, and modifications. For full details on your rights and obligations, refer to License.Txt.
