# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show; end

  # GET /orders/new
  def new
    @order = Order.new
    @user_products = UserProduct.where(user_id: current_user)
    @products = Product.all
    @categories = Category.all
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @user_products = UserProduct.where(user_id: current_user)
    # @product = Product.find_by(params[:id])
    @categories = Category.all

    # @product = Product.where(style_id: @order.style_id, category_id: @order.category_id, size: @order.size, color: @order.color, country: @order.country)
    # @product = Product.where(style: @order.style_id).where(size: @order.size).where(color: @order.color).where(country: @order.country)
    @product = Product.find_by(
      style: @order.style_id,
      size: @order.size,
      color: @order.color,
      country: @order.country
    )

    @vendor_product = VendorProduct.where(product_id: @product.id)

    @user = current_user
    @order.user_id = @user.id
    # @order.vendor_id = @vendor_product.vendor
    @order.vendor_id = @product.vendor_product.vendor_id

    @order.product_id = @product.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:name, :email, :product_id, :size, :vendor_id, :color, :style_id, :category_id, :country, :product_price, :shipping_price, :front_print, :back_print)
  end
end
