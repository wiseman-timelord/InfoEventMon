$previousStats = @{}
$initialStats = @{}
$idleStartTime = @{}

while ($true) {
    Clear-Host
    Write-Host "`n                  Netformance`n`n"

    $adapters = Get-NetAdapter

    foreach ($adapter in $adapters) {
        $stats = Get-NetAdapterStatistics -Name $adapter.Name

        if (-not $initialStats[$adapter.Name]) {
            $initialStats[$adapter.Name] = $stats
            $idleStartTime[$adapter.Name] = Get-Date
        }

        $dataInRate = 0
        $dataOutRate = 0

        if ($previousStats[$adapter.Name]) {
            $dataInRate = "{0:N2}" -f (($stats.ReceivedBytes - $previousStats[$adapter.Name].ReceivedBytes) / 5 / 1024)
            $dataOutRate = "{0:N2}" -f (($stats.SentBytes - $previousStats[$adapter.Name].SentBytes) / 5 / 1024)
        }

        if ([double]$dataInRate -gt 100 -or [double]$dataOutRate -gt 100) {
            $idleStartTime[$adapter.Name] = Get-Date
        }

        $idleTime = (Get-Date) - $idleStartTime[$adapter.Name]
        $idleTimeString = "{0:D2}:{1:D2}:{2:D2}" -f $idleTime.Hours, $idleTime.Minutes, $idleTime.Seconds

        $previousStats[$adapter.Name] = $stats

        $dataInTotal = "{0:N2}" -f (($stats.ReceivedBytes - $initialStats[$adapter.Name].ReceivedBytes) / 1GB)
        $dataOutTotal = "{0:N2}" -f (($stats.SentBytes - $initialStats[$adapter.Name].SentBytes) / 1GB)

        $pausesIn = if ($stats.ReceivedPauseFrames) { $stats.ReceivedPauseFrames } else { 0 }
        $pausesOut = if ($stats.SentPauseFrames) { $stats.SentPauseFrames } else { 0 }
        $errorsInTotal = if ($stats.ReceivedErrors) { $stats.ReceivedErrors } else { 0 }
        $discardsInTotal = if ($stats.ReceivedDiscards) { $stats.ReceivedDiscards } else { 0 }
        $errorsOutTotal = if ($stats.SentErrors) { $stats.SentErrors } else { 0 }
        $discardsOutTotal = if ($stats.SentDiscards) { $stats.SentDiscards } else { 0 }

        Write-Host ("Adapter: {0} - Idle Time: {1}`n" -f $adapter.Name, $idleTimeString)
        Write-Host ("Data In Rate: {0} KB/s, Data In Total: {1} GB" -f $dataInRate, $dataInTotal)
        Write-Host ("Pauses In:{0}, Discards In: {1}, Errors In: {2}." -f $pausesIn, $discardsInTotal, $errorsInTotal)
        Write-Host ("Data Out Rate: {0} KB/s, Data Out Total: {1} GB" -f $dataOutRate, $dataOutTotal)
        Write-Host ("Pauses Out:{0}, Discards Out: {1}, Errors Out: {2}." -f $pausesOut, $discardsOutTotal, $errorsOutTotal)
        Write-Host ""
        Write-Host ""
    }

    Start-Sleep -Seconds 5
}
