class AddCountryToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :country, :string
  end
end
