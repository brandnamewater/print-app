class AddFrontPrintToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :front_print, :string
  end
end
