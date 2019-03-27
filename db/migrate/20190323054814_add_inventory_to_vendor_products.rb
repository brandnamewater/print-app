class AddInventoryToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :inventory, :integer
  end
end
