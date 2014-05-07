require 'test_helper'

describe Merchant do
  let(:merchant) { Merchant.new }

  before do
    merchant.valid?
  end

  it "validates that there is a name" do
    merchant.errors[:name].must_equal ["can't be blank"]
  end

  it "validates that there is an address" do
    merchant.errors[:address].must_equal ["can't be blank"]
  end
end
