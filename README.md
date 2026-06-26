# xray1

A tiny PowerShell mouse jiggler for Windows.

`jiggle.ps1` nudges the real cursor 1px and back every 30 seconds. Because it
calls the Win32 `mouse_event` API, it produces genuine OS-level input, which
resets the OS idle timer that apps like Microsoft Teams and Slack use to decide
your presence (Active vs. Away).

## Usage

```powershell
powershell -ExecutionPolicy Bypass -File .\jiggle.ps1
```

Press `Ctrl+C` to stop.

## Notes

- A browser/website cannot do this — JS is sandboxed and can't move the real
  cursor or reset the OS idle timer. A desktop process (like this script) can.
- Some corporate environments restrict script execution (ExecutionPolicy /
  AppLocker) or monitor for robotic input. Use responsibly and within your
  organization's acceptable-use policy.
