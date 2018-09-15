require 'geo_client'
require 'helpers/test_http_client'

describe GeoClient do
  context "#get_location" do
    before(:each) do
      @response = GeoClient.get_location("109.248.241.51", "city, country",
                                         TestHttpClient)
    end

    it %"returns structure with city and country" do
      expect(@response.has_key?(:city)).to be_truthy
      expect(@response[:city]).not_to be_empty

      expect(@response.has_key?(:country)).to be_truthy
      expect(@response[:country]).not_to be_empty
    end
  end
end
