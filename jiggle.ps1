# jiggle.ps1 — moves the real cursor every 30s to reset the OS idle timer.
# Generates real OS-level input so apps like Teams/Slack register activity.
# Run: powershell -ExecutionPolicy Bypass -File .\jiggle.ps1
# Stop: Ctrl+C

Add-Type -MemberDefinition @'
    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
'@ -Name "MouseInput" -Namespace "Win32"

$MOUSEEVENTF_MOVE = 0x0001

Write-Host "Jiggling every 30s. Press Ctrl+C to stop."
while ($true) {
    [Win32.MouseInput]::mouse_event($MOUSEEVENTF_MOVE, 1, 0, 0, 0)   # +1px right
    Start-Sleep -Milliseconds 50
    [Win32.MouseInput]::mouse_event($MOUSEEVENTF_MOVE, -1, 0, 0, 0)  # back
    Start-Sleep -Seconds 30
}
