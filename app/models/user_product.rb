class UserProduct < ApplicationRecord

  has_one_attached :front_print
  has_one_attached :back_print

  #Products attached to User/Stores products and/or product variables

  # belongs_to :user
  # has_one_attached :front_print_location
  # has_one_attached :back_print_location

  has_and_belongs_to_many :products
  has_many :print_locations
end
