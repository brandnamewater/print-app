class VendorProductsController < ApplicationController

  before_action :set_vendor_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :update, :destroy]



  def index
    @vendor_products = VendorProduct.all
  end


  def show
  end

  def new
    @vendor_product = VendorProduct.new
  end


  def edit
  end


  def create
    @vendor_product = VendorProduct.new(vendor_product_params)
    @vendor = current_vendor
    @vendor_product.vendor_id = @vendor.id

    respond_to do |format|
      if @vendor_product.save
        format.html { redirect_to @vendor_product, notice: 'vendor Product was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_product }
      else
        format.html { render :new }
        format.json { render json: @vendor_product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @vendor_product.update(vendor_product_params)
        format.html { redirect_to @vendor_product, notice: 'vendor Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_product }
      else
        format.html { render :edit }
        format.json { render json: @vendor_product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @vendor_product.destroy
    respond_to do |format|
      format.html { redirect_to vendor_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_product
      @vendor_product = VendorProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_product_params
      params.require(:vendor_product).permit(:product_id)
    end

end
