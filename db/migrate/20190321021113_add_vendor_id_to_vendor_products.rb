class AddVendorIdToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :vendor_id, :integer
  end
end
