Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$folder = "$env:USERPROFILE\Pictures\ClipboardImages"
if (!(Test-Path $folder)) { New-Item -ItemType Directory -Path $folder | Out-Null }

$image = [Windows.Forms.Clipboard]::GetImage()
if ($image -ne $null) {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $filepath = Join-Path $folder "clip_$timestamp.png"
    $image.Save($filepath, [System.Drawing.Imaging.ImageFormat]::Png)
    Set-Clipboard -Value $filepath
}