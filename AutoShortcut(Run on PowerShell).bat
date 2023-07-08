$wsh = New-Object -ComObject WScript.Shell
$items = Get-ChildItem -Path "Origin Path Here"
ForEach($item in $items) {
    $shortcut = $wsh.CreateShortcut("Destination Path Here\$($item.BaseName).lnk")
    $shortcut.TargetPath = $item.fullname
    $shortcut.WorkingDirectory = $item.FullName -replace [regex]::Escape($item.Name)

    $shortcut.save()
}

