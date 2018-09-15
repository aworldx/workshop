class TestHttpClient
  def self.make_response(ip)
    {
      succeed: true,
      message: "OK",
      body: File.open("spec/fixtures/response.xml").read
    }
  end
end
