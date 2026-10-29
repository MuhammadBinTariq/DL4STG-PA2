$ErrorActionPreference = 'Stop'
$reportCompiler = (Get-Command xelatex -ErrorAction Stop).Source
$reportOutputDirectory = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../output/pdf'))
New-Item -ItemType Directory -Path $reportOutputDirectory -Force | Out-Null
Push-Location -LiteralPath $PSScriptRoot
try {
    $reportCompilerArguments = @(
        '-no-shell-escape',
        '-interaction=nonstopmode',
        '-halt-on-error',
        '-jobname=DL4STG_PA2_Report',
        "-output-directory=$reportOutputDirectory",
        'main.tex'
    )
    foreach ($reportPass in 1..2) {
        & $reportCompiler @reportCompilerArguments
        if ($LASTEXITCODE -ne 0) {
            throw "Report compilation failed on pass $reportPass."
        }
    }
}
finally {
    Pop-Location
}
