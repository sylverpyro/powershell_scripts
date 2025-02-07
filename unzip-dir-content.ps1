Get-ChildItem -Filter *.zip | ForEach-Object { 
  $basename=[System.Io.Path]::GetFileNameWithoutExtension($_)
  Write-Output $basename
  $outdir=".\unzipped"
  $dest="$outdir\$basename"
  if (-not (Test-Path -Path $dest)) {
    New-Item -Path $dest -ItemType Directory
  }
  Expand-Archive -Force -Path $_.FullName -DestinationPath unzipped/$basename
  break
}
