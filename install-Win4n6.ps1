#   Description:
# This script will use Windows package manager to bootstrap Chocolatey and
# install a list of packages. Script will also install Sysinternals Utilities
# into your default drive's root directory.

$packages = @(
    "notepadplusplus.install"
    "peazip.install"
    "autopsy"
    "clamwin"
    "git"
    "nirlauncher"
    "python2"
    "python3"
    "sublimetext3"
    "sysinternals"
    "wireshark"
    "7zip.install"
    "classic-shell"
    "filezilla"
    "firefox"
    "gimp"
    "google-chrome-x64"
    "putty"
    "cyberchef.flare"
    "volatility.flare"
    "fileinsight.flare"
    "hxd.flare"
    "010editor.flare"
    "peid.flare"
    "peview.flare"
    "die.flare"
    "pestudio.flare"
    "pebear.flare"
    "upx"
    "volatility.flare"


)

echo "Setting up Chocolatey software package manager"
Get-PackageProvider -Name chocolatey -Force

echo "Setting up Full Chocolatey Install"
Install-Package -Name Chocolatey -Force -ProviderName chocolatey
$chocopath = (Get-Package chocolatey | ?{$_.Name -eq "chocolatey"} | Select @{N="Source";E={((($a=($_.Source -split "\\"))[0..($a.length - 2)]) -join "\"),"Tools\chocolateyInstall" -join "\"}} | Select -ExpandProperty Source)
& $chocopath "upgrade all -y"
choco install chocolatey-core.extension --force

echo "Setting up FireEye Flare Feed"
$fireeyeFeed = "https://www.myget.org/F/fireeye/api/v2"
iex "choco sources add -n=fireeye -s $fireeyeFeed --priority 1"
iex "choco upgrade -y vcredist-all.flare"
iex "refreshenv"

echo "Installing Packages"
$packages | %{choco install $_ --force -y}
