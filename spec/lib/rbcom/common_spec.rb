::RSpec.describe ::Rbcom::Common do
  it "has a version number" do
    expect(::Rbcom::Common::VERSION).not_to be nil
  end

  it "has a version number in string format" do
    expect(::Rbcom::Common::VERSION).to be_instance_of(String)
  end
end
