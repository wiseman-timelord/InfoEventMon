# display.ps1

function PrintProgramTitle {
    Write-Host "`n=========================( InfoEventMon )==========================`n"
}

function PrintProgramSeparator {
    Write-Host "-------------------------------------------------------------------"
}

# Sets the window title and size, adjusting the console properties
function Set-ConfigureDisplay {
    Write-Host "`nDisplay Configuration.."
	[Console]::ForegroundColor = [ConsoleColor]::White
    [Console]::BackgroundColor = [ConsoleColor]::DarkGray
    Write-Host "..Restarting Display..`n"
	[Console]::Clear()
}

function Show-MainMenu {
    Clear-Host
	PrintProgramTitle
    Write-Host "`n`n`n`n`n`n`n`n`n"
    Write-Host "                     1. Performance Monitor,`n"
    Write-Host "                     2. DirectX Information,`n"
    Write-Host "                     3. Recent Events Report."
    Write-Host "`n`n`n`n`n`n`n`n`n"
    PrintProgramSeparator
    $choice = Read-Host "Select; Options = 1-3, Exit = X"

    switch ($choice) {
        "1" { Show-PerformanceMonitorMenu }
        "2" { Show-DeviceInfoMenu }
        "3" { Show-RecentEventsMenu }
        "x" { script-FinalizationCode; exit }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-MainMenu
        }
    }
}

function Show-PerformanceMonitorMenu {
    Clear-Host
    PrintProgramTitle
	Write-Host "`n`n`n`n`n`n`n`n`n`n"
    Write-Host "                    1. Processor Monitoring,`n"
    Write-Host "                    2. Network Monitoring."
	Write-Host "`n`n`n`n`n`n`n`n`n`n"
    PrintProgramSeparator
    $choice = Read-Host "Select; Options = 1-2, Back = B"

    switch ($choice) {
        "1" { Invoke-CPUMonitoring }
        "2" { Invoke-NETMonitoring }
        "b" { Show-MainMenu }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-PerformanceMonitorMenu
        }
    }
}

function Show-DeviceInfoMenu {
    Clear-Host
    PrintProgramTitle
    Write-Host "`n`n`n`n`n`n`n`n`n"
    Write-Host "                     1. System Information,`n"
    Write-Host "                     2. Graphics Information,`n"
    Write-Host "                     3. Audio Information."
    Write-Host "`n`n`n`n`n`n`n`n`n"
    PrintProgramSeparator
    $choice = Read-Host "Select; Options = 1-3, Back = B"

    switch ($choice) {
        "1" { Show-Information -Type "System" }
        "2" { Show-Information -Type "Graphics" }
        "3" { Show-Information -Type "Audio" }
        "b" {
            Write-Host "Returning To Main Menu..."
            Start-Sleep -Seconds 1
            Show-MainMenu
        }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-DeviceInfoMenu
        }
    }
}

function Show-Information {
    param ([string]$Type)
    Clear-Host
    PrintProgramTitle
    CheckAndGenerateDirectXReport
    RetrieveDataFromReportAndPopulateLists
    Write-Host "$Type Information:"
    if ($Global:infoKeys_5f4.ContainsKey($Type)) {
        foreach ($key in $Global:infoKeys_5f4[$Type]) {
            if ($Global:FetchedInfo_9vb.ContainsKey($key)) {
                $value = $Global:FetchedInfo_9vb[$key]
                $maxValueLength = 67 - ($key.Length + 2)
                if ($value.Length -gt $maxValueLength) {
                    $value = $value.Substring(0, $maxValueLength - 3) + "..."
                }
                Write-Host "${key}: $value"
            }
        }
    } else {
        Write-Host "Error Retrieving $Type Info!"
    }
    Write-Host ""
    PrintProgramSeparator
    $userChoice = Read-Host "Select; Back = B"
    if ($userChoice -eq 'B' -or $userChoice -eq 'b') {
        Write-Host "Returning To Submenu..."
        Start-Sleep -Seconds 1
        Show-DeviceInfoMenu
    } else {
        Write-Host "Invalid selection. Returning to Submenu..."
        Start-Sleep -Seconds 1
        Show-DeviceInfoMenu
    }
}

function Show-RecentEventsMenu {
    Clear-Host
    PrintProgramTitle
    Write-Host "`n`n`n`n`n`n`n`n`n`n"
    Write-Host "                     1. Recent Program Events,`n"
    Write-Host "                     2. Recent System Events."
    Write-Host "`n`n`n`n`n`n`n`n`n`n"
    PrintProgramSeparator
    $choice = Read-Host "Select; Options = 1-2, Back = B"

    switch ($choice) {
        "1" { Get-EventsReport -EventType "Application" }
        "2" { Get-EventsReport -EventType "System" }
        "b" { Show-MainMenu }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-RecentEventsMenu
        }
    }
}

