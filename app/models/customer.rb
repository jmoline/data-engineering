class Customer < ActiveRecord::Base
  extend Importable

  has_many :purchases

  validates_presence_of :name
end
