class AddNameToPrintLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :print_locations, :name, :string
  end
end
