New-Item -ItemType Directory -Path "$PSScriptRoot\photos_renamed" -Force

$photos = "$PSScriptRoot\Photos"
$destination = "$PSScriptRoot\photos_renamed"
$i = 1


$name = Get-Content "$PSScriptRoot\photoname.txt" -First 1


Get-ChildItem "$photos\*.jpg" | ForEach-Object {
    $newName = "$name _{0:D3}.jpg" -f $i

    Copy-Item $_.FullName "$destination\$newName"

    $i++
}  

