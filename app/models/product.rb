class Product < ApplicationRecord

  # belongs_to :admin
  # has_and_belongs_to_many :category
  # has_one :category


  has_and_belongs_to_many :categories  # belongs_to :categories_listings, required: false
  has_and_belongs_to_many :styles

  attr_accessor :new_category_name
  before_save :create_category_from_name




  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end

  attr_accessor :new_style_name
  before_save :create_style_from_name




  def create_style_from_name
    create_category(name: new_style_name) unless new_style_name.blank?
  end

  has_and_belongs_to_many :user_products
  has_and_belongs_to_many :admin_products
end
