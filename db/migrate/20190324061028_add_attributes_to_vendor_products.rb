class AddAttributesToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :category, :string
    add_column :vendor_products, :color, :string
    add_column :vendor_products, :size, :string
  end
end
