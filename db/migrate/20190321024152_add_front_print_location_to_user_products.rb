class AddFrontPrintLocationToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :front_print_location, :string
  end
end
