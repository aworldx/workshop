module GeoClient
  autoload 'HttpClient', 'geo/http_client'
  autoload 'GeoParser', 'geo/geo_parser'

  API_URL = "http://ipgeobase.ru:7020/geo?ip="

  def self.get_location(ip = nil, http_client = HttpClient)
    return "specify ip adress" if ip.nil? || ip.empty?

    response = http_client.make_response("#{API_URL}#{ip}")
    return response[:message] unless response[:succeed]

    GeoParser.parse_response(response[:body])
  end
end