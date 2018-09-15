require 'weather_service'
require 'helpers/http_client'

describe WeatherService do
  context "#current_weather" do
    it %"meta_weather service returns current weather in London" do
      HttpClient.fixture_name = 'meta_weather_response'
      @response = WeatherService.current_weather("london", :meta_weather, HttpClient)

      expect(@response[:temperature]).to eq(18)
      expect(@response[:weather_state]).to eq('Heavy Cloud')
    end

    it %"open_weather service returns current weather in London" do
      HttpClient.fixture_name = 'open_weather_response'
      @response = WeatherService.current_weather("london", :open_weather, HttpClient)

      expect(@response[:temperature]).to eq(14)
      expect(@response[:weather_state]).to eq('Clouds')
    end

    it %"foo service returns current weather in London" do
      @response = WeatherService.current_weather("london", :foo, HttpClient)

      expect(@response[:temperature]).to eq(-999)
      expect(@response[:weather_state]).to eq('brrrrr')
    end
  end
end