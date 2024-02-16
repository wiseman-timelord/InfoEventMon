# utility.ps1

function Invoke-CPUMonitoring {
    while ($true) {
        $cpuStats = Get-CpuStatistics 

        Clear-Host
        PrintProgramTitle
        
        Write-Host "CPU Name: $($cpuStats.Name)"
        Write-Host "Maximum Threads: $($cpuStats.Threads)"  # Display the number of threads
        Write-Host "Maximum Clock Speed: $($cpuStats.MaxSpeed)MHz"
        Write-Host "Current Clock Speed: $($cpuStats.CurrentSpeed)MHz"
        Write-Host "CPU Usage: $($cpuStats.Usage)%"
        Write-Host ""
        PrintProgramSeparator
        Write-Host "Select; Back = B"
		Write-Host "Refreshing In 5 Seconds..."

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
        Threads = $cpuInfo.ThreadCount
    }
}


function Invoke-NETMonitoring {
    while ($true) {
        # Fetch stats before clearing the screen
        $networkStats = Get-NetworkStatistics
        $netAdapters = Get-NetAdapter | Where-Object Status -eq 'Up'

        Clear-Host
        PrintProgramTitle

        foreach ($adapter in $netAdapters) {
            Write-Host "NIC Name: $($adapter.InterfaceDescription)"
            Write-Host "Status: Up"
            Write-Host "Speed: $($adapter.LinkSpeed)"
            Write-Host "IPv4 Address: $(($adapter | Get-NetIPAddress -AddressFamily IPv4).IPAddress)"
            Write-Host "Download Rate: $($networkStats.InRate) KB/s"
            Write-Host "Upload Rate: $($networkStats.OutRate) KB/s"
            Write-Host "Discards Total: $($networkStats.Discards)"
            Write-Host "Errors Total: $($networkStats.Errors)"
            Write-Host ""
        }

        if (-not $netAdapters) {
            Write-Host "No active network adapters found."
        }

        PrintProgramSeparator
        Write-Host "Select; Back = B"
		Write-Host "Refreshing In 5 Seconds..."

        if ([console]::KeyAvailable -and ([console]::ReadKey().Key -eq "B")) {
            [console]::ReadKey($true)
            break
        }

        Start-Sleep -Seconds 5
    }
    Show-PerformanceMonitorMenu
}

