$files = ls ./output/ -Filter *.txt

$regexstr = '(?<Lastname>\w+):.*\n(?<Firstname>\w+)'

$fileobj = $null

$resultfile = 'namelist.txt'

foreach ($file in $files) {
    $fileobj = ( Get-Content $file.FullName | Out-String ).Trim()

    $results = $fileobj | Select-String $regexstr -AllMatches
    
    foreach ($result in $results.Matches) {
        $finallist += $result.Groups[1].Value + "`t" + $result.Groups[2].Value + "`n"
    }
}

Set-Content -Path $resultfile -Value $finallist