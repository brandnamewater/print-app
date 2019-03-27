class AddProductPriceToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :product_price, :string
  end
end
