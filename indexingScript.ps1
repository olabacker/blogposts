
$collectionVariable = New-Object System.Collections.ArrayList

$files = Get-ChildItem -Path *.md

foreach ($f in $files){
    $firstLine = Get-Content $f.FullName -First 1
    
    if($firstLine.Contains("|"))
    {
        $split = $firstLine.Split( "|")
        $description = $split[0]

        $regexmatches = [regex]::Matches($split[1], '(?<=\[)[^]]+(?=\])').Value
        
        $tags = @()
        foreach($it in $regexmatches){
            $tags += $it
        }
    }
    else 
    {
        $description = $firstLine
        $tags = @()
    }


    $blogPost = [PSCustomObject]@{
        Name = $f.Name
        Description = $description
        Tags = $tags
    }

    $collectionVariable.Add($blogPost) | Out-Null
}

$result = ConvertTo-Json $collectionVariable

Write-Host $result

$result | Out-File -FilePath index.json