$dirs = Get-ChildItem -Path . -Directory
foreach ($dir in $dirs) {
    Set-Location $dir.FullName

    if (Test-Path .git) {
        $status = git status

        if ($status -match "(Changes to commit)|(Untracked files)") {
            Write-Output "No commit:  $($dir.FullName)"
        }
    }
    Set-Location ..
}