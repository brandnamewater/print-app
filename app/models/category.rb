class Category < ApplicationRecord
#CATEGORY >>> STYLE >>> PRODUCT >>> USERPRODUCT || VENDOR PRODUCT

  has_and_belongs_to_many :products
  has_and_belongs_to_many :style




CATEGORIES = @categories

end
