class AddStyleIdToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :style_id, :integer
  end
end
