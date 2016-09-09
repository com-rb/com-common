# frozen_string_literal: true

::RSpec.describe ::Com::Common::StandardError do
  it { expect(described_class).to include(::Com::StandardError) }
end
