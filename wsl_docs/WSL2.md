# Activating Windows Linux Subsystem 2 (WSL2)
## Activate Windows Insider Builds
1. Enable Full Diagnostic Data
- go to Settings > Privacy > Diagnostics & feedback> Diagnostic data
- Choose Full as the option
2. Enable Telemetry Data via Registry
- Open Registry Editor
- navigate to:

```console
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection
```

- Right-click DataCollection, click New and then click DWORD (32-bit) Value.
- Name it as  AllowTelemetry, and then press ENTER.
- Double-click AllowTelemetry, set the value as 3, and then click OK.
- Repeat the above steps for:

```console
HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DataCollection
```

- restart the computer

3. Group Policy to enable Telemetry

## Turn on linux subsystem feature
Open Windows PowerShell as administrator and run the command:

```console
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```