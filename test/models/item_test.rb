require 'test_helper'

describe Item do
  let(:item) { Item.new }

  describe "validations" do
    before do
      item.valid?
    end

    it "validates that there is a description" do
      item.errors[:description].must_equal ["can't be blank"]
    end

    describe "price" do
      it "validates that there is a price" do
        item.errors[:price].must_equal ["is not a number"]
      end

      it "validates that the price is greater than 0" do
        item.price = -2.0
        item.valid?
        item.errors[:price].must_equal ["must be greater than 0"]
      end

      it "passes validation when price is present and greater than 0" do
        item.price = 2
        item.valid?
        item.errors[:price].must_be_empty
      end
    end
  end
end
