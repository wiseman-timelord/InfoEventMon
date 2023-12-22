update the script appropriately...

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

        Write-Host "Not possible with only PWSH 7.4"

        Start-Sleep -Seconds 3
    }
}

Export-ModuleMember -Function Get-GPUStatistic, Invoke-GPUStats
