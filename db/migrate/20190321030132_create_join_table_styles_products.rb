class CreateJoinTableStylesProducts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :styles, :products do |t|
      # t.index [:style_id, :product_id]
      # t.index [:product_id, :style_id]
    end
  end
end
