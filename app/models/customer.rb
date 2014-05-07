class Customer < ActiveRecord::Base
  has_many :purchases

  validates_presence_of :name

  def self.find_or_create(attributes={})
    unless instance = self.where(name: attributes[:name]).first
      instance = self.create(attributes)
    end
    instance
  end
end
