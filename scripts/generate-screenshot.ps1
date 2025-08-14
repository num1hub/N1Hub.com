$ErrorActionPreference = 'Stop'
if (!(Test-Path 'n1hub-theme')) { New-Item -ItemType Directory 'n1hub-theme' | Out-Null }
Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap 1200,900
$gfx = [System.Drawing.Graphics]::FromImage($bmp)
$black = [System.Drawing.Brushes]::Black
$gfx.FillRectangle($black,0,0,1200,900)
$font1 = New-Object System.Drawing.Font 'Segoe UI',48
$font2 = New-Object System.Drawing.Font 'Segoe UI',24
$accent = [System.Drawing.Color]::FromArgb(34,211,238)
$text = [System.Drawing.Color]::FromArgb(243,245,247)
$b1 = New-Object System.Drawing.SolidBrush $accent
$b2 = New-Object System.Drawing.SolidBrush $text
$gfx.DrawString('N1Hub Theme',$font1,$b1,40,40)
$gfx.DrawString('Clarity-first | FSE | AI-ready',$font2,$b2,40,120)
$bmp.Save('n1hub-theme/screenshot.png',[System.Drawing.Imaging.ImageFormat]::Png)
$gfx.Dispose(); $bmp.Dispose(); $b1.Dispose(); $b2.Dispose(); $font1.Dispose(); $font2.Dispose()
Write-Output 'screenshot.png generated at n1hub-theme/screenshot.png'


