$wsh = New-Object -ComObject WScript.Shell
$items = Get-ChildItem -Path "(OriginPathHere)\*\*.exe"
ForEach($item in $items) {
    $shortcut = $wsh.CreateShortcut("(DestinationPathHere)\$($item.BaseName).lnk")
    $shortcut.TargetPath = $item.fullname
    $shortcut.WorkingDirectory = $item.FullName -replace [regex]::Escape($item.Name)

    $shortcut.save()
}

