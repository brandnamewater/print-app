class Order < ApplicationRecord

  #Used to create manual orders (not from connected Store) and to create orders from Store if possible
  #May need separate model and controller for Store orders?

  enum order_status: { pending: 1, processing: 2, address_issue: 3, production: 4, quality: 5, complete: 6 }


  has_one_attached :front_print
  has_one_attached :back_print

  # has_one :product #this will be has_many in production once cart functionality is built
  # belongs_to :category
  # belongs_to :style

  belongs_to :product
  belongs_to :user_products, optional: true
  belongs_to :category
  belongs_to :style

  # belongs_to :user

  # belongs_to :user, class_name: "User"
  # belongs_to :vendor, foreign_key: :vendor_id, class_name: "Vendor"

  # belongs_to :user_id
  # belongs_to :vendor_id


end
