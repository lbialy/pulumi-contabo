# SsoTokenResponse

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**TenantId** | **string** | Your customer tenant id | 
**CustomerId** | **string** | Your customer number | 
**SsoToken** | **string** | SSO token UUID used for single sign-on. | 
**Url** | **string** | SSO URL to redirect the user to my.contabo.com. | 

## Methods

### NewSsoTokenResponse

`func NewSsoTokenResponse(tenantId string, customerId string, ssoToken string, url string, ) *SsoTokenResponse`

NewSsoTokenResponse instantiates a new SsoTokenResponse object
This constructor will assign default values to properties that have it defined,
and makes sure properties required by API are set, but the set of arguments
will change when the set of required properties is changed

### NewSsoTokenResponseWithDefaults

`func NewSsoTokenResponseWithDefaults() *SsoTokenResponse`

NewSsoTokenResponseWithDefaults instantiates a new SsoTokenResponse object
This constructor will only assign default values to properties that have it defined,
but it doesn't guarantee that properties required by API are set

### GetTenantId

`func (o *SsoTokenResponse) GetTenantId() string`

GetTenantId returns the TenantId field if non-nil, zero value otherwise.

### GetTenantIdOk

`func (o *SsoTokenResponse) GetTenantIdOk() (*string, bool)`

GetTenantIdOk returns a tuple with the TenantId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetTenantId

`func (o *SsoTokenResponse) SetTenantId(v string)`

SetTenantId sets TenantId field to given value.


### GetCustomerId

`func (o *SsoTokenResponse) GetCustomerId() string`

GetCustomerId returns the CustomerId field if non-nil, zero value otherwise.

### GetCustomerIdOk

`func (o *SsoTokenResponse) GetCustomerIdOk() (*string, bool)`

GetCustomerIdOk returns a tuple with the CustomerId field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetCustomerId

`func (o *SsoTokenResponse) SetCustomerId(v string)`

SetCustomerId sets CustomerId field to given value.


### GetSsoToken

`func (o *SsoTokenResponse) GetSsoToken() string`

GetSsoToken returns the SsoToken field if non-nil, zero value otherwise.

### GetSsoTokenOk

`func (o *SsoTokenResponse) GetSsoTokenOk() (*string, bool)`

GetSsoTokenOk returns a tuple with the SsoToken field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetSsoToken

`func (o *SsoTokenResponse) SetSsoToken(v string)`

SetSsoToken sets SsoToken field to given value.


### GetUrl

`func (o *SsoTokenResponse) GetUrl() string`

GetUrl returns the Url field if non-nil, zero value otherwise.

### GetUrlOk

`func (o *SsoTokenResponse) GetUrlOk() (*string, bool)`

GetUrlOk returns a tuple with the Url field if it's non-nil, zero value otherwise
and a boolean to check if the value has been set.

### SetUrl

`func (o *SsoTokenResponse) SetUrl(v string)`

SetUrl sets Url field to given value.



[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


