# main.ps1

# Imports
. .\scripts\display.ps1
. .\scripts\utility.ps1

# Global Variables
$Global:LastInboundBytes_f8m = 0
$Global:LastOutboundBytes_u4x = 0
$Global:reportPath_s9v = ".\cache\dxdiagReport.txt"
$Global:FetchedInfo1_9vb = @{}
$Global:FetchedInfo2_gv3 = @{}

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
    Write-Host "`n....Powershell Script Exiting.`n"
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