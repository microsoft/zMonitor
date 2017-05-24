#Use the local AzureRunAsConnection account for actions within the tenant
$Conn = Get-AutomationConnection -Name AzureRunAsConnection
Add-AzureRMAccount -ServicePrincipal -Tenant $Conn.TenantID -ApplicationId $Conn.ApplicationID -CertificateThumbprint $Conn.CertificateThumbprint

# Set service provider Azure storage account
$StorageAccountName = "<STORAGE ACCOUNT>"
$StorageContainerName = "<MAIN CONTAINER NAME>"
$TargetStorageContainerName = "<ARCHIVE CONTAINER NAME>"
$StorageAccountKey = "<STORAGE ACCOUNT KEY>"

$Ctx = New-AzureStorageContext $StorageAccountName -StorageAccountKey $StorageAccountKey

#Cleanup all 0 byte files - no data
Get-AzureStorageBlob -Container $StorageContainerName -Context @Ctx | Where-Object {$_.Length -eq 0} | Remove-AzureStorageBlob

#Get all blobs older than an hour
$blobs = Get-AzureStorageBlob -Container $StorageContainerName -Context @Ctx | Where-Object {$_.LastModified -lt (Get-Date).AddHours(-1)}

#Copy blobs from one container to another.
$blobs| Start-AzureStorageBlobCopy -DestContainer $TargetStorageContainerName -DestContext $Ctx

$blobs| Remove-AzureStorageBlob
