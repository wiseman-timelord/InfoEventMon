function Get-NetworkStatistic {
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
        Write-Host "${Name}: $result"
    } catch {
        Write-Host "Error fetching $Name"
    }
}

function Run-NetworkStats {
    while ($true) {
        Display-Title  # Display the title
        Write-Host "Network Statistics:`n"

        # Network Adapters and Status
        Get-NetworkStatistic -Name "Network Adapters" -Command {
            Get-NetAdapter | Format-Table Name, Status, LinkSpeed -AutoSize
        }

        # IP Configuration
        Get-NetworkStatistic -Name "IP Configuration" -Command {
            Get-NetIPAddress | Format-Table IPAddress, PrefixLength, InterfaceAlias -AutoSize
        }

        # Data Throughput and Packet Statistics
        Get-NetworkStatistic -Name "Data Throughput and Packet Stats" -Command {
            Get-NetAdapterStatistics | Format-Table Name, PacketsReceived, PacketsSent, BytesReceived, BytesSent -AutoSize
        }

        Start-Sleep -Seconds 1
    }
}
