class PurchaseImporter
  FIELDS = [ :customer_name,
             :item_description,
             :item_price,
             :quantity,
             :merchant_address,
             :merchant_name ]

  def self.import(data)
    data.inject(0) do |revenue, row|
      customer = Customer.find_or_create(name: value_for(:customer_name, row))
      merchant = Merchant.find_or_create(name: value_for(:merchant_name, row), address: value_for(:merchant_address, row))
      item = Item.find_or_create(description: value_for(:item_description, row), price: value_for(:item_price, row))
      purchase = item.purchases.create(customer: customer, merchant: merchant, quantity: value_for(:quantity, row))
      revenue += purchase.total
    end
  end

  class << self
    private

    def value_for(name, record)
      record[FIELDS.index(name)]
    end
  end
end
