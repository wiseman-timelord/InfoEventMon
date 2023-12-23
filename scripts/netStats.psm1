function Get-NETStatistic {
    param (
        [string]$AdapterName,
        [ref]$initialStats,
        [ref]$previousStats,
        [ref]$idleStartTime
    )

    try {
        $stats = Get-NetAdapterStatistics -Name $AdapterName

        # Initialize statistics for new adapters
        if (-not $initialStats.Value[$AdapterName]) {
            $initialStats.Value[$AdapterName] = $stats
            $idleStartTime.Value[$AdapterName] = Get-Date
        }

        # Calculate data rates and total data
        $dataInRate = 0
        $dataOutRate = 0
        if ($previousStats.Value[$AdapterName]) {
            $dataInRate = "{0:N2}" -f (($stats.ReceivedBytes - $previousStats.Value[$AdapterName].ReceivedBytes) / 1 / 1024)
            $dataOutRate = "{0:N2}" -f (($stats.SentBytes - $previousStats.Value[$AdapterName].SentBytes) / 1 / 1024)
        }

        # Update idle time
        if ([double]$dataInRate -gt 100 -or [double]$dataOutRate -gt 100) {
            $idleStartTime.Value[$AdapterName] = Get-Date
        }

        # Prepare and return the statistics
        $idleTime = (Get-Date) - $idleStartTime.Value[$AdapterName]
        $idleTimeString = "{0:D2}:{1:D2}:{2:D2}" -f $idleTime.Hours, $idleTime.Minutes, $idleTime.Seconds

        $netStat = @{
            AdapterName   = $AdapterName
            DataInRate    = $dataInRate
            DataOutRate   = $dataOutRate
            IdleTime      = $idleTimeString
        }

        # Store current stats for next iteration
        $previousStats.Value[$AdapterName] = $stats

        return $netStat
    } catch {
        Write-Host "Error fetching statistics for adapter: $AdapterName"
        return $null
    }
}


function Invoke-NETStats {
    $previousStats = @{}
    $initialStats = @{}
    $idleStartTime = @{}
    $displayEscMessage = $true

    while ($true) {
        Display-Title

        Write-Host "Network Statistics:`n" -ForegroundColor Green

        $adapters = Get-NetAdapter
        foreach ($adapter in $adapters) {
            $netStat = Get-NETStatistic -AdapterName $adapter.Name `
                                        -initialStats ([ref]$initialStats) `
                                        -previousStats ([ref]$previousStats) `
                                        -idleStartTime ([ref]$idleStartTime)

            if ($netStat -ne $null) {
                Write-Host ("Adapter: {0} - Idle Time: {1}`nData In Rate: {2} KB/s, Data Out Rate: {3} KB/s" -f $netStat.AdapterName, $netStat.IdleTime, $netStat.DataInRate, $netStat.DataOutRate)
            }
        }

        # Additional IP Configuration and Throughput Stats (already in script)

        if ($displayEscMessage) {
            Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`nPress Esc to break the loop..."
        }

        if ([console]::KeyAvailable) {
            $key = [console]::ReadKey($true)
            if ($key.Key -eq [ConsoleKey]::Escape) {
                $displayEscMessage = $false
                Clear-Host
                Display-Title
                Write-Host "`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`n`nPress, Space To Continue Or Esc For Main Menu: "
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

Export-ModuleMember -Function Invoke-NETStats