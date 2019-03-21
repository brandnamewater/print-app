class AddAttributesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :color, :string
    add_column :products, :size, :string
    add_column :products, :style, :string
  end
end
