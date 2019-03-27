class AddStyleIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :style_id, :integer
    add_column :orders, :category_id, :integer
  end
end
