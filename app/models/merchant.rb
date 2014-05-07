class Merchant < ActiveRecord::Base
  extend Importable

  has_many :purchases

  validates_presence_of :name
  validates_presence_of :address
end
