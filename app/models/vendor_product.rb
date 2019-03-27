class VendorProduct < ApplicationRecord

  #Products vendor operate with.
  
  # belongs_to :vendor
  has_and_belongs_to_many :products
end
