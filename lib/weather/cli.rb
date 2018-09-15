require 'thor'

module Weather
  autoload 'WeatherService', 'weather_service'

  class CLI < Thor
    desc "weather", "returns weather in specified city"
    method_option :service, :required => true
    def weather(city)
      puts WeatherService.current_weather(city, options[:service])
    end
  end
end
