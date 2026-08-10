# DomainPendingActionResponse

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**TenantId** | **string** | Your customer tenant id | 
**CustomerId** | **string** | Your customer number | 
**DomainId** | **string** | OpusDNS domain id (mirrors the local domain &#x60;opusId&#x60;) | 
**Domain** | **string** | Domain name (sld.tld) | 
**EventType** | **string** | Event type — always OUTBOUND_TRANSFER for this endpoint | 
**EventId** | **string** | OpusDNS event id to ACK/NACK against | 
**CreatedOn** | **time.Time** | When OpusDNS created the transfer-out event | 

## Methods

### NewDomainPendingActionResponse

`func NewDomainPendingActionResponse(tenantId string, customerId string, domainId string, domain string, eventType string, eventId string, createdOn time.Time, ) *DomainPendingActionResponse`

NewDomainPendingActionResponse instantiates a new DomainPendingActionResponse object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewDomainPendingActionResponseWithDefaults

`func NewDomainPendingActionResponseWithDefaults() *DomainPendingActionResponse`

NewDomainPendingActionResponseWithDefaults instantiates a new DomainPendingActionResponse object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetTenantId

`func (o *DomainPendingActionResponse) GetTenantId() string`

GetTenantId returns the TenantId field if non-nil, zero value otherwise.

### GetTenantIdOk

`func (o *DomainPendingActionResponse) GetTenantIdOk() (*string, bool)`

GetTenantIdOk returns a tuple with the TenantId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetTenantId

`func (o *DomainPendingActionResponse) SetTenantId(v string)`

SetTenantId sets TenantId field to given value.


### GetCustomerId

`func (o *DomainPendingActionResponse) GetCustomerId() string`

GetCustomerId returns the CustomerId field if non-nil, zero value otherwise.

### GetCustomerIdOk

`func (o *DomainPendingActionResponse) GetCustomerIdOk() (*string, bool)`

GetCustomerIdOk returns a tuple with the CustomerId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCustomerId

`func (o *DomainPendingActionResponse) SetCustomerId(v string)`

SetCustomerId sets CustomerId field to given value.


### GetDomainId

`func (o *DomainPendingActionResponse) GetDomainId() string`

GetDomainId returns the DomainId field if non-nil, zero value otherwise.

### GetDomainIdOk

`func (o *DomainPendingActionResponse) GetDomainIdOk() (*string, bool)`

GetDomainIdOk returns a tuple with the DomainId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetDomainId

`func (o *DomainPendingActionResponse) SetDomainId(v string)`

SetDomainId sets DomainId field to given value.


### GetDomain

`func (o *DomainPendingActionResponse) GetDomain() string`

GetDomain returns the Domain field if non-nil, zero value otherwise.

### GetDomainOk

`func (o *DomainPendingActionResponse) GetDomainOk() (*string, bool)`

GetDomainOk returns a tuple with the Domain field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetDomain

`func (o *DomainPendingActionResponse) SetDomain(v string)`

SetDomain sets Domain field to given value.


### GetEventType

`func (o *DomainPendingActionResponse) GetEventType() string`

GetEventType returns the EventType field if non-nil, zero value otherwise.

### GetEventTypeOk

`func (o *DomainPendingActionResponse) GetEventTypeOk() (*string, bool)`

GetEventTypeOk returns a tuple with the EventType field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetEventType

`func (o *DomainPendingActionResponse) SetEventType(v string)`

SetEventType sets EventType field to given value.


### GetEventId

`func (o *DomainPendingActionResponse) GetEventId() string`

GetEventId returns the EventId field if non-nil, zero value otherwise.

### GetEventIdOk

`func (o *DomainPendingActionResponse) GetEventIdOk() (*string, bool)`

GetEventIdOk returns a tuple with the EventId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetEventId

`func (o *DomainPendingActionResponse) SetEventId(v string)`

SetEventId sets EventId field to given value.


### GetCreatedOn

`func (o *DomainPendingActionResponse) GetCreatedOn() time.Time`

GetCreatedOn returns the CreatedOn field if non-nil, zero value otherwise.

### GetCreatedOnOk

`func (o *DomainPendingActionResponse) GetCreatedOnOk() (*time.Time, bool)`

GetCreatedOnOk returns a tuple with the CreatedOn field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCreatedOn

`func (o *DomainPendingActionResponse) SetCreatedOn(v time.Time)`

SetCreatedOn sets CreatedOn field to given value.



[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


