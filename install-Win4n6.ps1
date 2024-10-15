#   Description:
# This script will use Windows package manager to bootstrap Chocolatey and
# install a list of packages. Script will also install Sysinternals Utilities
# into your default drive's root directory.

$packages = @(
    #"notepadplusplus.install"
    #"peazip.install"
    "autopsy"
    #"clamwin"
    "git"
    "nirlauncher"
    "python2"
    "python3"
    #"sublimetext3"
    "sysinternals"
    "wireshark"
    #"7zip.install"
    #"classic-shell"
    "filezilla"
    "firefox"
    "gimp"
    "google-chrome-x64"
    "putty"
    "cyberchef.flare"
    "volatility.flare"
    #"fileinsight.flare"
    "hxd.flare"
    #"010editor.flare"
    "peid.flare"
    "peview.flare"
    "die.flare"
    "pestudio.flare"
    "pebear.flare"
    "upx"
    #"network-miner"
    #"forensic7z"
    "netfoxdetective"
    "ericzimmermantools"

)

#echo "Setting up Chocolatey software package manager"
#Get-PackageProvider -Name chocolatey
#
## Error here on line 45
#echo "Setting up Full Chocolatey Install"
#Install-Package -Name Chocolatey -ProviderName chocolatey
#$chocopath = (Get-Package chocolatey | ?{$_.Name -eq "chocolatey"} | Select @{N="Source";E={((($a=($_.#Source -split "\\"))[0..($a.length - 2)]) -join "\"),"Tools\chocolateyInstall" -join "\"}} | Select #-ExpandProperty Source)
#& $chocopath "upgrade all -y"
#choco install chocolatey-core.extension
#
#echo "Setting up FireEye Flare Feed"
#$fireeyeFeed = "https://www.myget.org/F/fireeye/api/v2"
#iex "choco sources add -n=fireeye -s $fireeyeFeed --priority 1"
#iex "choco upgrade -y vcredist-all.flare"
#iex "refreshenv"

echo "Installing Packages"
$packages | %{choco install $_ -y}






#  upgrade pip
#  c:\python39\python.exe -m pip install --upgrade pip
#  iex "c:\python39\python.exe -m pip install --upgrade pip"
#  iex "pip install volatility3"
#  download symbols for v3
#  wget "https://downloads.volatilityfoundation.org/volatility3/symbols/windows.zip" -OutFile "C:\Python39\Lib\site-packages\volatility3\symbols\windows.zip"
#  wget "https://downloads.volatilityfoundation.org/volatility3/symbols/linux.zip" -OutFile "C:\Python39\Lib\site-packages\volatility3\symbols\linux.zip"
#  wget "https://downloads.volatilityfoundation.org/volatility3/symbols/mac.zip" -OutFile "C:\Python39\Lib\site-packages\volatility3\symbols\mac.zip"
#  unzip


