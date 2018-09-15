module GeoClient
  autoload 'HttpClient', 'geo/http_client'
  autoload 'GeoParser', 'geo/geo_parser'

  def self.get_location(ip = nil, params = 'country, city', http_client = HttpClient)
    return "specify ip adress" if ip.nil? || ip.empty?

    response = http_client.make_response(ip)
    return response[:message] unless response[:succeed]

    GeoParser.parse_response(response[:body], params)
  end
end
