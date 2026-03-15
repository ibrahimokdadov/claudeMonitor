param(
    [string]$Title = "Claude Code",
    [string]$Message = "Waiting for input",
    [string]$Project = ""
)

# Get project name from cwd if not passed
if (-not $Project) {
    $Project = Split-Path -Leaf (Get-Location)
}

$fullTitle = "Claude: $Project"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$notify = New-Object System.Windows.Forms.NotifyIcon
$notify.Icon = [System.Drawing.SystemIcons]::Information
$notify.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
$notify.BalloonTipTitle = $fullTitle
$notify.BalloonTipText = $Message
$notify.Visible = $true
$notify.ShowBalloonTip(8000)

Start-Sleep -Milliseconds 500
$notify.Dispose()
