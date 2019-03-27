class CreatePrintLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :print_locations do |t|

      t.timestamps
    end
  end
end
