class Item < ActiveRecord::Base
  has_many :purchases

  validates_presence_of :description
  validates_numericality_of :price, greater_than: 0, allow_nil: false

  def self.find_or_create(attributes={})
    unless instance = self.where(description: attributes[:description]).first
      instance = self.create(attributes)
    end
    instance
  end
end
