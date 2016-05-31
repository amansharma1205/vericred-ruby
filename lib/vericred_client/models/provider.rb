=begin
Vericred API

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



OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require 'date'

module VericredClient
  class Provider
    # Is this provider accepting patients with a change of insurance?
    attr_accessor :accepting_change_of_payor_patients

    # Is this provider accepting new Medicaid patients?
    attr_accessor :accepting_medicaid_patients

    # Is this provider accepting new Medicare patients?
    attr_accessor :accepting_medicare_patients

    # Is this provider accepting new patients with private insurance?
    attr_accessor :accepting_private_patients

    # Is this provider accepting new patients via referrals?
    attr_accessor :accepting_referral_patients

    # City name (e.g. Springfield).
    attr_accessor :city

    # Primary email address to contact the provider.
    attr_accessor :email

    # Provider's gender (M or F)
    attr_accessor :gender

    # Given name for the provider.
    attr_accessor :first_name

    # List of HIOS ids for this provider
    attr_accessor :hios_ids

    # National Provider Index (NPI) number
    attr_accessor :id

    # Family name for the provider.
    attr_accessor :last_name

    # Latitude of provider
    attr_accessor :latitude

    # Longitude of provider
    attr_accessor :longitude

    # Middle name for the provider.
    attr_accessor :middle_name

    # Array of network ids
    attr_accessor :network_ids

    # Personal contact phone for the provider.
    attr_accessor :personal_phone

    # Office phone for the provider
    attr_accessor :phone

    # Preferred name for display (e.g. Dr. Francis White may prefer Dr. Frank White)
    attr_accessor :presentation_name

    # Name of the primary Specialty
    attr_accessor :specialty

    # State code for the provider's address (e.g. NY).
    attr_accessor :state

    # Foreign key to States
    attr_accessor :state_id

    # First line of the provider's street address.
    attr_accessor :street_line_1

    # Second line of the provider's street address.
    attr_accessor :street_line_2

    # Suffix for the provider's name (e.g. Jr)
    attr_accessor :suffix

    # Professional title for the provider (e.g. Dr).
    attr_accessor :title

    # Type of NPI number (individual provider vs organization).
    attr_accessor :type

    # Postal code for the provider's address (e.g. 11215)
    attr_accessor :zip_code

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'accepting_change_of_payor_patients' => :'accepting_change_of_payor_patients',
        :'accepting_medicaid_patients' => :'accepting_medicaid_patients',
        :'accepting_medicare_patients' => :'accepting_medicare_patients',
        :'accepting_private_patients' => :'accepting_private_patients',
        :'accepting_referral_patients' => :'accepting_referral_patients',
        :'city' => :'city',
        :'email' => :'email',
        :'gender' => :'gender',
        :'first_name' => :'first_name',
        :'hios_ids' => :'hios_ids',
        :'id' => :'id',
        :'last_name' => :'last_name',
        :'latitude' => :'latitude',
        :'longitude' => :'longitude',
        :'middle_name' => :'middle_name',
        :'network_ids' => :'network_ids',
        :'personal_phone' => :'personal_phone',
        :'phone' => :'phone',
        :'presentation_name' => :'presentation_name',
        :'specialty' => :'specialty',
        :'state' => :'state',
        :'state_id' => :'state_id',
        :'street_line_1' => :'street_line_1',
        :'street_line_2' => :'street_line_2',
        :'suffix' => :'suffix',
        :'title' => :'title',
        :'type' => :'type',
        :'zip_code' => :'zip_code'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'accepting_change_of_payor_patients' => :'BOOLEAN',
        :'accepting_medicaid_patients' => :'BOOLEAN',
        :'accepting_medicare_patients' => :'BOOLEAN',
        :'accepting_private_patients' => :'BOOLEAN',
        :'accepting_referral_patients' => :'BOOLEAN',
        :'city' => :'String',
        :'email' => :'String',
        :'gender' => :'String',
        :'first_name' => :'String',
        :'hios_ids' => :'Array<String>',
        :'id' => :'Integer',
        :'last_name' => :'String',
        :'latitude' => :'Float',
        :'longitude' => :'Float',
        :'middle_name' => :'String',
        :'network_ids' => :'Array<Integer>',
        :'personal_phone' => :'String',
        :'phone' => :'String',
        :'presentation_name' => :'String',
        :'specialty' => :'String',
        :'state' => :'String',
        :'state_id' => :'Integer',
        :'street_line_1' => :'String',
        :'street_line_2' => :'String',
        :'suffix' => :'String',
        :'title' => :'String',
        :'type' => :'String',
        :'zip_code' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'accepting_change_of_payor_patients')
        self.accepting_change_of_payor_patients = attributes[:'accepting_change_of_payor_patients']
      end

      if attributes.has_key?(:'accepting_medicaid_patients')
        self.accepting_medicaid_patients = attributes[:'accepting_medicaid_patients']
      end

      if attributes.has_key?(:'accepting_medicare_patients')
        self.accepting_medicare_patients = attributes[:'accepting_medicare_patients']
      end

      if attributes.has_key?(:'accepting_private_patients')
        self.accepting_private_patients = attributes[:'accepting_private_patients']
      end

      if attributes.has_key?(:'accepting_referral_patients')
        self.accepting_referral_patients = attributes[:'accepting_referral_patients']
      end

      if attributes.has_key?(:'city')
        self.city = attributes[:'city']
      end

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'gender')
        self.gender = attributes[:'gender']
      end

      if attributes.has_key?(:'first_name')
        self.first_name = attributes[:'first_name']
      end

      if attributes.has_key?(:'hios_ids')
        if (value = attributes[:'hios_ids']).is_a?(Array)
          self.hios_ids = value
        end
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'last_name')
        self.last_name = attributes[:'last_name']
      end

      if attributes.has_key?(:'latitude')
        self.latitude = attributes[:'latitude']
      end

      if attributes.has_key?(:'longitude')
        self.longitude = attributes[:'longitude']
      end

      if attributes.has_key?(:'middle_name')
        self.middle_name = attributes[:'middle_name']
      end

      if attributes.has_key?(:'network_ids')
        if (value = attributes[:'network_ids']).is_a?(Array)
          self.network_ids = value
        end
      end

      if attributes.has_key?(:'personal_phone')
        self.personal_phone = attributes[:'personal_phone']
      end

      if attributes.has_key?(:'phone')
        self.phone = attributes[:'phone']
      end

      if attributes.has_key?(:'presentation_name')
        self.presentation_name = attributes[:'presentation_name']
      end

      if attributes.has_key?(:'specialty')
        self.specialty = attributes[:'specialty']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.has_key?(:'state_id')
        self.state_id = attributes[:'state_id']
      end

      if attributes.has_key?(:'street_line_1')
        self.street_line_1 = attributes[:'street_line_1']
      end

      if attributes.has_key?(:'street_line_2')
        self.street_line_2 = attributes[:'street_line_2']
      end

      if attributes.has_key?(:'suffix')
        self.suffix = attributes[:'suffix']
      end

      if attributes.has_key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'zip_code')
        self.zip_code = attributes[:'zip_code']
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
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared 
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          accepting_change_of_payor_patients == o.accepting_change_of_payor_patients &&
          accepting_medicaid_patients == o.accepting_medicaid_patients &&
          accepting_medicare_patients == o.accepting_medicare_patients &&
          accepting_private_patients == o.accepting_private_patients &&
          accepting_referral_patients == o.accepting_referral_patients &&
          city == o.city &&
          email == o.email &&
          gender == o.gender &&
          first_name == o.first_name &&
          hios_ids == o.hios_ids &&
          id == o.id &&
          last_name == o.last_name &&
          latitude == o.latitude &&
          longitude == o.longitude &&
          middle_name == o.middle_name &&
          network_ids == o.network_ids &&
          personal_phone == o.personal_phone &&
          phone == o.phone &&
          presentation_name == o.presentation_name &&
          specialty == o.specialty &&
          state == o.state &&
          state_id == o.state_id &&
          street_line_1 == o.street_line_1 &&
          street_line_2 == o.street_line_2 &&
          suffix == o.suffix &&
          title == o.title &&
          type == o.type &&
          zip_code == o.zip_code
    end

    # @see the `==` method
    # @param [Object] Object to be compared 
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [accepting_change_of_payor_patients, accepting_medicaid_patients, accepting_medicare_patients, accepting_private_patients, accepting_referral_patients, city, email, gender, first_name, hios_ids, id, last_name, latitude, longitude, middle_name, network_ids, personal_phone, phone, presentation_name, specialty, state, state_id, street_line_1, street_line_2, suffix, title, type, zip_code].hash
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
