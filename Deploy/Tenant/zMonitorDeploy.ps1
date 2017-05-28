# The config settings are for CSP partners, which need the TenantID as well as SubscriptionID.
# For non-CSP deployments, the TenantID is not used.
$TenantID = "<TenantID>"
$SubscriptionID = "<Tenant SubscriptionID>"
$resourceGroupName = "zMonitor"
$resourceRegion = "West Europe" # Your preferred region
$templateFilePath = "<FULL PATH TO>\Tenant\oms-all-deploy\azuredeploy.json"

# Remove TenantID for non-CSP deployments
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



