class VendorProduct < ApplicationRecord
  # belongs_to :vendor
  has_and_belongs_to_many :products
end
