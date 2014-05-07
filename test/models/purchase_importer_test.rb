require 'csv'
require 'test_helper'

describe PurchaseImporter do
  it "should respond to import" do
    PurchaseImporter.must_respond_to :import
  end

  describe "import" do
    let(:tab) { CSV.read("#{Rails.root}/example_input.tab", headers: true, col_sep: "\t")}

    before do
      @purchase_count = Purchase.count
      @revenue = PurchaseImporter.import(tab)
    end

    it "should create 4 purchase records" do
      Purchase.count.must_equal @purchase_count+4
    end

    it "should return the total revenue of the imported purchases" do
      @revenue.must_equal 95
    end
  end
end