function Get-NetworkStatistics {
    $networkInterface = Get-NetAdapterStatistics | Select-Object -First 1
    if ($networkInterface -eq $null) {
        return @{
            InRate = 0
            OutRate = 0
            Discards = 0
            Errors = 0
        }
    }

    $currentInbound = $networkInterface.ReceivedBytes
    $currentOutbound = $networkInterface.SentBytes
    $inRate = (($currentInbound - $Global:LastInboundBytes_f8m) * 8 / 1024) / 5
    $outRate = (($currentOutbound - $Global:LastOutboundBytes_u4x) * 8 / 1024) / 5
    $Global:LastInboundBytes_f8m = $currentInbound
    $Global:LastOutboundBytes_u4x = $currentOutbound
    $discardsTotal = if ($networkInterface.PacketsReceivedDiscarded) {$networkInterface.PacketsReceivedDiscarded} else {0}
    $errorsTotal = if ($networkInterface.PacketsReceivedErrors) {$networkInterface.PacketsReceivedErrors} else {0}

    return @{
        InRate = [math]::Round($inRate, 1)
        OutRate = [math]::Round($outRate, 1)
        Discards = $discardsTotal
        Errors = $errorsTotal
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
    $cacheDir = ".\cache"
    if (-not (Test-Path -Path $cacheDir)) {
        New-Item -ItemType Directory -Path $cacheDir
    }
    $fileName = if ($EventType -eq "Application") { "ProgramEvents.Log" } else { "SystemEvents.Log" }
    $filePath = Join-Path -Path $cacheDir -ChildPath $fileName
    Write-Host "Exporting Report to $fileName.."
    $report = @()
    foreach ($event in $events) {
        $report += "Time: $($event.TimeCreated), ID: $($event.Id), Level: $($event.LevelDisplayName), Message: $($event.Message.split("`n")[0])"
    }
    $report | Out-File -FilePath $filePath -Force
    Write-Host "..$fileName Report Exported.`n"
    Start-Sleep -Seconds 1
    # Prompt the user for next action
	PrintProgramSeparator
    $userChoice = Read-Host "Select; Open = O, Back = B"
    switch ($userChoice.ToLower()) {
        "o" { Write-Host "Opening Report; Returning To Menu..";Start-Sleep -Seconds 1; Start-Process notepad.exe -ArgumentList $filePath;Start-Sleep -Seconds 1 }
        "b" { Write-Host "Returning To Menu..";Start-Sleep -Seconds 1}
        default { Write-Host "Invalid choice. Returning To Menu.."; Start-Sleep -Seconds 2
        }
    }
    Show-RecentEventsMenu
}

# The sections requiring update below here...

# Generate DirectX Report
function CheckAndGenerateDirectXReport {
    $reportPath = $Global:reportPath_s9v
    Write-Host "Checking Report.."
    $reportExists = Test-Path -Path $reportPath
    $reportIsOld = $false
    if ($reportExists) {
        $reportAge = (Get-Date) - (Get-Item $reportPath).LastWriteTime
        if ($reportAge.TotalMinutes -gt 30) {
            Write-Host "..Report Overdue.."
            $reportIsOld = $true
        }
    }
    if (-not $reportExists -or $reportIsOld) {
        Write-Host "..Generating Report.."
        $cacheDir = Split-Path -Path $reportPath -Parent
        Start-Process "dxdiag" -ArgumentList "/dontskip /t `"$reportPath`"" -NoNewWindow -Wait
        Write-Host "..Report Ready.`n"
    } else {
        Write-Host "..Using Current Report.`n"
    }
}

# Retrieve Information From Direct X Report
function RetrieveDataFromReportAndPopulateLists {
    $reportPath = $Global:reportPath_s9v
    $content = Get-Content -Path $reportPath -Raw

    # Resetting dictionaries
    $Global:FetchedInfo_9vb.Clear()
    $Global:FetchedInfo_99c.Clear()
    $Global:FetchedInfo_999.Clear()

    function ProcessDeviceInfo {
        param (
            [string]$deviceSection,
            [string]$deviceType,
            [int]$deviceIndex
        )
        $dict = switch ($deviceIndex) {
            0 { $Global:FetchedInfo_9vb }
            1 { $Global:FetchedInfo_99c }
            2 { $Global:FetchedInfo_999 }
            default { $null }
        }
        if ($dict -eq $null) {
            return
        }
        foreach ($key in $Global:infoKeys_5f4[$deviceType]) {
            if ($deviceSection -match "${key}: (.*?)`r?`n") {
                $value = $matches[1].Trim()
                $dict[$key] = $value
            }
        }
    }

    # System - Only one expected
    if ($content -match "(?s)------------------\r?\nSystem Information\r?\n------------------(.*?)------------------") {
        ProcessDeviceInfo -deviceSection $matches[1] -deviceType "System" -deviceIndex 0
    }

    # Graphics - Handle up to 2 devices
    $graphicsMatches = [regex]::Matches($content, "(?s)---------------\r?\nDisplay Devices\r?\n---------------(.*?)(?=---------------|$)")
    for ($i = 0; $i -lt [Math]::Min($graphicsMatches.Count, 2); $i++) {
        ProcessDeviceInfo -deviceSection $graphicsMatches[$i].Value -deviceType "Graphics" -deviceIndex $i
    }

    # Audio - Handle up to 3 devices
    $audioMatches = [regex]::Matches($content, "(?s)-------------\r?\nSound Devices\r?\n-------------(.*?)(?=-------------|$)")
    for ($i = 0; $i -lt [Math]::Min($audioMatches.Count, 3); $i++) {
        ProcessDeviceInfo -deviceSection $audioMatches[$i].Value -deviceType "Audio" -deviceIndex $i
    }
}