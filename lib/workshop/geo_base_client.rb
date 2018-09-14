require './http_client'
require './geo_parser'

module Workshop
  class GeoBaseClient
    def get_location(ip, params)
      response = HttpClient.make_response(ip)
      return response[:message] unless response[:succeed]

      GeoParser.parse_response(response[:body], params)
    end
  end
end
