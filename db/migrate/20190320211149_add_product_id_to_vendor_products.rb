class AddProductIdToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :product_id, :string
  end
end
