function Get-GPUStatistic {
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

function Invoke-GPUStats {
    while ($true) {
       and available in the scope
        Display-Title  # Display the title
        Write-Host "GPU Statistics:`n"

        # Placeholder for GPU Utilization
        Get-GPUStatistic -Name "GPU Utilization" -Command { "Not available - requires tool integration" }

        # Placeholder for additional GPU stats
        Get-GPUStatistic -Name "GPU Temperature" -Command { "Not available - requires tool integration" }
        Get-GPUStatistic -Name "Memory Usage" -Command { "Not available - requires tool integration" }
        Get-GPUStatistic -Name "Clock Speeds" -Command { "Not available - requires tool integration" }
        Get-GPUStatistic -Name "Fan Speed" -Command { "Not available - requires tool integration" }

        Start-Sleep -Seconds 3
    }
}

Export-ModuleMember -Function Get-GPUStatistic, Invoke-GPUStats
