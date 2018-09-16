require 'byebug'
require 'json'

module WeatherService
  autoload 'HttpClient', 'http/http_client'

  class << self
    def current_weather(city, service_name, http_client = HttpClient)
      self.send(service_name, city, http_client)
    end

    def meta_weather(city, http_client)
      result = get_service_val(:meta_weather, :city_url, city, http_client)
      city_id = result[0]['woeid']

      result = get_service_val(:meta_weather, :url, city_id, http_client)

      {
        temperature: result['consolidated_weather'][0]['the_temp'].to_i,
        weather_state: result['consolidated_weather'][0]['weather_state_name']
      }
    end

    def open_weather(city, http_client)
      result = get_service_val(:open_weather, :url, city, http_client)

      {
        temperature: result['main']['temp'].to_i,
        weather_state: result['weather'][0]['main']
      }
    end

    def null_service()
      {
        temperature: -999,
        weather_state: 'brrrrr'
      }
    end

    def get_service_val(service_name, param_name, param_value, http_client)
      url = get_config(service_name, param_name, param_value)
      response = http_client.make_request(url)
      body = JSON.parse(response[:body])
    end

    def get_config(service_name, param, value)
      config = {
        meta_weather: {
          city_url: 'https://www.metaweather.com/api/location/search/?query=@param',
          url: 'https://www.metaweather.com/api/location/@param'
        },
        open_weather: {
          url: %q'http://openweathermap.org/data/2.5/weather?q=@param
                  &appid=b6907d289e10d714a6e88b30761fae22'
        }
      }

      config[service_name][param].gsub('@param', value.to_s)
    end

    def method_missing(service_name, city, http_client)
      null_service()
    end
  end
end
