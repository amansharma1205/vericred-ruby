# vericred_client

VericredClient - the Ruby gem for the Vericred API

Vericred's API allows you to search for Health Plans that a specific doctor
accepts.

## Getting Started

Visit our [Developer Portal](https://vericred.3scale.net) to
create an account.

Once you have created an account, you can create one Application for
Production and another for our Sandbox (select the appropriate Plan when
you create the Application).

## Authentication

To authenticate, pass the API Key you created in the Developer Portal as
a `Vericred-Api-Key` header.

`curl -H 'Vericred-Api-Key: YOUR_KEY' "https://api.vericred.com/providers?search_term=Foo&zip_code=11215"`

## Versioning

Vericred's API default to the latest version.  However, if you need a specific
version, you can request it with an `Accept-Version` header.

The current version is `v3`.  Previous versions are `v1` and `v2`.

`curl -H 'Vericred-Api-Key: YOUR_KEY' -H 'Accept-Version: v2' "https://api.vericred.com/providers?search_term=Foo&zip_code=11215"`

## Pagination

Most endpoints are not paginated.  It will be noted in the documentation if/when
an endpoint is paginated.

When pagination is present, a `meta` stanza will be present in the response
with the total number of records

```
{
  things: [{ id: 1 }, { id: 2 }],
  meta: { total: 500 }
}
```

## Sideloading

When we return multiple levels of an object graph (e.g. `Provider`s and their `State`s
we sideload the associated data.  In this example, we would provide an Array of
`State`s and a `state_id` for each provider.  This is done primarily to reduce the
payload size since many of the `Provider`s will share a `State`

```
{
  providers: [{ id: 1, state_id: 1}, { id: 2, state_id: 1 }],
  states: [{ id: 1, code: 'NY' }]
}
```

If you need the second level of the object graph, you can just match the
corresponding id.

## Selecting specific data

All endpoints allow you to specify which fields you would like to return.
This allows you to limit the response to contain only the data you need.

For example, let's take a request that returns the following JSON by default

```
{
  provider: {
    id: 1,
    name: 'John',
    phone: '1234567890',
    field_we_dont_care_about: 'value_we_dont_care_about'
  },
  states: [{
    id: 1,
    name: 'New York',
    code: 'NY',
    field_we_dont_care_about: 'value_we_dont_care_about'
  }]
}
```

To limit our results to only return the fields we care about, we specify the
`select` query string parameter for the corresponding fields in the JSON
document.

In this case, we want to select `name` and `phone` from the `provider` key,
so we would add the parameters `select=provider.name,provider.phone`.
We also want the `name` and `code` from the `states` key, so we would
add the parameters `select=states.name,staes.code`.  The id field of
each document is always returned whether or not it is requested.

Our final request would be `GET /providers/12345?select=provider.name,provider.phone,states.name,states.code`

The response would be

```
{
  provider: {
    id: 1,
    name: 'John',
    phone: '1234567890'
  },
  states: [{
    id: 1,
    name: 'New York',
    code: 'NY'
  }]
}
```



This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 1.0.0
- Package version: 0.0.5
- Build date: 2016-05-31T09:28:47.149-04:00
- Build package: class io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build vericred_client.gemspec
```

Then either install the gem locally:

```shell
gem install ./vericred_client-0.0.5.gem
```
(for development, run `gem install --dev ./vericred_client-0.0.5.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'vericred_client', '~> 0.0.5'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/YOUR_GIT_USR_ID/YOUR_GIT_REPO_ID, then add the following in the Gemfile:

    gem 'vericred_client', :git => 'https://github.com/YOUR_GIT_USR_ID/YOUR_GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'vericred_client'

api_instance = VericredClient::DrugsApi.new

ndc_package_code = "12345-4321-11" # String | NDC package code

audience = "individual" # String | Two-character state code

state_code = "NY" # String | Two-character state code

opts = { 
  vericred_api_key: "api-doc-key" # String | API Key
}

begin
  #Search for DrugCoverages
  result = api_instance.get_drug_coverages(ndc_package_code, audience, state_code, opts)
  p result
rescue VericredClient::ApiError => e
  puts "Exception when calling DrugsApi->get_drug_coverages: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.vericred.com/*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*VericredClient::DrugsApi* | [**get_drug_coverages**](docs/DrugsApi.md#get_drug_coverages) | **GET** /drug_packages/{ndc_package_code}/coverages | Search for DrugCoverages
*VericredClient::DrugsApi* | [**list_drugs**](docs/DrugsApi.md#list_drugs) | **GET** /drugs | Drug Search
*VericredClient::NetworksApi* | [**list_networks**](docs/NetworksApi.md#list_networks) | **GET** /networks | Networks
*VericredClient::PlansApi* | [**find_plans**](docs/PlansApi.md#find_plans) | **POST** /plans/search | Find Plans
*VericredClient::ProvidersApi* | [**get_provider**](docs/ProvidersApi.md#get_provider) | **GET** /providers/{npi} | Find a Provider
*VericredClient::ProvidersApi* | [**get_providers**](docs/ProvidersApi.md#get_providers) | **POST** /providers/search | Find Providers
*VericredClient::ZipCountiesApi* | [**get_zip_counties**](docs/ZipCountiesApi.md#get_zip_counties) | **GET** /zip_counties | Search for Zip Counties


## Documentation for Models

 - [VericredClient::Applicant](docs/Applicant.md)
 - [VericredClient::Base](docs/Base.md)
 - [VericredClient::Carrier](docs/Carrier.md)
 - [VericredClient::CarrierSubsidiary](docs/CarrierSubsidiary.md)
 - [VericredClient::County](docs/County.md)
 - [VericredClient::CountyBulk](docs/CountyBulk.md)
 - [VericredClient::Drug](docs/Drug.md)
 - [VericredClient::DrugCoverage](docs/DrugCoverage.md)
 - [VericredClient::DrugCoverageResponse](docs/DrugCoverageResponse.md)
 - [VericredClient::DrugPackage](docs/DrugPackage.md)
 - [VericredClient::DrugSearchResponse](docs/DrugSearchResponse.md)
 - [VericredClient::Meta](docs/Meta.md)
 - [VericredClient::Network](docs/Network.md)
 - [VericredClient::NetworkSearchResponse](docs/NetworkSearchResponse.md)
 - [VericredClient::Plan](docs/Plan.md)
 - [VericredClient::PlanCounty](docs/PlanCounty.md)
 - [VericredClient::PlanCountyBulk](docs/PlanCountyBulk.md)
 - [VericredClient::PlanSearchResponse](docs/PlanSearchResponse.md)
 - [VericredClient::PlanSearchResult](docs/PlanSearchResult.md)
 - [VericredClient::Pricing](docs/Pricing.md)
 - [VericredClient::Provider](docs/Provider.md)
 - [VericredClient::ProvidersSearchResponse](docs/ProvidersSearchResponse.md)
 - [VericredClient::RatingArea](docs/RatingArea.md)
 - [VericredClient::RequestPlanFind](docs/RequestPlanFind.md)
 - [VericredClient::RequestPlanFindApplicant](docs/RequestPlanFindApplicant.md)
 - [VericredClient::RequestPlanFindProvider](docs/RequestPlanFindProvider.md)
 - [VericredClient::RequestProvidersSearch](docs/RequestProvidersSearch.md)
 - [VericredClient::State](docs/State.md)
 - [VericredClient::ZipCode](docs/ZipCode.md)
 - [VericredClient::ZipCountiesResponse](docs/ZipCountiesResponse.md)
 - [VericredClient::ZipCounty](docs/ZipCounty.md)
 - [VericredClient::ZipCountyBulk](docs/ZipCountyBulk.md)
 - [VericredClient::ZipCountyResponse](docs/ZipCountyResponse.md)


## Documentation for Authorization

 All endpoints do not require authorization.

