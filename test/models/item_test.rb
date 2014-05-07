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

  it "should respond to find_or_create" do
    Item.must_respond_to :find_or_create
  end

  describe "find_or_create" do
    it "should return an existing record when passed an existing name" do
      Item.stub(:where, [Item.new(description: "Big Item")]) do
        item = Item.find_or_create(description: "Little Item")
        item.description.must_equal "Big Item"
      end
    end

    it "should return a new record when passed a new name" do
      Item.stub(:where, []) do
        Item.stub(:create!, Item.new(description: "Little Item")) do
          item = Item.find_or_create(description: "Big Item")
          item.description.must_equal "Little Item"
        end
      end
    end
  end
end
