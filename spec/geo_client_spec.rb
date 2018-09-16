require 'geo_client'
require 'helpers/test_http_client'

describe GeoClient do
  context "#get_location" do
    before(:each) do
      TestHttpClient.fixture_name = 'geo_response'
      @response = GeoClient.get_location("109.248.241.51", TestHttpClient)
    end

    it %"returns structure with city and country" do
      expect(@response[:city]).to eq('Казань')
      expect(@response[:country]).to eq('RU')
    end
  end
end
