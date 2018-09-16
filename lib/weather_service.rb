require 'byebug'

module WeatherService
  autoload 'WeatherForecast', 'weather/weather_forecast'

  def self.current_weather(city, service_name = nil)
    wf = WeatherForecast.new
    wf.get_info(city, service_name)
  end
end
