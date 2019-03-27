class Style < ApplicationRecord

  #Style of the product, eg: GILDAN-1850-S-BLACK

  has_and_belongs_to_many :product


end
