require 'workshop'
require 'webmock/rspec'

describe Workshop::GeoBaseClient do
  WebMock.allow_net_connect!

  context "invoke method get_location without arguments" do
    before(:each) { @response = Workshop::GeoBaseClient.get_location() }

    it "returns an empty ip address message" do
      expect(@response).to eq("specify ip adress")
    end
  end

  context "invoke method get_location without params argument" do
    before(:each) { @response = Workshop::GeoBaseClient.get_location("109.248.241.51") }

    it "returns hash" do
      expect(@response).to be_kind_of(Hash)
    end

    it "response contains default keys" do
      expect(@response.has_key?(:city)).to be_truthy
      expect(@response.has_key?(:country)).to be_truthy
    end
  end

  context "invoke method get_location without custom params" do
    before(:each) do
      @response = Workshop::GeoBaseClient.get_location("109.248.241.51",
                                                       "city, country, blah")
    end

    it "returns hash" do
      expect(@response).to be_kind_of(Hash)
    end

    it %"response contains all keys specified by user with values
      (or empty values when service does not support this key)" do
      expect(@response.has_key?(:city)).to be_truthy
      expect(@response[:city]).not_to be_empty

      expect(@response.has_key?(:country)).to be_truthy
      expect(@response[:country]).not_to be_empty

      expect(@response.has_key?(:blah)).to be_truthy
      expect(@response[:blah]).to be_empty
    end
  end

  context "when Service Unavailable" do
    before do
      WebMock.stub_request(:any, /.*/).to_return(body: "errors", status: [503, "Service Unavailable"])
      @response = Workshop::GeoBaseClient.get_location("109.248.241.51")
    end

    it "returns message Service Unavailable" do
      expect(@response).to eq("503 Service Unavailable")
    end
  end
end
