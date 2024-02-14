# main.ps1

# Imports
. .\scripts\display.ps1
. .\scripts\utility.ps1

# Initialize program
function script-InitializationCode {
    PrintProgramTitle
	Set-ConfigureDisplay
	PrintProgramTitle
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

        # The handling of user input is now fully managed within the display.ps1 script
        # This simplifies the main script, focusing on application initialization and looping

    } while ($true) # The exit condition is now managed within the Show-MainMenu function based on user input
}

# Application Entry Point
script-InitializationCode
Start-MainLoop
script-FinalizationCode