
$collectionVariable = New-Object System.Collections.ArrayList

$files = Get-ChildItem -Path *.md

foreach ($f in $files){
    $test = Get-Content $f.FullName -First 1

    $blogPost = [PSCustomObject]@{
        Name = $f.Name
        Description = $test
    }

    $collectionVariable.Add($blogPost) | Out-Null
}


$hmm = ConvertTo-Json $collectionVariable

Write-Host $hmm

$hmm | Out-File -FilePath index.json