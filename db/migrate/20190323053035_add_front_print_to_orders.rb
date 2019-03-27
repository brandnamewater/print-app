class AddFrontPrintToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :front_print, :string
  end
end
