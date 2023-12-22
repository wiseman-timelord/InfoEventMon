$Host.UI.RawUI.ForegroundColor = 'Yellow'

while ($true) {
    Clear-Host
    Write-Host "`n===================( " -NoNewline -ForegroundColor Cyan
    Write-Host "PerforMancer-BaPs" -NoNewline
    Write-Host " )====================`n`n`n`n`n`n`n`n" -ForegroundColor Cyan
    Write-Host "                    Stat Theme Selection`n"
    Write-Host "                    1. CPU (Processors)"
    Write-Host "                    2. GPU (Graphics)"
    Write-Host "                    3. AUD (Sound)"
    Write-Host "                    4. NET (Connections)`n"
    Write-Host "                    0. Exit Program`n`n`n`n`n`n`n`n`n"

    $choice = Read-Host "Enter your choice (1-0)"
    switch ($choice) {
        "1" { Start-Process pwsh -ArgumentList "-NoExit -File .\cpuStats.ps1" }
        "2" { Start-Process pwsh -ArgumentList "-NoExit -File .\gpuStats.ps1" }
        "3" { Start-Process pwsh -ArgumentList "-NoExit -File .\soundStats.ps1" }
        "4" { Start-Process pwsh -ArgumentList "-NoExit -File .\networkStats.ps1" }
        "0" { exit }
        default { Write-Host "Invalid choice. Please try again." }
    }
    Start-Sleep -Seconds 1
}
