require 'workshop'

describe Workshop::GeoBaseClient do
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
end
