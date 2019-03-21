class AddAttributesToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :color, :string
    add_column :user_products, :size, :string
  end
end
