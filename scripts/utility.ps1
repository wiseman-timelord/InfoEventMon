# utility.ps1

function Invoke-CPUMonitoring {
    while ($true) {
        # Retrieve stats first
        $cpuStats = Get-CpuStatistics

        # Now clear the screen and display the retrieved stats
        Clear-Host
        PrintProgramTitle
        
        Write-Host "CPU Name: $($cpuStats.Name)"
        Write-Host "Max Clock Speed: $($cpuStats.MaxSpeed)MHz"
        Write-Host "Current Clock Speed: $($cpuStats.CurrentSpeed)MHz"
        Write-Host "CPU Usage: $($cpuStats.Usage)%"
        Write-Host ""
        PrintProgramSeparator
        Write-Host "Press 'B' to break from the loop..."

        if ([console]::KeyAvailable) {
            $key = [console]::ReadKey($true)
            if ($key.Key -eq "B") {
                break
            }
        }

        Start-Sleep -Seconds 5
    }
    Show-PerformanceMonitorMenu
}



function Get-CpuStatistics {
    $cpuInfo = Get-CimInstance -ClassName Win32_Processor
    $cpuUsage = (Get-Counter -Counter "\Processor(_Total)\% Processor Time").CounterSamples.CookedValue
    $cpuUsageRounded = [math]::Round($cpuUsage, 1)

    return @{
        Name = $cpuInfo.Name
        MaxSpeed = $cpuInfo.MaxClockSpeed
        CurrentSpeed = $cpuInfo.CurrentClockSpeed
        Usage = $cpuUsageRounded
    }
}

function Invoke-NETMonitoring {
    while ($true) {
        Clear-Host
        PrintProgramTitle

        $networkStats = Get-NetworkStatistics
        $netAdapters = Get-NetAdapter | Where-Object Status -eq 'Up'
        
        foreach ($adapter in $netAdapters) {
            Write-Host "Name: $($adapter.Name)"
            Write-Host "Interface: $($adapter.InterfaceDescription)"
            Write-Host "Status: Up"
            Write-Host "Speed: $($adapter.LinkSpeed)"
            Write-Host "IPv4 Address: $(($adapter | Get-NetIPAddress -AddressFamily IPv4).IPAddress)"
            Write-Host "Download Rate: $($networkStats.InRate) KB/s"
            Write-Host "Upload Rate: $($networkStats.OutRate) KB/s"
			Write-Host ""
        }

        if (-not $netAdapters) {
            Write-Host "No active network adapters found."
        }

        PrintProgramSeparator
        Write-Host "Press 'B' to break from the loop..."

        if ([console]::KeyAvailable -and ([console]::ReadKey().Key -eq "B")) {
            break
        }

        Start-Sleep -Seconds 5
    }
    Show-PerformanceMonitorMenu
}



function Get-NetworkStatistics {
    $networkInterface = Get-NetAdapterStatistics | Select-Object -First 1
    if ($networkInterface -eq $null) {
        return $null
    }

    $currentInbound = $networkInterface.ReceivedBytes
    $currentOutbound = $networkInterface.SentBytes
    # Ensure the time interval and conversion factors are correctly applied.
    $inRate = (($currentInbound - $Global:LastInboundBytes_f8m) * 8 / 1024) / 5
    $outRate = (($currentOutbound - $Global:LastOutboundBytes_u4x) * 8 / 1024) / 5
    $Global:LastInboundBytes_f8m = $currentInbound
    $Global:LastOutboundBytes_u4x = $currentOutbound

    return @{
        InRate = [math]::Round($inRate, 1)
        OutRate = [math]::Round($outRate, 1)
    }
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
