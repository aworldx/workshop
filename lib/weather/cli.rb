require 'thor'

module Weather
  autoload 'WeatherService', 'weather_service'

  class CLI < Thor
    desc "weather", "returns weather in specified city"
    method_option :service, :required => true
    def weather(city)
      result = WeatherService.current_weather(city, options[:service])
      puts result.map {|k, v| "#{k}: #{v}"}.join(', ')
    end
  end
end
