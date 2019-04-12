class AddEmbroideryPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price_embroidery, :string
  end
end
