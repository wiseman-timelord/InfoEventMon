# main.ps1

# Imports
. .\scripts\display.ps1
. .\scripts\utility.ps1

# Global Variables
$Global:LastInboundBytes_f8m = 0
$Global:LastOutboundBytes_u4x = 0
$Global:reportPath_s9v = ".\cache\dxdiagReport.txt"
$Global:FetchedInfo_9vb = @{}
$Global:FetchedInfo_99c = @{}
$Global:FetchedInfo_999 = @{}
$Global:infoKeys_5f4 = @{
    "System" = @("Machine name", "Operating System", "Language", "System Model", "BIOS", "Processor", "Memory", "Windows Dir", "DirectX Version")
    "Graphics" = @("Manufacturer", "Card name", "Dedicated Memory", "Feature Levels", "Monitor Model", "Monitor Name", "Native Mode", "Current Mode")
    "Audio" = @("Driver Provider", "Description", "Min/Max Sample Rate")
}
$Global:deviceCounts = @{
    "System" = 1
    "Graphics" = 2
    "Audio" = 3
}


# Initialize program
function script-InitializationCode {
	Write-Host "Configuring Display.."
	Start-Sleep -Seconds 1
	Set-ConfigureDisplay
	PrintProgramTitle
    Write-Host "`..Display Configured`n"
	Start-Sleep -Seconds 1
	Write-Host "Powershell Script Initialized...`n"
    Start-Sleep -Seconds 2
}

# Exit Program
function script-FinalizationCode {
    [Console]::Clear()
    Write-Host "`n...Powershell Script Exiting..."
    Start-Sleep -Seconds 2
}

# Main application loop
function Start-MainLoop {
    do {
        Clear-Host
        Show-MainMenu
    } while ($true)
}

# Application Entry Point
script-InitializationCode
Start-MainLoop
script-FinalizationCode