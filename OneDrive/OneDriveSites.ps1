# After the script successfully completes, a text file is created in the location specified by the $LogFile variable in the script. 
# This file contains a list //# of all OneDrive Urls in your organization. 
# The following text provides an example of how the list of Urls in this file should be formatted.

$TenantUrl = Read-Host "Enter the SharePoint Online Tenant Admin Url"
 $LogFile = [Environment]::GetFolderPath("Desktop") + "\OneDriveSites.log"
 Connect-SPOService -Url $TenantUrl
 Get-SPOSite -IncludePersonalSite $true -Limit all -Filter "Url -like '-my.sharepoint.com/personal/" |select Url | Out-File $LogFile -Force
 Write-Host "Done! File saved as $($LogFile)."