class VendorProduct < ApplicationRecord

  #Products vendor operate with.
  has_one :vendor, foreign_key: :vendor_id, class_name: "Vendor"
  # belongs_to :vendor
  # has_and_belongs_to_many :products
  # has_one :product
  belongs_to :product

end
