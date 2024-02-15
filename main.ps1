# main.ps1

# Imports
. .\scripts\display.ps1
. .\scripts\utility.ps1

# Global Variables
$Global:LastInboundBytes_f8m = 0
$Global:LastOutboundBytes_u4x = 0
$Global:reportPath_s9v = ".\cache\dxdiagReport.txt"

# Initialize program
function script-InitializationCode {
    PrintProgramTitle
	Set-ConfigureDisplay
	PrintProgramTitle
	Ensure-CacheDirectory
    Start-Sleep -Seconds 1
	Write-Host "`nPowershell Script Initialized...`n"
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