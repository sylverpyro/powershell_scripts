Get-ChildItem -Filter *.zip | ForEach-Object { 
  $basename=[System.Io.Path]::GetFileNameWithoutExtension($_)
  Write-Output $basename
  New-Item -Path .\unqipped -ItemType Directory
  New-Item -Path .\unqipped\$basename -ItemType Directory
  Expand-Archive -Path $_.FullName -DestinationPath unzipped/$basename  
}
