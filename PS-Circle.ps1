Add-Type -AssemblyName System.Windows.Forms
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Mouse {
    [DllImport("user32.dll")]
    public static extern void mouse_event(
        uint dwFlags,
        uint dx,
        uint dy,
        uint dwData,
        UIntPtr dwExtraInfo);

    public const uint LEFTDOWN = 0x0002;
    public const uint LEFTUP   = 0x0004;
}
"@

$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds

$radius = 100
$delay = 5
$centerx = $screen.Width / 1.5
$centery = $screen.Height / 2

$angle = 0
$point = 0

$x = [math]::Round($centerx + $radius * [math]::Cos($angle))
$y = [math]::Round($centery + $radius * [math]::Sin($angle))
Write-Host "Starting at: ($x, $y)"
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
Start-Sleep -Seconds 5

[Mouse]::mouse_event([Mouse]::LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
while ($point -le 63) {
    [Mouse]::mouse_event([Mouse]::LEFTDOWN, 0, 0, 0, [UIntPtr]::Zero)
    $x = [math]::Round($screen.Width / 1.5 + $radius * [math]::Cos($angle))
    $y = [math]::Round($screen.Height / 2 + $radius * [math]::Sin($angle))

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)

Start-Sleep -Milliseconds $delay

    $angle += 0.1
    $point += 1
    Write-Host "Points: $point"
}

[Mouse]::mouse_event([Mouse]::LEFTUP, 0, 0, 0, [UIntPtr]::Zero)
