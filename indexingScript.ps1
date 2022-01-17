
$collectionVariable = New-Object System.Collections.ArrayList

$files = Get-ChildItem -Path *.md

foreach ($f in $files){
    $description = Get-Content $f.FullName -First 1

    $blogPost = [PSCustomObject]@{
        Name = $f.Name
        Description = $description
    }

    $collectionVariable.Add($blogPost) | Out-Null
}

$result = ConvertTo-Json $collectionVariable

Write-Host $result

$result | Out-File -FilePath index.json