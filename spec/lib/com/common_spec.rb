# frozen_string_literal: true

::RSpec.describe ::Com::Common do
  it "has a version number" do
    expect(::Com::Common::VERSION).not_to be nil
  end

  it "has a version number in string format" do
    expect(::Com::Common::VERSION).to be_instance_of(String)
  end
end
