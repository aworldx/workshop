require 'open-uri'

module HttpClient
  API_URL = "http://ipgeobase.ru:7020/geo?ip="

  def self.make_response(ip)
    response = open("#{API_URL}#{ip}")
    {
      succeed: response.status[0] == "200",
      message: response.status[1],
      body: response.read,
    }
  rescue OpenURI::HTTPError => e
     { succeed: false, message: e.message }
  end
end
