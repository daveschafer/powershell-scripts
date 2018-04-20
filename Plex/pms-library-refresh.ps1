<#  
.SYNOPSIS  
    Updates the Plex Media Server Libraries | Aktualisiert den Plex Media Server.
.DESCRIPTION 
    This script updates the Plex PMS Library with a simle http invoke. |
    Dieses Script aktualisiert über einen simplen
    http Invoke die PMS Libraries.
.NOTES  
    File Name  : pms-library-refresh.ps1  
    Author     : David Schafer - minuert@gmail.com  
    Requires   : PowerShell V2 CTP3  
.LINK  
#>

### Vars

# Plexserver intern
$PlexWbSrvInt = "Your internal Server Name or IP"
#Plexserver extern
$PlexWbSrvExt = "Your external Server Name or IP"
# Plexserver Port
$PlexPort = "32400" #<-- Default Plex Port
# Optional Plex Token for external Access:
# How to get the token --> https://www.reddit.com/r/PleX/comments/3ardye/solved_how_to_scan_plex_library_remotely_via_url/
# Plex Token String
$PlexToken = "?X-Plex-Token=${SpecToken}"

# Connect internal
$InternalConnect = Test-Connection $PlexWbSrvInt -Count 1 -Quiet

# if internal is available
if ($InternalConnect -eq 1)
{
    Write-Host "Internal Server is used..."
    Invoke-WebRequest -Uri "http://${PlexWbSrvInt}:${Plexport}/library/sections/all/refresh${PlexToken}"
}
# if internal is not available
elseif ($InternalConnect -eq 0)
{
    Write-Host "External Server is used..."
    Invoke-WebRequest -Uri "http://${PlexWbSrvExt}:${Plexport}/library/sections/all/refresh${PlexToken}"
}


