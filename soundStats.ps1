function Get-SoundStatistic {
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
        Write-Host "$Name: $result"
    } catch {
        Write-Host "Error fetching $Name"
    }
}

function Run-SoundStats {
    while ($true) {
        Display-Title  # Display the title
        Write-Host "Sound Statistics:`n"

        # Default Audio Device
        Get-SoundStatistic -Name "Default Audio Device" -Command { 
            (Get-WmiObject Win32_SoundDevice | Select-Object -First 1).Name 
        }

        # Placeholder for additional sound stats
        Get-SoundStatistic -Name "Volume Level" -Command { "Not available - requires tool integration" }
        Get-SoundStatistic -Name "Mute Status" -Command { "Not available - requires tool integration" }
        Get-SoundStatistic -Name "Audio Format" -Command { "Not available - requires tool integration" }

        Start-Sleep -Seconds 1
    }
}
