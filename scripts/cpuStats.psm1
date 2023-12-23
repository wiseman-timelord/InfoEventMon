function Get-CPUStatistic {
    param (
        [string]$Name,
        [scriptblock]$Command,
        [string]$FormatString = ""
    )
    try {
        $result = & $Command
        if ($FormatString -ne "") {
            $result = $result -f $FormatString
        }
        Write-Host "$(Name): $result"
    } catch {
        Write-Host "Error fetching $Name"
    }
}

function Invoke-CPUStats {
    $displayEscMessage = $true

    while ($true) {
        Display-Title

        # Processor Statistics
        try {
            Write-Host "`n                   Processor Statistics:`n" -ForegroundColor Green
            $cpuLoad = Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
            Write-Host "                    Total CPU Load: $cpuLoad%"

            $cpuFrequencyInfo = Get-WmiObject Win32_Processor | Select-Object CurrentClockSpeed, ExtClock
            if ($cpuFrequencyInfo) {
                Write-Host "                  Internal Clock: $($cpuFrequencyInfo.CurrentClockSpeed) MHz"
                Write-Host "                  External Clock: $($cpuFrequencyInfo.ExtClock) MHz"
            }

        } catch {
            Write-Host "Error fetching CPU Stats"
        }

        if ($displayEscMessage) {
            Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n`nPress Esc to break the loop..."
        }

        if ([console]::KeyAvailable) {
            $key = [console]::ReadKey($true)
            if ($key.Key -eq [ConsoleKey]::Escape) {
                $displayEscMessage = $false
                Clear-Host
                Display-Title
                Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`nPress, Space To Continue Or Esc For Main Menu: "
                do {
                    $key = [console]::ReadKey($true)
                } while ($key.Key -ne [ConsoleKey]::Escape -and $key.Key -ne [ConsoleKey]::Spacebar)

                if ($key.Key -eq [ConsoleKey]::Escape) {
                    break
                }

                $displayEscMessage = $true
            }
        }

        Start-Sleep -Seconds 3
    }
}

Export-ModuleMember -Function Get-CPUStatistic, Invoke-CPUStats