# UpgradeInstanceProductRequest

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**OfferId** | **int64** | ID of the upgrade offer as provided by the upgrade options. | 
**ProvisioningType** | **string** | Provisioning type for the upgrade. Use &#x60;installation&#x60; for a fresh installation or &#x60;migration&#x60; to keep the instance&#39;s existing data. | 
**ImageId** | Pointer to **string** | ImageId of the image to install (only in case of &#x60;installation&#x60;). | [optional] 
**ApplicationId** | Pointer to **string** | ApplicationId of the panel to install (only in case of &#x60;installation&#x60;). | [optional] 
**StorageAddon** | Pointer to **bool** | Set to true to keep the storage extension addon (only for SSD and NVMe). | [optional] 
**Remarks** | Pointer to **string** | Customer remarks for the upgrade. | [optional] 

## Methods

### NewUpgradeInstanceProductRequest

`func NewUpgradeInstanceProductRequest(offerId int64, provisioningType string, ) *UpgradeInstanceProductRequest`

NewUpgradeInstanceProductRequest instantiates a new UpgradeInstanceProductRequest object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewUpgradeInstanceProductRequestWithDefaults

`func NewUpgradeInstanceProductRequestWithDefaults() *UpgradeInstanceProductRequest`

NewUpgradeInstanceProductRequestWithDefaults instantiates a new UpgradeInstanceProductRequest object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetOfferId

`func (o *UpgradeInstanceProductRequest) GetOfferId() int64`

GetOfferId returns the OfferId field if non-nil, zero value otherwise.

### GetOfferIdOk

`func (o *UpgradeInstanceProductRequest) GetOfferIdOk() (*int64, bool)`

GetOfferIdOk returns a tuple with the OfferId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetOfferId

`func (o *UpgradeInstanceProductRequest) SetOfferId(v int64)`

SetOfferId sets OfferId field to given value.


### GetProvisioningType

`func (o *UpgradeInstanceProductRequest) GetProvisioningType() string`

GetProvisioningType returns the ProvisioningType field if non-nil, zero value otherwise.

### GetProvisioningTypeOk

`func (o *UpgradeInstanceProductRequest) GetProvisioningTypeOk() (*string, bool)`

GetProvisioningTypeOk returns a tuple with the ProvisioningType field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetProvisioningType

`func (o *UpgradeInstanceProductRequest) SetProvisioningType(v string)`

SetProvisioningType sets ProvisioningType field to given value.


### GetImageId

`func (o *UpgradeInstanceProductRequest) GetImageId() string`

GetImageId returns the ImageId field if non-nil, zero value otherwise.

### GetImageIdOk

`func (o *UpgradeInstanceProductRequest) GetImageIdOk() (*string, bool)`

GetImageIdOk returns a tuple with the ImageId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetImageId

`func (o *UpgradeInstanceProductRequest) SetImageId(v string)`

SetImageId sets ImageId field to given value.

### HasImageId

`func (o *UpgradeInstanceProductRequest) HasImageId() bool`

HasImageId returns a boolean if a field has been set.

### GetApplicationId

`func (o *UpgradeInstanceProductRequest) GetApplicationId() string`

GetApplicationId returns the ApplicationId field if non-nil, zero value otherwise.

### GetApplicationIdOk

`func (o *UpgradeInstanceProductRequest) GetApplicationIdOk() (*string, bool)`

GetApplicationIdOk returns a tuple with the ApplicationId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetApplicationId

`func (o *UpgradeInstanceProductRequest) SetApplicationId(v string)`

SetApplicationId sets ApplicationId field to given value.

### HasApplicationId

`func (o *UpgradeInstanceProductRequest) HasApplicationId() bool`

HasApplicationId returns a boolean if a field has been set.

### GetStorageAddon

`func (o *UpgradeInstanceProductRequest) GetStorageAddon() bool`

GetStorageAddon returns the StorageAddon field if non-nil, zero value otherwise.

### GetStorageAddonOk

`func (o *UpgradeInstanceProductRequest) GetStorageAddonOk() (*bool, bool)`

GetStorageAddonOk returns a tuple with the StorageAddon field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetStorageAddon

`func (o *UpgradeInstanceProductRequest) SetStorageAddon(v bool)`

SetStorageAddon sets StorageAddon field to given value.

### HasStorageAddon

`func (o *UpgradeInstanceProductRequest) HasStorageAddon() bool`

HasStorageAddon returns a boolean if a field has been set.

### GetRemarks

`func (o *UpgradeInstanceProductRequest) GetRemarks() string`

GetRemarks returns the Remarks field if non-nil, zero value otherwise.

### GetRemarksOk

`func (o *UpgradeInstanceProductRequest) GetRemarksOk() (*string, bool)`

GetRemarksOk returns a tuple with the Remarks field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetRemarks

`func (o *UpgradeInstanceProductRequest) SetRemarks(v string)`

SetRemarks sets Remarks field to given value.

### HasRemarks

`func (o *UpgradeInstanceProductRequest) HasRemarks() bool`

HasRemarks returns a boolean if a field has been set.


[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


