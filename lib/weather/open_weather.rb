require 'json'

class OpenWeather
  URL = %q'http://openweathermap.org/data/2.5/weather?q=@param
          &appid=b6907d289e10d714a6e88b30761fae22'

  def get_info(city, http_client)
    url = URL.gsub('@param', city)
    response = http_client.make_request(url)
    body = JSON.parse(response[:body])

    {
      temperature: body['main']['temp'].to_i,
      weather_state: body['weather'][0]['main']
    }
  end
end
