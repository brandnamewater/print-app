class AddTrackingIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tracking_id, :string
  end
end
