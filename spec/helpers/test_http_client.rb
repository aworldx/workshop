module TestHttpClient
  class << self
    attr_accessor :fixture_name

    def make_request(param = nil)
      {
        succeed: true,
        message: "OK",
        body: File.open("spec/fixtures/#{@fixture_name}.xml").read
      }
    end
  end
end
