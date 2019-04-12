class AddEmbroideeryPriceToVendorProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :vendor_products, :price_embroidery, :string
  end
end
