function Invoke-NETStats {
    $previousStats = @{}
    $initialStats = @{}
    $idleStartTime = @{}

    while ($true) {
        Display-Title

        Write-Host "Network Statistics:`n" -ForegroundColor Green

        $adapters = Get-NetAdapter
        foreach ($adapter in $adapters) {
            try {
                $stats = Get-NetAdapterStatistics -Name $adapter.Name

                # Initialize statistics for new adapters
                if (-not $initialStats[$adapter.Name]) {
                    $initialStats[$adapter.Name] = $stats
                    $idleStartTime[$adapter.Name] = Get-Date
                }

                # Calculate data rates and total data
                $dataInRate = 0
                $dataOutRate = 0
                if ($previousStats[$adapter.Name]) {
                    $dataInRate = "{0:N2}" -f (($stats.ReceivedBytes - $previousStats[$adapter.Name].ReceivedBytes) / 1 / 1024)
                    $dataOutRate = "{0:N2}" -f (($stats.SentBytes - $previousStats[$adapter.Name].SentBytes) / 1 / 1024)
                }

                # Update idle time
                if ([double]$dataInRate -gt 100 -or [double]$dataOutRate -gt 100) {
                    $idleStartTime[$adapter.Name] = Get-Date
                }

                # Display statistics
                $idleTime = (Get-Date) - $idleStartTime[$adapter.Name]
                $idleTimeString = "{0:D2}:{1:D2}:{2:D2}" -f $idleTime.Hours, $idleTime.Minutes, $idleTime.Seconds
                Write-Host ("Adapter: {0} - Idle Time: {1}`nData In Rate: {2} KB/s, Data Out Rate: {3} KB/s" -f $adapter.Name, $idleTimeString, $dataInRate, $dataOutRate)

                # Store current stats for next iteration
                $previousStats[$adapter.Name] = $stats

            } catch {
                Write-Host "Error fetching statistics for adapter: $($adapter.Name)"
            }
        }

        # Additional IP Configuration and Throughput Stats (already in script)

        Start-Sleep -Seconds 3
    }
}

Export-ModuleMember -Function Invoke-NETStats
