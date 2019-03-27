class AddColorToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :color, :string
    add_column :orders, :size, :string
  end
end
