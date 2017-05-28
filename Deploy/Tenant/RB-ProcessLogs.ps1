[CmdletBinding()]
Param(
[Parameter (Mandatory=$true,Position=1)]
[string]$reportname,

[Parameter (Mandatory=$true,Position=2)]
[string]$dynamicQuery
)

#Use the local AzureRunAsConnection account for actions within the tenant
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

# Set service provider Azure storage account and get the context
$StorageAccountName = "<STORAGE ACCOUNT>"
$StorageContainerName = "<STORAGE CONTAINER NAME>"
$StorageAccountKey = "<STORAGE ACCOUNT KEY>"
$Ctx = New-AzureStorageContext $StorageAccountName -StorageAccountKey $StorageAccountKey
#Get-AzureStorageContainer -Name $StorageContainerName -Context $Ctx

$workspace = Get-AutomationVariable -Name "OMSWorkspaceName"
$date = get-date -f yyyyMMddHHmm
#$reportname = "activealertscritical"
#$dynamicQuery = "Type=Alert (AlertSeverity=error or AlertSeverity=critical) TimeGenerated>NOW-24HOUR AlertState!=Closed"

# Run the OMS Query Search - Edit Workspace Name Per Tenant
# NOTE : Results are limited to 5000 results
$result = Get-AzureRmOperationalInsightsSearchResults -ResourceGroupName "zMonitor" -WorkspaceName $($workspace) -Top 5000 -Query $dynamicQuery

$result.Value | ConvertFrom-Json | Export-Csv -NoTypeInformation $env:TEMP\$($workspace)-$($reportname)-$($date)-temp.csv -Force

Import-Csv $env:TEMP\$(Get-AutomationVariable -Name "OMSWorkspaceName")-$($reportname)-$($date)-temp.csv | 
    select-Object *,@{Name='tenantworkspace';Expression={$($workspace)}},@{Name='reportname';Expression={$($reportname)}} | 
    Export-Csv -NoTypeInformation $env:TEMP\$($workspace)-$($reportname)-$($date).csv

#Write-Output "Moving CSV Results File to Azure Blob Storage."
Set-AzureStorageBlobContent -Context $Ctx -File $env:TEMP\$($workspace)-$($reportname)-$($date).csv -Container $StorageContainerName -Force | Out-Null
