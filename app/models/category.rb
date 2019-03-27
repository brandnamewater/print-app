class Category < ApplicationRecord
#CATEGORY >>> STYLE >>> PRODUCT >>> USERPRODUCT || VENDOR PRODUCT

  has_and_belongs_to_many :product
  # has_and_belongs_to_many :style



end
