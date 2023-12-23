# Initialization
$Host.UI.RawUI.ForegroundColor = 'Yellow'

# Import the modules from the 'scripts' directory
Import-Module .\scripts\cpuStats.psm1
Import-Module .\scripts\gpuStats.psm1
Import-Module .\scripts\audStats.psm1
Import-Module .\scripts\netStats.psm1

# Artwork
function Display-Title {
    # Start-Sleep -Seconds 10   #-- keep for debug
	Clear-Host
    Write-Host "`n===================( " -NoNewline -ForegroundColor Cyan
    Write-Host "Performancer-P7" -NoNewline
    Write-Host " )====================`n`n`n`n`n`n`n`n`n`n`n" -ForegroundColor Cyan
}

# Main Menu
while ($true) {
    Display-Title
    Write-Host "                    Stat Theme Selection`n"
    Write-Host "                    1. CPU (Processors)"
    Write-Host "                    2. GPU (Graphics)"
    Write-Host "                    3. AUD (Sound)"
    Write-Host "                    4. NET (Connections)`n"
    Write-Host "                    0. Exit Program`n`n`n`n`n`n`n`n`n`n`n"
    $choice = Read-Host "Enter your choice (1-0)"
    switch ($choice) {
        "1" { Invoke-CPUStats }
        "2" { Invoke-GPUStats }
        "3" { Invoke-AUDStats }
        "4" { Invoke-NETStats }
        "0" { exit }
        default { Write-Host "Invalid choice. Please try again." }
    }
    Start-Sleep -Seconds 1
}
