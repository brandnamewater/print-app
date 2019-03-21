class AddBackPrintLocationToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :back_print_location, :string
  end
end
