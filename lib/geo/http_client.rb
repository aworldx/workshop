require 'open-uri'

module HttpClient
  def self.make_response(addr)
    response = open(addr)
    {
      succeed: response.status[0] == "200",
      message: response.status[1],
      body: response.read,
    }
  rescue OpenURI::HTTPError => e
     { succeed: false, message: e.message }
  end
end
