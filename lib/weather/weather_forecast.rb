class WeatherForecast
  autoload 'MetaWeather', 'weather/meta_weather'
  autoload 'OpenWeather', 'weather/open_weather'
  autoload 'HttpClient', 'http/http_client'

  def initialize(options)
    @default_service_name = options.fetch(:default_service_name, :meta_weather)
    @custom_services = options.fetch(:custom_services, {})
    @http_client = options.fetch(:http_client, HttpClient)
  end

  def get_info(city, service_name = nil)
    get_service(service_name || @default_service_name).get_info(city, @http_client)
  end

  def self.base_services
    {
      meta_weather: MetaWeather.new,
      open_weather: OpenWeather.new
    }
  end

  private

  def get_service(service_name)
    @custom_services.fetch(service_name, nil) || WeatherForecast.base_services.fetch(service_name)
  end
end
