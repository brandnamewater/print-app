class AddStyleToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :style, :string
  end
end
