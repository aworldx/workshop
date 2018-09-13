require 'workshop'

describe Workshop::Foo do
  it "broccoli is gross" do
    expect(Workshop::Foo.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(Workshop::Foo.portray("Not Broccoli")).to eql("Delicious!")
  end
end
