require 'csv'
class ImportsController < ApplicationController
  def create
    purchase_data = CSV.read(params[:purchase_file].path, col_sep: "\t", headers: true)
    @revenue = PurchaseImporter.import(purchase_data)
  end
end
