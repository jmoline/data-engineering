class Item < ActiveRecord::Base
  extend Importable

  has_many :purchases

  validates_presence_of :description
  validates_numericality_of :price, greater_than: 0, allow_nil: false

  def self.import_key
    :description
  end
end
