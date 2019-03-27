class AddBackPrintToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :back_print, :string
  end
end
