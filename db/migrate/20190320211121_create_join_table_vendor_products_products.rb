class CreateJoinTableVendorProductsProducts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :vendor_products, :products do |t|
      # t.index [:vendor_product_id, :product_id]
      # t.index [:product_id, :vendor_product_id]
    end
  end
end
