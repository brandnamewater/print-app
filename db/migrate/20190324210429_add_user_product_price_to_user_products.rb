class AddUserProductPriceToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :user_product_price, :string
  end
end
