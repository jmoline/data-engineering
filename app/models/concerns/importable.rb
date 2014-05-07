module Importable
  def import_key
    :name
  end

  def find_or_create(attributes={})
    unless instance = self.where(import_key => attributes[import_key]).first
      instance = self.create!(attributes)
    end
    instance
  end
end
