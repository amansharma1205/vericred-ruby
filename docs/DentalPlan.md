# VericredClient::DentalPlan

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The dental plan identifier | [optional] 
**name** | **String** | The dental plan name | [optional] 
**issuer_name** | **String** | Name of the insurance carrier | [optional] 
**audience** | **String** | The dental plan audience | [optional] 
**benefits_summary_url** | **String** | Link to the summary of benefits and coverage (SBC) document. | [optional] 
**logo_url** | **String** | Link to a copy of the insurance carrier&#39;s logo | [optional] 
**plan_type** | **String** | Category of the plan (e.g. EPO, HMO, PPO, POS, Indemnity, PACE,HMO w/POS, Cost, FFS, MSA) | [optional] 
**stand_alone** | **BOOLEAN** | Stand alone flag for dental plan | [optional] 
**source** | **String** | Source of the plan benefit data | [optional] 
**identifiers** | [**Array&lt;PlanIdentifier&gt;**](PlanIdentifier.md) | List of identifiers of this Plan | [optional] 
**benefits** | [**DentalPlanBenefits**](DentalPlanBenefits.md) | Dental Plan Benefits | [optional] 
**premium** | **Float** | Cumulative premium amount | [optional] 
**premium_source** | **String** | Source of the base pricing data | [optional] 


