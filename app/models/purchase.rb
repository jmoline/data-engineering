class Purchase < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  belongs_to :item

  validates_presence_of :customer
  validates_presence_of :merchant
  validates_presence_of :item
  validates_numericality_of :quantity, greater_than: 0, allow_nil: false
end
