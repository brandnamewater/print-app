class AddCountryToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :country, :string
  end
end
