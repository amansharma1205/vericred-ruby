# VericredClient::VisionPlanSearchRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**applicants** | [**Array&lt;VisionPlanSearchApplicant&gt;**](VisionPlanSearchApplicant.md) | Applicants for desired plans. | [optional] 
**issuer_id** | **Integer** | National-level issuer id | [optional] 
**enrollment_date** | **String** | Date of enrollment | [optional] 
**fips_code** | **String** | County code to determine eligibility | [optional] 
**zip_code** | **String** | 5-digit zip code - this helps determine pricing. | [optional] 
**market** | **String** | The audience of plan to search for. Possible values are individual, small_group, large_group | [optional] 
**page** | **Integer** | Selected page of paginated response. | [optional] 
**per_page** | **Integer** | Results per page of response. | [optional] 


