class UserDashboardController < ApplicationController
  def user_orders
    @user_orders = Order.all.where(user_id: current_user)
  end

  def user_products
    @user_products = UserProduct.all.where(user_id: current_user)
  end
end
