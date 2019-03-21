class UserProduct < ApplicationRecord
  # belongs_to :user
  has_one_attached :front_print_location
  has_one_attached :back_print_location

  has_and_belongs_to_many :products
end
