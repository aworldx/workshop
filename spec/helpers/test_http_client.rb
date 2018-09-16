module TestHttpClient
  class << self
    def make_request(addr)
      response = {
        succeed: true,
        message: "OK"
      }

      file_name = if addr.include?('geobase')
                    "spec/fixtures/geo_response.xml"
                  elsif addr.include?('metaweather') && addr.include?('search')
                    "spec/fixtures/meta_weather_city_response.json"
                  elsif addr.include?('metaweather')
                    "spec/fixtures/meta_weather_response.json"
                  elsif addr.include?('openweathermap')
                    "spec/fixtures/open_weather_response.json"
                  end
      response.merge!(body: File.open(file_name).read)
      response
    end
  end
end
