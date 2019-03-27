class AddUserIdToUserProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :user_products, :user_id, :integer
  end
end
