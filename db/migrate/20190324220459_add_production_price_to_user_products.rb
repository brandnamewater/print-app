class AddProductionPriceToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :production_price, :string
  end
end
