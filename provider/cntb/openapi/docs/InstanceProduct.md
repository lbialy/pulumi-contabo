# InstanceProduct

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**TenantId** | **string** | Tenant id | 
**CustomerId** | **string** | Customer ID | 
**InstanceId** | **int64** | Instance ID | 
**ProductId** | **string** | Product ID | 
**Name** | **string** | Product name | 
**Category** | **string** | Instance&#39;s category depending on Product Id | 
**RamSizeGb** | **float32** | RAM size in GB | 
**DiskSizeGb** | **float32** | Disk size in GB | 
**CpuCores** | **int64** | CPU core count | 
**NetSpeed** | **int64** | Network speed in Mbit/s | 
**Snapshots** | **int64** | Number of snapshots included in the product | 
**VsPrice** | **float32** | Base virtual server price | 
**WindowsPrice** | **float32** | Additional price for Windows licensing | 
**BackupPrice** | **float32** | Price for automated backup service | 
**StorageExtensionPrice** | **float32** | Price for storage extension add-on | 
**LocationFeePrice** | **float32** | Additional fee applied for specific datacenter locations | 
**AddonsPrice** | **float32** | Aggregated price for all active add-ons | 
**HasStorageExtension** | **bool** | Indicates whether a storage extension is attached | 
**HasBackupAddon** | Pointer to **bool** | Indicates whether the automated backup add-on is attached | [optional] 
**HasWindows** | Pointer to **bool** | Indicates whether the Windows add-on is attached | [optional] 
**HasLocationFee** | Pointer to **bool** | Indicates whether a location fee add-on is attached | [optional] 
**Current** | **bool** | True if this product entry reflects the currently active subscription for the instance | 
**OfferId** | Pointer to **int64** | Identifier of the upgrade offer. Provide it as &#x60;offerId&#x60; when submitting the upgrade. Not set on the currently assigned product. | [optional] 
**LocationChangeRequired** | Pointer to **bool** | The offer is not available at the current location | [optional] 
**LiveMigrationAvailable** | Pointer to **bool** | The upgrade can be performed while keeping the existing data (&#x60;migration&#x60; provisioning type) | [optional] 
**LiveMigrationDisabledReason** | Pointer to **NullableString** | Reason why the existing data cannot be kept for this offer. Not set when it can be kept. | [optional] 
**StorageExtensionAvailable** | Pointer to **bool** | The storage extension add-on can be selected for this offer | [optional] 
**BackupAvailable** | Pointer to **bool** | The automated backup add-on can be selected for this offer | [optional] 
**UpgradeDiscount** | Pointer to **int64** | Upgrade discount percentage applied to this offer | [optional] 
**VsOriginalPrice** | Pointer to **float32** | Original gross price without add-ons and before the upgrade discount | [optional] 
**RequiredConfirmations** | Pointer to **[]string** | Confirmations the customer has to accept for this offer | [optional] 
**PriceDifferenceWithStorageExtension** | Pointer to **float32** | Price difference charged when the storage extension is selected | [optional] 
**PriceDifferenceWithoutStorageExtension** | Pointer to **float32** | Price difference charged when the storage extension is not selected | [optional] 

## Methods

### NewInstanceProduct

`func NewInstanceProduct(tenantId string, customerId string, instanceId int64, productId string, name string, category string, ramSizeGb float32, diskSizeGb float32, cpuCores int64, netSpeed int64, snapshots int64, vsPrice float32, windowsPrice float32, backupPrice float32, storageExtensionPrice float32, locationFeePrice float32, addonsPrice float32, hasStorageExtension bool, current bool, ) *InstanceProduct`

NewInstanceProduct instantiates a new InstanceProduct object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewInstanceProductWithDefaults

`func NewInstanceProductWithDefaults() *InstanceProduct`

NewInstanceProductWithDefaults instantiates a new InstanceProduct object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetTenantId

`func (o *InstanceProduct) GetTenantId() string`

GetTenantId returns the TenantId field if non-nil, zero value otherwise.

### GetTenantIdOk

`func (o *InstanceProduct) GetTenantIdOk() (*string, bool)`

GetTenantIdOk returns a tuple with the TenantId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetTenantId

`func (o *InstanceProduct) SetTenantId(v string)`

SetTenantId sets TenantId field to given value.


### GetCustomerId

`func (o *InstanceProduct) GetCustomerId() string`

GetCustomerId returns the CustomerId field if non-nil, zero value otherwise.

### GetCustomerIdOk

`func (o *InstanceProduct) GetCustomerIdOk() (*string, bool)`

GetCustomerIdOk returns a tuple with the CustomerId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCustomerId

`func (o *InstanceProduct) SetCustomerId(v string)`

SetCustomerId sets CustomerId field to given value.


### GetInstanceId

`func (o *InstanceProduct) GetInstanceId() int64`

GetInstanceId returns the InstanceId field if non-nil, zero value otherwise.

### GetInstanceIdOk

`func (o *InstanceProduct) GetInstanceIdOk() (*int64, bool)`

GetInstanceIdOk returns a tuple with the InstanceId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetInstanceId

`func (o *InstanceProduct) SetInstanceId(v int64)`

SetInstanceId sets InstanceId field to given value.


### GetProductId

`func (o *InstanceProduct) GetProductId() string`

GetProductId returns the ProductId field if non-nil, zero value otherwise.

### GetProductIdOk

`func (o *InstanceProduct) GetProductIdOk() (*string, bool)`

GetProductIdOk returns a tuple with the ProductId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetProductId

`func (o *InstanceProduct) SetProductId(v string)`

SetProductId sets ProductId field to given value.


### GetName

`func (o *InstanceProduct) GetName() string`

GetName returns the Name field if non-nil, zero value otherwise.

### GetNameOk

`func (o *InstanceProduct) GetNameOk() (*string, bool)`

GetNameOk returns a tuple with the Name field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetName

`func (o *InstanceProduct) SetName(v string)`

SetName sets Name field to given value.


### GetCategory

`func (o *InstanceProduct) GetCategory() string`

GetCategory returns the Category field if non-nil, zero value otherwise.

### GetCategoryOk

`func (o *InstanceProduct) GetCategoryOk() (*string, bool)`

GetCategoryOk returns a tuple with the Category field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCategory

`func (o *InstanceProduct) SetCategory(v string)`

SetCategory sets Category field to given value.


### GetRamSizeGb

`func (o *InstanceProduct) GetRamSizeGb() float32`

GetRamSizeGb returns the RamSizeGb field if non-nil, zero value otherwise.

### GetRamSizeGbOk

`func (o *InstanceProduct) GetRamSizeGbOk() (*float32, bool)`

GetRamSizeGbOk returns a tuple with the RamSizeGb field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetRamSizeGb

`func (o *InstanceProduct) SetRamSizeGb(v float32)`

SetRamSizeGb sets RamSizeGb field to given value.


### GetDiskSizeGb

`func (o *InstanceProduct) GetDiskSizeGb() float32`

GetDiskSizeGb returns the DiskSizeGb field if non-nil, zero value otherwise.

### GetDiskSizeGbOk

`func (o *InstanceProduct) GetDiskSizeGbOk() (*float32, bool)`

GetDiskSizeGbOk returns a tuple with the DiskSizeGb field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetDiskSizeGb

`func (o *InstanceProduct) SetDiskSizeGb(v float32)`

SetDiskSizeGb sets DiskSizeGb field to given value.


### GetCpuCores

`func (o *InstanceProduct) GetCpuCores() int64`

GetCpuCores returns the CpuCores field if non-nil, zero value otherwise.

### GetCpuCoresOk

`func (o *InstanceProduct) GetCpuCoresOk() (*int64, bool)`

GetCpuCoresOk returns a tuple with the CpuCores field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCpuCores

`func (o *InstanceProduct) SetCpuCores(v int64)`

SetCpuCores sets CpuCores field to given value.


### GetNetSpeed

`func (o *InstanceProduct) GetNetSpeed() int64`

GetNetSpeed returns the NetSpeed field if non-nil, zero value otherwise.

### GetNetSpeedOk

`func (o *InstanceProduct) GetNetSpeedOk() (*int64, bool)`

GetNetSpeedOk returns a tuple with the NetSpeed field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetNetSpeed

`func (o *InstanceProduct) SetNetSpeed(v int64)`

SetNetSpeed sets NetSpeed field to given value.


### GetSnapshots

`func (o *InstanceProduct) GetSnapshots() int64`

GetSnapshots returns the Snapshots field if non-nil, zero value otherwise.

### GetSnapshotsOk

`func (o *InstanceProduct) GetSnapshotsOk() (*int64, bool)`

GetSnapshotsOk returns a tuple with the Snapshots field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetSnapshots

`func (o *InstanceProduct) SetSnapshots(v int64)`

SetSnapshots sets Snapshots field to given value.


### GetVsPrice

`func (o *InstanceProduct) GetVsPrice() float32`

GetVsPrice returns the VsPrice field if non-nil, zero value otherwise.

### GetVsPriceOk

`func (o *InstanceProduct) GetVsPriceOk() (*float32, bool)`

GetVsPriceOk returns a tuple with the VsPrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetVsPrice

`func (o *InstanceProduct) SetVsPrice(v float32)`

SetVsPrice sets VsPrice field to given value.


### GetWindowsPrice

`func (o *InstanceProduct) GetWindowsPrice() float32`

GetWindowsPrice returns the WindowsPrice field if non-nil, zero value otherwise.

### GetWindowsPriceOk

`func (o *InstanceProduct) GetWindowsPriceOk() (*float32, bool)`

GetWindowsPriceOk returns a tuple with the WindowsPrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetWindowsPrice

`func (o *InstanceProduct) SetWindowsPrice(v float32)`

SetWindowsPrice sets WindowsPrice field to given value.


### GetBackupPrice

`func (o *InstanceProduct) GetBackupPrice() float32`

GetBackupPrice returns the BackupPrice field if non-nil, zero value otherwise.

### GetBackupPriceOk

`func (o *InstanceProduct) GetBackupPriceOk() (*float32, bool)`

GetBackupPriceOk returns a tuple with the BackupPrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetBackupPrice

`func (o *InstanceProduct) SetBackupPrice(v float32)`

SetBackupPrice sets BackupPrice field to given value.


### GetStorageExtensionPrice

`func (o *InstanceProduct) GetStorageExtensionPrice() float32`

GetStorageExtensionPrice returns the StorageExtensionPrice field if non-nil, zero value otherwise.

### GetStorageExtensionPriceOk

`func (o *InstanceProduct) GetStorageExtensionPriceOk() (*float32, bool)`

GetStorageExtensionPriceOk returns a tuple with the StorageExtensionPrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetStorageExtensionPrice

`func (o *InstanceProduct) SetStorageExtensionPrice(v float32)`

SetStorageExtensionPrice sets StorageExtensionPrice field to given value.


### GetLocationFeePrice

`func (o *InstanceProduct) GetLocationFeePrice() float32`

GetLocationFeePrice returns the LocationFeePrice field if non-nil, zero value otherwise.

### GetLocationFeePriceOk

`func (o *InstanceProduct) GetLocationFeePriceOk() (*float32, bool)`

GetLocationFeePriceOk returns a tuple with the LocationFeePrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetLocationFeePrice

`func (o *InstanceProduct) SetLocationFeePrice(v float32)`

SetLocationFeePrice sets LocationFeePrice field to given value.


### GetAddonsPrice

`func (o *InstanceProduct) GetAddonsPrice() float32`

GetAddonsPrice returns the AddonsPrice field if non-nil, zero value otherwise.

### GetAddonsPriceOk

`func (o *InstanceProduct) GetAddonsPriceOk() (*float32, bool)`

GetAddonsPriceOk returns a tuple with the AddonsPrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetAddonsPrice

`func (o *InstanceProduct) SetAddonsPrice(v float32)`

SetAddonsPrice sets AddonsPrice field to given value.


### GetHasStorageExtension

`func (o *InstanceProduct) GetHasStorageExtension() bool`

GetHasStorageExtension returns the HasStorageExtension field if non-nil, zero value otherwise.

### GetHasStorageExtensionOk

`func (o *InstanceProduct) GetHasStorageExtensionOk() (*bool, bool)`

GetHasStorageExtensionOk returns a tuple with the HasStorageExtension field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetHasStorageExtension

`func (o *InstanceProduct) SetHasStorageExtension(v bool)`

SetHasStorageExtension sets HasStorageExtension field to given value.


### GetHasBackupAddon

`func (o *InstanceProduct) GetHasBackupAddon() bool`

GetHasBackupAddon returns the HasBackupAddon field if non-nil, zero value otherwise.

### GetHasBackupAddonOk

`func (o *InstanceProduct) GetHasBackupAddonOk() (*bool, bool)`

GetHasBackupAddonOk returns a tuple with the HasBackupAddon field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetHasBackupAddon

`func (o *InstanceProduct) SetHasBackupAddon(v bool)`

SetHasBackupAddon sets HasBackupAddon field to given value.

### HasHasBackupAddon

`func (o *InstanceProduct) HasHasBackupAddon() bool`

HasHasBackupAddon returns a boolean if a field has been set.

### GetHasWindows

`func (o *InstanceProduct) GetHasWindows() bool`

GetHasWindows returns the HasWindows field if non-nil, zero value otherwise.

### GetHasWindowsOk

`func (o *InstanceProduct) GetHasWindowsOk() (*bool, bool)`

GetHasWindowsOk returns a tuple with the HasWindows field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetHasWindows

`func (o *InstanceProduct) SetHasWindows(v bool)`

SetHasWindows sets HasWindows field to given value.

### HasHasWindows

`func (o *InstanceProduct) HasHasWindows() bool`

HasHasWindows returns a boolean if a field has been set.

### GetHasLocationFee

`func (o *InstanceProduct) GetHasLocationFee() bool`

GetHasLocationFee returns the HasLocationFee field if non-nil, zero value otherwise.

### GetHasLocationFeeOk

`func (o *InstanceProduct) GetHasLocationFeeOk() (*bool, bool)`

GetHasLocationFeeOk returns a tuple with the HasLocationFee field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetHasLocationFee

`func (o *InstanceProduct) SetHasLocationFee(v bool)`

SetHasLocationFee sets HasLocationFee field to given value.

### HasHasLocationFee

`func (o *InstanceProduct) HasHasLocationFee() bool`

HasHasLocationFee returns a boolean if a field has been set.

### GetCurrent

`func (o *InstanceProduct) GetCurrent() bool`

GetCurrent returns the Current field if non-nil, zero value otherwise.

### GetCurrentOk

`func (o *InstanceProduct) GetCurrentOk() (*bool, bool)`

GetCurrentOk returns a tuple with the Current field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCurrent

`func (o *InstanceProduct) SetCurrent(v bool)`

SetCurrent sets Current field to given value.


### GetOfferId

`func (o *InstanceProduct) GetOfferId() int64`

GetOfferId returns the OfferId field if non-nil, zero value otherwise.

### GetOfferIdOk

`func (o *InstanceProduct) GetOfferIdOk() (*int64, bool)`

GetOfferIdOk returns a tuple with the OfferId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetOfferId

`func (o *InstanceProduct) SetOfferId(v int64)`

SetOfferId sets OfferId field to given value.

### HasOfferId

`func (o *InstanceProduct) HasOfferId() bool`

HasOfferId returns a boolean if a field has been set.

### GetLocationChangeRequired

`func (o *InstanceProduct) GetLocationChangeRequired() bool`

GetLocationChangeRequired returns the LocationChangeRequired field if non-nil, zero value otherwise.

### GetLocationChangeRequiredOk

`func (o *InstanceProduct) GetLocationChangeRequiredOk() (*bool, bool)`

GetLocationChangeRequiredOk returns a tuple with the LocationChangeRequired field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetLocationChangeRequired

`func (o *InstanceProduct) SetLocationChangeRequired(v bool)`

SetLocationChangeRequired sets LocationChangeRequired field to given value.

### HasLocationChangeRequired

`func (o *InstanceProduct) HasLocationChangeRequired() bool`

HasLocationChangeRequired returns a boolean if a field has been set.

### GetLiveMigrationAvailable

`func (o *InstanceProduct) GetLiveMigrationAvailable() bool`

GetLiveMigrationAvailable returns the LiveMigrationAvailable field if non-nil, zero value otherwise.

### GetLiveMigrationAvailableOk

`func (o *InstanceProduct) GetLiveMigrationAvailableOk() (*bool, bool)`

GetLiveMigrationAvailableOk returns a tuple with the LiveMigrationAvailable field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetLiveMigrationAvailable

`func (o *InstanceProduct) SetLiveMigrationAvailable(v bool)`

SetLiveMigrationAvailable sets LiveMigrationAvailable field to given value.

### HasLiveMigrationAvailable

`func (o *InstanceProduct) HasLiveMigrationAvailable() bool`

HasLiveMigrationAvailable returns a boolean if a field has been set.

### GetLiveMigrationDisabledReason

`func (o *InstanceProduct) GetLiveMigrationDisabledReason() string`

GetLiveMigrationDisabledReason returns the LiveMigrationDisabledReason field if non-nil, zero value otherwise.

### GetLiveMigrationDisabledReasonOk

`func (o *InstanceProduct) GetLiveMigrationDisabledReasonOk() (*string, bool)`

GetLiveMigrationDisabledReasonOk returns a tuple with the LiveMigrationDisabledReason field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetLiveMigrationDisabledReason

`func (o *InstanceProduct) SetLiveMigrationDisabledReason(v string)`

SetLiveMigrationDisabledReason sets LiveMigrationDisabledReason field to given value.

### HasLiveMigrationDisabledReason

`func (o *InstanceProduct) HasLiveMigrationDisabledReason() bool`

HasLiveMigrationDisabledReason returns a boolean if a field has been set.

### SetLiveMigrationDisabledReasonNil

`func (o *InstanceProduct) SetLiveMigrationDisabledReasonNil(b bool)`

 SetLiveMigrationDisabledReasonNil sets the value for LiveMigrationDisabledReason to be an explicit nil

### UnsetLiveMigrationDisabledReason
`func (o *InstanceProduct) UnsetLiveMigrationDisabledReason()`

UnsetLiveMigrationDisabledReason ensures that no value is present for LiveMigrationDisabledReason, not even an explicit nil
### GetStorageExtensionAvailable

`func (o *InstanceProduct) GetStorageExtensionAvailable() bool`

GetStorageExtensionAvailable returns the StorageExtensionAvailable field if non-nil, zero value otherwise.

### GetStorageExtensionAvailableOk

`func (o *InstanceProduct) GetStorageExtensionAvailableOk() (*bool, bool)`

GetStorageExtensionAvailableOk returns a tuple with the StorageExtensionAvailable field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetStorageExtensionAvailable

`func (o *InstanceProduct) SetStorageExtensionAvailable(v bool)`

SetStorageExtensionAvailable sets StorageExtensionAvailable field to given value.

### HasStorageExtensionAvailable

`func (o *InstanceProduct) HasStorageExtensionAvailable() bool`

HasStorageExtensionAvailable returns a boolean if a field has been set.

### GetBackupAvailable

`func (o *InstanceProduct) GetBackupAvailable() bool`

GetBackupAvailable returns the BackupAvailable field if non-nil, zero value otherwise.

### GetBackupAvailableOk

`func (o *InstanceProduct) GetBackupAvailableOk() (*bool, bool)`

GetBackupAvailableOk returns a tuple with the BackupAvailable field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetBackupAvailable

`func (o *InstanceProduct) SetBackupAvailable(v bool)`

SetBackupAvailable sets BackupAvailable field to given value.

### HasBackupAvailable

`func (o *InstanceProduct) HasBackupAvailable() bool`

HasBackupAvailable returns a boolean if a field has been set.

### GetUpgradeDiscount

`func (o *InstanceProduct) GetUpgradeDiscount() int64`

GetUpgradeDiscount returns the UpgradeDiscount field if non-nil, zero value otherwise.

### GetUpgradeDiscountOk

`func (o *InstanceProduct) GetUpgradeDiscountOk() (*int64, bool)`

GetUpgradeDiscountOk returns a tuple with the UpgradeDiscount field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetUpgradeDiscount

`func (o *InstanceProduct) SetUpgradeDiscount(v int64)`

SetUpgradeDiscount sets UpgradeDiscount field to given value.

### HasUpgradeDiscount

`func (o *InstanceProduct) HasUpgradeDiscount() bool`

HasUpgradeDiscount returns a boolean if a field has been set.

### GetVsOriginalPrice

`func (o *InstanceProduct) GetVsOriginalPrice() float32`

GetVsOriginalPrice returns the VsOriginalPrice field if non-nil, zero value otherwise.

### GetVsOriginalPriceOk

`func (o *InstanceProduct) GetVsOriginalPriceOk() (*float32, bool)`

GetVsOriginalPriceOk returns a tuple with the VsOriginalPrice field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetVsOriginalPrice

`func (o *InstanceProduct) SetVsOriginalPrice(v float32)`

SetVsOriginalPrice sets VsOriginalPrice field to given value.

### HasVsOriginalPrice

`func (o *InstanceProduct) HasVsOriginalPrice() bool`

HasVsOriginalPrice returns a boolean if a field has been set.

### GetRequiredConfirmations

`func (o *InstanceProduct) GetRequiredConfirmations() []string`

GetRequiredConfirmations returns the RequiredConfirmations field if non-nil, zero value otherwise.

### GetRequiredConfirmationsOk

`func (o *InstanceProduct) GetRequiredConfirmationsOk() (*[]string, bool)`

GetRequiredConfirmationsOk returns a tuple with the RequiredConfirmations field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetRequiredConfirmations

`func (o *InstanceProduct) SetRequiredConfirmations(v []string)`

SetRequiredConfirmations sets RequiredConfirmations field to given value.

### HasRequiredConfirmations

`func (o *InstanceProduct) HasRequiredConfirmations() bool`

HasRequiredConfirmations returns a boolean if a field has been set.

### GetPriceDifferenceWithStorageExtension

`func (o *InstanceProduct) GetPriceDifferenceWithStorageExtension() float32`

GetPriceDifferenceWithStorageExtension returns the PriceDifferenceWithStorageExtension field if non-nil, zero value otherwise.

### GetPriceDifferenceWithStorageExtensionOk

`func (o *InstanceProduct) GetPriceDifferenceWithStorageExtensionOk() (*float32, bool)`

GetPriceDifferenceWithStorageExtensionOk returns a tuple with the PriceDifferenceWithStorageExtension field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetPriceDifferenceWithStorageExtension

`func (o *InstanceProduct) SetPriceDifferenceWithStorageExtension(v float32)`

SetPriceDifferenceWithStorageExtension sets PriceDifferenceWithStorageExtension field to given value.

### HasPriceDifferenceWithStorageExtension

`func (o *InstanceProduct) HasPriceDifferenceWithStorageExtension() bool`

HasPriceDifferenceWithStorageExtension returns a boolean if a field has been set.

### GetPriceDifferenceWithoutStorageExtension

`func (o *InstanceProduct) GetPriceDifferenceWithoutStorageExtension() float32`

GetPriceDifferenceWithoutStorageExtension returns the PriceDifferenceWithoutStorageExtension field if non-nil, zero value otherwise.

### GetPriceDifferenceWithoutStorageExtensionOk

`func (o *InstanceProduct) GetPriceDifferenceWithoutStorageExtensionOk() (*float32, bool)`

GetPriceDifferenceWithoutStorageExtensionOk returns a tuple with the PriceDifferenceWithoutStorageExtension field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetPriceDifferenceWithoutStorageExtension

`func (o *InstanceProduct) SetPriceDifferenceWithoutStorageExtension(v float32)`

SetPriceDifferenceWithoutStorageExtension sets PriceDifferenceWithoutStorageExtension field to given value.

### HasPriceDifferenceWithoutStorageExtension

`func (o *InstanceProduct) HasPriceDifferenceWithoutStorageExtension() bool`

HasPriceDifferenceWithoutStorageExtension returns a boolean if a field has been set.


[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


