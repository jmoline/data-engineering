require 'test_helper'

describe Merchant do
  let(:merchant) { Merchant.new }

  describe "validations" do
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

  it "should respond to find_or_create" do
    Merchant.must_respond_to :find_or_create
  end

  describe "find_or_create" do
    it "should return an existing record when passed an existing name" do
      Merchant.stub(:where, [Merchant.new(name: "Big Box Store")]) do
        merchant = Merchant.find_or_create(name: "Little Mom and Pop")
        merchant.name.must_equal "Big Box Store"
      end
    end

    it "should return a new record when passed a new name" do
      Merchant.stub(:where, []) do
        Merchant.stub(:create!, Merchant.new(name: "Little Mom and Pop")) do
          merchant = Merchant.find_or_create(name: "Big Box Store")
          merchant.name.must_equal "Little Mom and Pop"
        end
      end
    end
  end
end
