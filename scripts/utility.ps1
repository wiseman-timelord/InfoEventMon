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


function Get-EventsReport {
    param (
        [ValidateSet("Application", "System")]
        [string]$EventType
    )
    Clear-Host
    PrintProgramTitle
    $eventTypeName = if ($EventType -eq "Application") { "Program" } else { "System" }
    Write-Host "Requesting $eventTypeName Events.."

    $logName = "$EventType"
    $events = Get-WinEvent -LogName $logName -MaxEvents 20 | Select-Object TimeCreated, Id, LevelDisplayName, Message
    Write-Host "..$eventTypeName Events Received.`n"
    Start-Sleep -Seconds 1

    $fileName = if ($EventType -eq "Application") { "ProgramEvents.Log" } else { "SystemEvents.Log" }
    Write-Host "Exporting Report to $fileName.."
    $report = @()
    foreach ($event in $events) {
        $report += "Time: $($event.TimeCreated), ID: $($event.Id), Level: $($event.LevelDisplayName), Message: $($event.Message.split("`n")[0])"
    }
    $report | Out-File -FilePath $fileName -Force
    Write-Host "..$fileName Report Exported.`n"
    Start-Sleep -Seconds 1
    Write-Host "Check Event Report File; Returning To Menu...`n"
    Start-Sleep -Seconds 2
    Show-RecentEventsMenu
}
