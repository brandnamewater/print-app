class UserProductsController < ApplicationController

  before_action :set_user_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def index
    @user_products = UserProduct.all
  end


  def show
  end

  def new
    @user_product = UserProduct.new
    # @product = Product.find(params[:product_id])

  end


  def edit
  end


  def create

    @user_product = UserProduct.new(user_product_params)
    # @product = Product.find(params[:product_id])
    # @user_product.product_id = @product.id

    respond_to do |format|
      if @user_product.save
        format.html { redirect_to @user_product, notice: 'User Product was successfully created.' }
        format.json { render :show, status: :created, location: @user_product }
      else
        format.html { render :new }
        format.json { render json: @user_product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @user_product.update(user_product_params)
        format.html { redirect_to @user_product, notice: 'User Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_product }
      else
        format.html { render :edit }
        format.json { render json: @user_product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user_product.destroy
    respond_to do |format|
      format.html { redirect_to user_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_product
      @user_product = UserProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_product_params
      params.require(:user_product).permit(:product_id, {product_ids: []})
    end

end
