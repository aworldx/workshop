require 'weather/weather_forecast'
require 'helpers/test_http_client'
require 'helpers/test_service'

describe WeatherForecast do
  before(:each) { @options = { http_client: TestHttpClient } }
  context "#get_info" do
    it %"use forecast without setting service" do
      wf = WeatherForecast.new(@options)
      response = wf.get_info("london")

      expect(response[:temperature]).to eq(18)
      expect(response[:weather_state]).to eq('Heavy Cloud')
    end

    it %"use forecast with specify service" do
      # setting default from options
      @options[:default_service_name] = :open_weather
      wf = WeatherForecast.new(@options)
      response = wf.get_info("london")

      expect(response[:temperature]).to eq(14)
      expect(response[:weather_state]).to eq('Clouds')

      # setting default from client interface
      response = wf.get_info("london", :meta_weather)
      expect(response[:temperature]).to eq(18)
      expect(response[:weather_state]).to eq('Heavy Cloud')

      # repeat request without setting service
      response = wf.get_info("london")
      expect(response[:temperature]).to eq(18)
      expect(response[:weather_state]).to eq('Heavy Cloud')
    end

    it "" do
      @options[:custom_services] = { test_service1: TestService.new }

      wf = WeatherForecast.new(@options)
      response = wf.get_info("london", :test_service1)

      expect(response[:temperature]).to eq(999)
      expect(response[:weather_state]).to eq('test')
    end
  end
end
