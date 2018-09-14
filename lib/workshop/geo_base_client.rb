module Workshop
  module GeoBaseClient
    def self.get_location(ip = nil, params = 'country, city')
      return "specify ip adress" if ip.nil? || ip.empty?

      response = HttpClient.make_response(ip)
      return response[:message] unless response[:succeed]

      GeoParser.parse_response(response[:body], params)
    end
  end
end
