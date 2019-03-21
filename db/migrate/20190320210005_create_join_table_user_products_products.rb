class CreateJoinTableUserProductsProducts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :user_products, :products do |t|
      # t.index [:user_product_id, :product_id]
      # t.index [:product_id, :user_product_id]
    end
  end
end
