<## POWERSHELL LAB 1 ##>
# Antonio Vincentelli

<# Pre-Lab #>

# 1.
$PSVersionTable.PSVersion
<# Major  Minor  Build  Revision
   -----  -----  -----  --------
   5      0      10586  494

# 2. (1) If on Win 8.0, upgrade to 8.1 or 10. (If 10, all set)
     (2) Install .NET 4.5.
     (3) If on Win 7, install Service Pack 1.
     (4) Install Windows Management Framework 5.

# 3. 

#>

<# Lab 1 #>

## 1. OS Information

$OsName = (Get-CimInstance CIM_OperatingSystem).Caption
$OsVersion = (Get-CimInstance CIM_OperatingSystem).Version
$OsArch = (Get-CimInstance CIM_OperatingSystem).OSArchitecture
$AddRemove = (gcim CIM_Product).Name
$Hotfixes = Get-HotFix

## 2. Network Information
#a
$PhysAdapters = @((Get-NetAdapterHardwareInfo).Name); $PhysAdapters.length
# or
$PhysAd2 = @((Get-NetAdapter -Physical).name); $PhysAd2.Length

#b
$AdapterTypes = @((Get-NetAdapter).Name)

#c
$UpIPInfo = @()
$UpNetworks = Get-NetAdapter | where {$_.Status -eq "Up"}
$UpNetName = $UpNetworks.Name
$NetIPs = Get-NetIPAddress | where {$_.AddressFamily -like "IPv4"}
foreach ($element in $NetIPs)
{
    $MatchName = $UpNetworks | Where-Object {($_.name -eq $element.InterfaceAlias)}
    if($MatchName)
    {
        $Temp = 
        [ordered]@{
            'Name' = $element.InterfaceAlias
            'IP' = $element.IPAddress
        }
    $UpIPInfo += New-Object -TypeName psobject -Property $Temp
    }
}
return $UpIPInfo


## 3. Hardware Information

$DriveInfo = Get-DriveStatistics
$SmartDrives = 
$DeviceManager = 


## Diagnostics

$PingLocal = 
$PingExternal = 
$PingGateway = 
$RecentError = $Error[-1]
$CpuSort = Get-Process | Sort-Object ws -Descending
$RamHogs = 
