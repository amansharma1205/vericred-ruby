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

require 'date'

module VericredClient

  class PlanCounty
    # Foreign key to plan
    attr_accessor :plan_id

    # Foreign key to county
    attr_accessor :county_id


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'plan_id' => :'plan_id',
        :'county_id' => :'county_id'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'plan_id' => :'Integer',
        :'county_id' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'plan_id')
        self.plan_id = attributes[:'plan_id']
      end

      if attributes.has_key?(:'county_id')
        self.county_id = attributes[:'county_id']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          plan_id == o.plan_id &&
          county_id == o.county_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [plan_id, county_id].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = VericredClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
