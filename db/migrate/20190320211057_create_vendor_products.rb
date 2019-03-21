class CreateVendorProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_products do |t|

      t.timestamps
    end
  end
end
