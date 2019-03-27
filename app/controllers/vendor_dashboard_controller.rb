class VendorDashboardController < ApplicationController
  before_action :authenticate_vendor!, only: [:vendor_orders]

  def vendor_orders
    @vendor_products = VendorProduct.all.where(vendor_id: current_vendor)
    @vendor_orders = Order.all.where(product_id: @vendor_products.each {|vendor_product| vendor_product.product_id})
  end

end
