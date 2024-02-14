# utility.ps1

function Invoke-CPUStats {
    # CPU statistics functionality remains as previously described
    Clear-Host
    Write-Host "Processor Statistics:"
    $cpuLoad = Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
    Write-Host "Total CPU Load: $cpuLoad%"
    Start-Sleep -Seconds 3
}

function Invoke-NETStats {
    # Network statistics functionality remains as previously described
    Clear-Host
    Write-Host "Network Statistics:"
    $interfaces = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
    foreach ($interface in $interfaces) {
        Write-Host "Interface $($interface.Name):"
        Write-Host "    Speed: $($interface.LinkSpeed)"
    }
    Start-Sleep -Seconds 3
}

function Get-ApplicationEvents {
    # Fetch and display the last 20 application events functionality remains
    Clear-Host
    Write-Host "Application Events:"
    $applicationEvents = Get-WinEvent -LogName 'Application' -MaxEvents 20 | Select-Object TimeCreated, Id, LevelDisplayName, Message
    foreach ($event in $applicationEvents) {
        Write-Host "Time: $($event.TimeCreated), ID: $($event.Id), Level: $($event.LevelDisplayName), Message: $($event.Message.split("`n")[0])"
    }
    Start-Sleep -Seconds 3
}

function Get-SystemEvents {
    # Fetch and display the last 20 system events functionality remains
    Clear-Host
    Write-Host "System Events:"
    $systemEvents = Get-WinEvent -LogName 'System' -MaxEvents 20 | Select-Object TimeCreated, Id, LevelDisplayName, Message
    foreach ($event in $systemEvents) {
        Write-Host "Time: $($event.TimeCreated), ID: $($event.Id), Level: $($event.LevelDisplayName), Message: $($event.Message.split("`n")[0])"
    }
    Start-Sleep -Seconds 3
}
