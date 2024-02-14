# cleaner.ps1

function Clean-Log {
    param (
        [string]$LogPath = ".\Errors-Crash.Log"
    )

    # Read the log file content
    $Content = Get-Content -Path $LogPath -Raw

    # Replace ANSI escape sequences with nothing
    $CleanedContent = $Content -replace '\x1b\[\d*;?\d*;?\d*m', ''

    # Overwrite the original log file with the cleaned content
    Set-Content -Path $LogPath -Value $CleanedContent
}

# Entry point of the script
Clean-Log
