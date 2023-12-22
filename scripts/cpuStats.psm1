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

        Start-Sleep -Seconds 3
    }
}

Export-ModuleMember -Function Get-CPUStatistic, Invoke-CPUStats
