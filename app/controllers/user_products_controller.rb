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
    @products = Product.all
    @styles = Style.all
    @categories = Category.all
  end


  def edit
  end


  def create

    @user_product = UserProduct.new(user_product_params)
    # @product = Product.find_by(params[:product_id])

    # @product = Product.find_all_by_color_and_size(color: @user_product.color, size: @user_product_size)
    # @product = Product.find_by(params[style_id: @user_product.style_id, size: @user_product.size, color: @user_product.color, country: @user_product.country])

    # @product = Product.where(style: @user_product.style_id).where(size: @user_product.size).where(color: @user_product.color).where(country: @user_product.country)
    @product = Product.find_by(
      style: @user_product.style_id,
      size:     @user_product.size,
      color:    @user_product.color,
      country:  @user_product.country
    )

    @user_product.product_id = @product.id

    @user = current_user
    @user_product.user_id = @user.id
    @user_product.country = @product.country


    #ProductionPrice: price user pays App to have fulfilled.
    # If thre is a better way to generate ProductionPrice, such as in the model, do that instead
    if ( @user_product.front_print && @user_product.back_print).present?
      @user_product.production_price = (@product.price.to_i + 5)
    else
      @user_product.production_price = @product.price
    end

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
      params.require(:user_product).permit(:product_id, :color, :size, :front_print, :back_print, :country, :user_product_price, :production_price, :style_id,  {product_ids: []})
    end

end
