# Set variables
$RepoOwner = "priyashpatil"
$RepoName = "phpup"
$AssetName = "phpup"

# Determine system architecture
$Arch = (Get-WmiObject Win32_OperatingSystem).OSArchitecture

if ($Arch -eq "64-bit") {
    $AssetName = "${AssetName}-windows-amd64.exe"
} else {
    Write-Host "Unsupported architecture: $Arch"
    Write-Host "phpup is only available for 64-bit Windows systems."
    exit 1
}

# Get the latest release tag
$ReleasesUri = "https://api.github.com/repos/$RepoOwner/$RepoName/releases/latest"
$ReleaseTag = (Invoke-RestMethod -Uri $ReleasesUri).tag_name

# Echo which version is being downloaded
Write-Host "Downloading phpup version $ReleaseTag`n"

# Get the download URL for the asset
$AssetsUri = "https://api.github.com/repos/$RepoOwner/$RepoName/releases/tags/$ReleaseTag"
$DownloadUrl = (Invoke-RestMethod -Uri $AssetsUri).assets | 
    Where-Object { $_.name -eq $AssetName } | 
    Select-Object -ExpandProperty browser_download_url

# Download the asset
$DownloadPath = Join-Path $env:TEMP $AssetName
Invoke-WebRequest -Uri $DownloadUrl -OutFile $DownloadPath

# Move the binary to a directory in PATH
$InstallPath = "C:\Windows\System32\phpup.exe"
Write-Host "`nInstalling phpup to $InstallPath"
Move-Item -Path $DownloadPath -Destination $InstallPath -Force

Write-Host "`nphpup has been installed successfully! 🎉"
