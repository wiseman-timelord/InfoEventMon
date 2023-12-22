function Invoke-AUDStats {
    while ($true) {
        Display-Title

        Write-Host "Sound Statistics:`n" -ForegroundColor Green

        Write-Host "Not possible with only PWSH 7.4"

        Start-Sleep -Seconds 3
    }
}

Export-ModuleMember -Function Invoke-AUDStats
