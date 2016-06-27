=begin
#Vericred API

#Vericred's API allows you to search for Health Plans that a specific doctor accepts.  ## Getting Started  Visit our [Developer Portal](https://vericred.3scale.net) to create an account.  Once you have created an account, you can create one Application for Production and another for our Sandbox (select the appropriate Plan when you create the Application).  ## Authentication  To authenticate, pass the API Key you created in the Developer Portal as a `Vericred-Api-Key` header.  `curl -H 'Vericred-Api-Key: YOUR_KEY' \"https://api.vericred.com/providers?search_term=Foo&zip_code=11215\"`  ## Versioning  Vericred's API default to the latest version.  However, if you need a specific version, you can request it with an `Accept-Version` header.  The current version is `v3`.  Previous versions are `v1` and `v2`.  `curl -H 'Vericred-Api-Key: YOUR_KEY' -H 'Accept-Version: v2' \"https://api.vericred.com/providers?search_term=Foo&zip_code=11215\"`  ## Pagination  Endpoints that accept `page` and `per_page` parameters are paginated. They expose four additional fields that contain data about your position in the response, namely `Total`, `Per-Page`, `Link`, and `Page` as described in [RFC-5988](https://tools.ietf.org/html/rfc5988).  For example, to display 5 results per page and view the second page of a `GET` to `/networks`, your final request would be `GET /networks?....page=2&per_page=5`. ```  ## Sideloading  When we return multiple levels of an object graph (e.g. `Provider`s and their `State`s we sideload the associated data.  In this example, we would provide an Array of `State`s and a `state_id` for each provider.  This is done primarily to reduce the payload size since many of the `Provider`s will share a `State`  ``` {   providers: [{ id: 1, state_id: 1}, { id: 2, state_id: 1 }],   states: [{ id: 1, code: 'NY' }] } ```  If you need the second level of the object graph, you can just match the corresponding id.  ## Selecting specific data  All endpoints allow you to specify which fields you would like to return. This allows you to limit the response to contain only the data you need.  For example, let's take a request that returns the following JSON by default  ``` {   provider: {     id: 1,     name: 'John',     phone: '1234567890',     field_we_dont_care_about: 'value_we_dont_care_about'   },   states: [{     id: 1,     name: 'New York',     code: 'NY',     field_we_dont_care_about: 'value_we_dont_care_about'   }] } ```  To limit our results to only return the fields we care about, we specify the `select` query string parameter for the corresponding fields in the JSON document.  In this case, we want to select `name` and `phone` from the `provider` key, so we would add the parameters `select=provider.name,provider.phone`. We also want the `name` and `code` from the `states` key, so we would add the parameters `select=states.name,staes.code`.  The id field of each document is always returned whether or not it is requested.  Our final request would be `GET /providers/12345?select=provider.name,provider.phone,states.name,states.code`  The response would be  ``` {   provider: {     id: 1,     name: 'John',     phone: '1234567890'   },   states: [{     id: 1,     name: 'New York',     code: 'NY'   }] } ```  

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require "uri"

module VericredClient
  class DrugsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Search for DrugCoverages
    # Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug
    # @param ndc_package_code NDC package code
    # @param audience Two-character state code
    # @param state_code Two-character state code
    # @param [Hash] opts the optional parameters
    # @return [DrugCoverageResponse]
    def get_drug_coverages(ndc_package_code, audience, state_code, opts = {})
      data, _status_code, _headers = get_drug_coverages_with_http_info(ndc_package_code, audience, state_code, opts)
      return data
    end

    # Search for DrugCoverages
    # Drug Coverages are the specific tier level, quantity limit, prior authorization and step therapy for a given Drug/Plan combination. This endpoint returns all DrugCoverages for a given Drug
    # @param ndc_package_code NDC package code
    # @param audience Two-character state code
    # @param state_code Two-character state code
    # @param [Hash] opts the optional parameters
    # @return [Array<(DrugCoverageResponse, Fixnum, Hash)>] DrugCoverageResponse data, response status code and response headers
    def get_drug_coverages_with_http_info(ndc_package_code, audience, state_code, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DrugsApi.get_drug_coverages ..."
      end
      # verify the required parameter 'ndc_package_code' is set
      fail ArgumentError, "Missing the required parameter 'ndc_package_code' when calling DrugsApi.get_drug_coverages" if ndc_package_code.nil?
      # verify the required parameter 'audience' is set
      fail ArgumentError, "Missing the required parameter 'audience' when calling DrugsApi.get_drug_coverages" if audience.nil?
      # verify the required parameter 'state_code' is set
      fail ArgumentError, "Missing the required parameter 'state_code' when calling DrugsApi.get_drug_coverages" if state_code.nil?
      # resource path
      local_var_path = "/drug_packages/{ndc_package_code}/coverages".sub('{format}','json').sub('{' + 'ndc_package_code' + '}', ndc_package_code.to_s)

      # query parameters
      query_params = {}
      query_params[:'audience'] = audience
      query_params[:'state_code'] = state_code

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = []
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = []
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['Vericred-Api-Key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DrugCoverageResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DrugsApi#get_drug_coverages\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Drug Search
    # Search for drugs by proprietary name
    # @param search_term Full or partial proprietary name of drug
    # @param [Hash] opts the optional parameters
    # @return [DrugSearchResponse]
    def list_drugs(search_term, opts = {})
      data, _status_code, _headers = list_drugs_with_http_info(search_term, opts)
      return data
    end

    # Drug Search
    # Search for drugs by proprietary name
    # @param search_term Full or partial proprietary name of drug
    # @param [Hash] opts the optional parameters
    # @return [Array<(DrugSearchResponse, Fixnum, Hash)>] DrugSearchResponse data, response status code and response headers
    def list_drugs_with_http_info(search_term, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: DrugsApi.list_drugs ..."
      end
      # verify the required parameter 'search_term' is set
      fail ArgumentError, "Missing the required parameter 'search_term' when calling DrugsApi.list_drugs" if search_term.nil?
      # resource path
      local_var_path = "/drugs".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'search_term'] = search_term

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['Vericred-Api-Key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'DrugSearchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DrugsApi#list_drugs\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
