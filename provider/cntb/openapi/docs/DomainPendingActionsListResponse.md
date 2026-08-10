# DomainPendingActionsListResponse

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**Data** | [**[]DomainPendingActionResponse**](DomainPendingActionResponse.md) | Domains with an unacknowledged outbound transfer | 
**Links** | [**SelfLinks**](SelfLinks.md) |  | 

## Methods

### NewDomainPendingActionsListResponse

`func NewDomainPendingActionsListResponse(data []DomainPendingActionResponse, links SelfLinks, ) *DomainPendingActionsListResponse`

NewDomainPendingActionsListResponse instantiates a new DomainPendingActionsListResponse object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewDomainPendingActionsListResponseWithDefaults

`func NewDomainPendingActionsListResponseWithDefaults() *DomainPendingActionsListResponse`

NewDomainPendingActionsListResponseWithDefaults instantiates a new DomainPendingActionsListResponse object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetData

`func (o *DomainPendingActionsListResponse) GetData() []DomainPendingActionResponse`

GetData returns the Data field if non-nil, zero value otherwise.

### GetDataOk

`func (o *DomainPendingActionsListResponse) GetDataOk() (*[]DomainPendingActionResponse, bool)`

GetDataOk returns a tuple with the Data field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetData

`func (o *DomainPendingActionsListResponse) SetData(v []DomainPendingActionResponse)`

SetData sets Data field to given value.


### GetLinks

`func (o *DomainPendingActionsListResponse) GetLinks() SelfLinks`

GetLinks returns the Links field if non-nil, zero value otherwise.

### GetLinksOk

`func (o *DomainPendingActionsListResponse) GetLinksOk() (*SelfLinks, bool)`

GetLinksOk returns a tuple with the Links field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetLinks

`func (o *DomainPendingActionsListResponse) SetLinks(v SelfLinks)`

SetLinks sets Links field to given value.



[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


