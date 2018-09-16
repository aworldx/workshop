require 'json'

class MetaWeather
  CITY_URL = 'https://www.metaweather.com/api/location/search/?query=@param'
  URL = 'https://www.metaweather.com/api/location/@param'

  def get_info(city, http_client)
    result = get_location_id(city, http_client)
    city_id = result[0]['woeid']

    url = URL.gsub('@param', city_id.to_s)
    response = http_client.make_request(url)
    body = JSON.parse(response[:body])

    {
      temperature: body['consolidated_weather'][0]['the_temp'].to_i,
      weather_state: body['consolidated_weather'][0]['weather_state_name']
    }
  end

  def get_location_id(city, http_client)
    url = CITY_URL.gsub('@param', city)
    response = http_client.make_request(url)
    body = JSON.parse(response[:body])
  end
end
