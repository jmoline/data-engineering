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

  it "should respond to find_or_create" do
    Customer.must_respond_to :find_or_create
  end

  describe "find_or_create" do
    it "should return an existing record when passed an existing name" do
      Customer.stub(:where, [Customer.new(name: "William Murdoch")]) do
        customer = Customer.find_or_create(name: "Testy McTesterson")
        customer.name.must_equal "William Murdoch"
      end
    end

    it "should return a new record when passed a new name" do
      Customer.stub(:where, []) do
        Customer.stub(:create, Customer.new(name: "Testy McTesterson")) do
          customer = Customer.find_or_create(name: "William Murdoch")
          customer.name.must_equal "Testy McTesterson"
        end
      end
    end
  end
end
