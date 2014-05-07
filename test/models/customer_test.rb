require 'test_helper'

describe Customer do
  let(:customer) { Customer.new }

  describe "validations" do
    before do
      customer.valid?
    end

    it "validates that there is a name" do
      customer.errors[:name].must_equal ["can't be blank"]
    end
  end
end
