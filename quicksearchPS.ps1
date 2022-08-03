function Get-NewSearch {
    $global:continue = Read-Host -Prompt "`nStart new Search? ('Y' or 'y' to start new search)"
    if ($global:continue -ne "y" -and $global:continue -ne "Y") {
        break
    }
}

while ($TRUE) {
    
    $getsearchfor = Read-Host -Prompt "What do you want to search for?`n"
    $searchin = Read-Host -Prompt "`nWhich directory do you want to search in?`n"
    $searchfor = "*" + $getsearchfor + "*"
    Write-Output "`n"

    
    Get-ChildItem -Path $searchin -Filter $searchfor -Recurse -Force | ForEach-Object { $_.FullName }
    Write-Output "`n[Finished]"
    Get-NewSearch

}