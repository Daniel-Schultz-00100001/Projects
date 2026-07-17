Add-Type -AssemblyName System.Windows.Forms


$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds

$radius = 100
$delay = 3


$angle = 0
$point = 0


[Mouse]::mouse_event([Mouse]::LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
while ($point -le 62) {
    $x = [math]::Round($screen.Width / 1.5 + $radius * [math]::Cos($angle))
    $y = [math]::Round($screen.Height / 2 + $radius * [math]::Sin($angle))

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)

    Start-Sleep -Milliseconds $delay

    $angle += 0.1
    $point += 1
    Write-Host "Points: $point"
}