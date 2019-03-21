class AddProductIdToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :product_id, :string
  end
end
