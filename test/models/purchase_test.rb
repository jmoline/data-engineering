require 'test_helper'

describe Purchase do
  let(:purchase) { Purchase.new }

  describe "validations" do
    before do
      purchase.valid?
    end

    it "validates that there is a customer" do
      purchase.errors[:customer].must_equal ["can't be blank"]
    end

    it "validates that there is a merchant" do
      purchase.errors[:merchant].must_equal ["can't be blank"]
    end

    it "validates that there is a item" do
      purchase.errors[:item].must_equal ["can't be blank"]
    end

    describe "quantity" do
      it "validates that there is a quantity" do
        purchase.errors[:quantity].must_equal ["is not a number"]
      end

      it "validates that the quantity is greater than 0" do
        purchase.quantity = -2
        purchase.valid?
        purchase.errors[:quantity].must_equal ["must be greater than 0"]
      end

      it "passes validation when quantity is present and greater than 0" do
        purchase.quantity = 2
        purchase.valid?
        purchase.errors[:quantity].must_be_empty
      end
    end
  end

  describe "total" do
    it "should return the product of quantity and item price" do
      item = Item.new(price: 12)
      purchase = Purchase.new(quantity: 2, item: item)
      purchase.total.must_equal 24
    end
  end
end
