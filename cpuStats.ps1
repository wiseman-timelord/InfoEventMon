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
        Write-Host "$Name: $result"
    } catch {
        Write-Host "Error fetching $Name"
    }
}

while ($true) {
    Clear-Host
    Write-Host "╔═══════════════════════════════════╗"
    Write-Host "║         CPU Statistics           ║"
    Write-Host "╚═══════════════════════════════════╝"

    # CPU Load
    Get-CPUStatistic -Name "CPU Load" -Command {
        (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
    } -FormatString "{0:N2}%"

    # Clock Speed
    Get-CPUStatistic -Name "Clock Speed" -Command {
        (Get-WmiObject Win32_Processor).MaxClockSpeed
    } -FormatString "{0} MHz"

    # Top CPU Consuming Processes
    Write-Host "Top CPU Consuming Processes:"
    try {
        Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 5 -Property ID, ProcessName, CPU | Format-Table -AutoSize
    } catch {
        Write-Host "Error fetching Top CPU Processes"
    }

    # CPU Cores
    Get-CPUStatistic -Name "Physical Cores" -Command { (Get-WmiObject Win32_Processor).NumberOfCores }
    Get-CPUStatistic -Name "Logical Cores" -Command { (Get-WmiObject Win32_Processor).NumberOfLogicalProcessors }

    Start-Sleep -Seconds 1
}
