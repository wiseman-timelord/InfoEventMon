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
    $displayEscMessage = $true

    while ($true) {
        Display-Title

        # GPU Statistics
        Write-Host "GPU Statistics:`n"
        Write-Host "Not possible with only PWSH 7.4"

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

Export-ModuleMember -Function Get-GPUStatistic, Invoke-GPUStats
