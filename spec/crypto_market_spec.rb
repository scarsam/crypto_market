require "spec_helper"

RSpec.describe CryptoMarket do
  it "has a version number" do
    expect(CryptoMarket::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
