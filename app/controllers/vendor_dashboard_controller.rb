# frozen_string_literal: true

class VendorDashboardController < ApplicationController
  before_action :authenticate_vendor!, only: [:vendor_orders]

  def vendor_orders
    @vendor_products = VendorProduct.where(vendor_id: current_vendor)

    @vendor_orders = Order.all.where(product_id: @vendor_products.each(&:product_id))
  end

  def vendor_products
    @vendor_products = VendorProduct.where(vendor_id: current_vendor)
  end
end
