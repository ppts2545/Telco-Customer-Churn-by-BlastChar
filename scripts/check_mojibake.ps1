$ErrorActionPreference = 'Stop'

# Patterns commonly produced by UTF-8 text decoded as cp1252/latin-1.
# Keep this file ASCII-only for compatibility with Windows PowerShell 5.1.
$patterns = @(
    ([string]([char]0x00E0) + [char]0x00B8),
    ([string]([char]0x00E0) + [char]0x00B9),
    [string][char]0x00C3,
    [string][char]0x00C2
)
$extensions = @('*.ipynb', '*.md', '*.py', '*.yaml', '*.yml', '*.json')
$roots = @('notebooks', 'docs', 'src', 'archive', 'config', 'README.md')

$files = Get-ChildItem -Path $roots -Recurse -File -Include $extensions
$bad = @()

foreach ($file in $files) {
    if (Select-String -Path $file.FullName -Pattern $patterns -SimpleMatch -Quiet) {
        $bad += $file.FullName
    }
}

if ($bad.Count -gt 0) {
    Write-Host 'Mojibake/encoding-corrupted text detected:' -ForegroundColor Red
    $bad | ForEach-Object { Write-Host " - $_" }
    exit 1
}

Write-Host 'No mojibake patterns detected.' -ForegroundColor Green
