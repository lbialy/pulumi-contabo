# UpgradeInstanceProductData

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**TenantId** | **string** | Your customer tenant id | 
**CustomerId** | **string** | Your customer number | 
**InstanceId** | **int64** | The identifier of the instance | 
**TicketNumber** | **string** | Support ticket number created for the upgrade | 
**Automatic** | **bool** | Indicates whether the upgrade will be processed automatically or manually. | 

## Methods

### NewUpgradeInstanceProductData

`func NewUpgradeInstanceProductData(tenantId string, customerId string, instanceId int64, ticketNumber string, automatic bool, ) *UpgradeInstanceProductData`

NewUpgradeInstanceProductData instantiates a new UpgradeInstanceProductData object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewUpgradeInstanceProductDataWithDefaults

`func NewUpgradeInstanceProductDataWithDefaults() *UpgradeInstanceProductData`

NewUpgradeInstanceProductDataWithDefaults instantiates a new UpgradeInstanceProductData object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetTenantId

`func (o *UpgradeInstanceProductData) GetTenantId() string`

GetTenantId returns the TenantId field if non-nil, zero value otherwise.

### GetTenantIdOk

`func (o *UpgradeInstanceProductData) GetTenantIdOk() (*string, bool)`

GetTenantIdOk returns a tuple with the TenantId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetTenantId

`func (o *UpgradeInstanceProductData) SetTenantId(v string)`

SetTenantId sets TenantId field to given value.


### GetCustomerId

`func (o *UpgradeInstanceProductData) GetCustomerId() string`

GetCustomerId returns the CustomerId field if non-nil, zero value otherwise.

### GetCustomerIdOk

`func (o *UpgradeInstanceProductData) GetCustomerIdOk() (*string, bool)`

GetCustomerIdOk returns a tuple with the CustomerId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCustomerId

`func (o *UpgradeInstanceProductData) SetCustomerId(v string)`

SetCustomerId sets CustomerId field to given value.


### GetInstanceId

`func (o *UpgradeInstanceProductData) GetInstanceId() int64`

GetInstanceId returns the InstanceId field if non-nil, zero value otherwise.

### GetInstanceIdOk

`func (o *UpgradeInstanceProductData) GetInstanceIdOk() (*int64, bool)`

GetInstanceIdOk returns a tuple with the InstanceId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetInstanceId

`func (o *UpgradeInstanceProductData) SetInstanceId(v int64)`

SetInstanceId sets InstanceId field to given value.


### GetTicketNumber

`func (o *UpgradeInstanceProductData) GetTicketNumber() string`

GetTicketNumber returns the TicketNumber field if non-nil, zero value otherwise.

### GetTicketNumberOk

`func (o *UpgradeInstanceProductData) GetTicketNumberOk() (*string, bool)`

GetTicketNumberOk returns a tuple with the TicketNumber field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetTicketNumber

`func (o *UpgradeInstanceProductData) SetTicketNumber(v string)`

SetTicketNumber sets TicketNumber field to given value.


### GetAutomatic

`func (o *UpgradeInstanceProductData) GetAutomatic() bool`

GetAutomatic returns the Automatic field if non-nil, zero value otherwise.

### GetAutomaticOk

`func (o *UpgradeInstanceProductData) GetAutomaticOk() (*bool, bool)`

GetAutomaticOk returns a tuple with the Automatic field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetAutomatic

`func (o *UpgradeInstanceProductData) SetAutomatic(v bool)`

SetAutomatic sets Automatic field to given value.



[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


