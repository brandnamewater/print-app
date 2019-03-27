class AddShippingPriceToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :shipping_price, :string
  end
end
