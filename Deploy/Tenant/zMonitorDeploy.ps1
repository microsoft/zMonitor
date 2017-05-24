$TenantID = "d30b7b5b-514d-412e-9f07-e5958292afc8"
$SubscriptionID = "D8F3F8EB-779D-4495-A12E-A9DF6B081B36"
$resourceGroupName = "zMonitor"
$resourceRegion = "West Europe"
$templateFilePath = "C:\Users\sprin\OneDrive - Microsoft\30 My IP Development Space\OSP Resources\Tenant\oms-all-deploy\azuredeploy.json"

Login-AzureRmAccount -TenantId $TenantID -SubscriptionId $SubscriptionID

$resourceGroup = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if(!$resourceGroup)
{
    Write-Host "Resource group '$resourceGroupName' does not exist. To create a new resource group, please enter a location.";
    if(!$resourceRegion) {
        $resourceRegion = Read-Host "resourceGroupLocation";
    }
    Write-Host "Creating resource group '$resourceGroupName' in location '$resourceRegion'";
    New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceRegion
}
else{
    Write-Host "Using existing resource group '$resourceGroupName'";
}

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile $templateFilePath;



