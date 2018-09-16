module TestHttpClient
  class << self
    def make_request(addr)
      response = {
        succeed: true,
        message: "OK"
      }

      if addr.include?('geobase')
        response.merge!(body: File.open("spec/fixtures/geo_response.xml").read)
      elsif addr.include?('metaweather') && addr.include?('search')
        response.merge!(body: File.open("spec/fixtures/meta_weather_city_response.json").read)
      elsif addr.include?('metaweather')
        response.merge!(body: File.open("spec/fixtures/meta_weather_response.json").read)
      elsif addr.include?('openweathermap')
        response.merge!(body: File.open("spec/fixtures/open_weather_response.json").read)
      end

      response
    end
  end
end
