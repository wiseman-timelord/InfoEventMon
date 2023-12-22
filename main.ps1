# Initialization
$Host.UI.RawUI.ForegroundColor = 'Yellow'
.\cpuStats.ps1
.\gpuStats.ps1
.\soundStats.ps1
.\networkStats.ps1

# Artwork
function Display-Title {
    Clear-Host
    Write-Host "`n===================( " -NoNewline -ForegroundColor Cyan
    Write-Host "PerforMancer-BaP7" -NoNewline
    Write-Host " )====================`n" -ForegroundColor Cyan
}

# Main Menu
while ($true) {
    Display-Title
    Write-Host "                    Stat Theme Selection`n"
    Write-Host "                    1. CPU (Processors)"
    Write-Host "                    2. GPU (Graphics)"
    Write-Host "                    3. AUD (Sound)"
    Write-Host "                    4. NET (Connections)`n"
    Write-Host "                    0. Exit Program`n"
    $choice = Read-Host "Enter your choice (0-4)"
    switch ($choice) {
        "1" { Run-CPUStats }
        "2" { Run-GPUStats }
        "3" { Run-SoundStats }
        "4" { Run-NetworkStats }
        "0" { exit }
        default { Write-Host "Invalid choice. Please try again." }
    }
    Start-Sleep -Seconds 1
}
