class ProductsController < ApplicationController
  before_action :check_sign_in, except: [:home, :index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:edit, :update, :destroy]

  def home
    current_user.create_cart_after_user_sign_up if user_signed_in?
    @recent_products = Product.where("quantity > ?", 0).order(created_at: :desc).limit(10)
  end

  def index
    if !user_signed_in?
      @products = Product.all.order(avgrating: :desc)
    else
      @products = Product.where.not(user: current_user).order(avgrating: :desc)
    end
    filter_params.each do |key, value|
      @products = @products.public_send(key, value) if value.present?
    end
    if !@products.present?
      render 'not_found'
    end
  end

  def show
    @avg_rating = @product.avg_rating
    @recent_reviews = @product.reviews.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to user_shop_path(current_user), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to user_shop_path(current_user), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :quantity, :unitprice, :photo)
    end

    def check_sign_in
      redirect_to root_path if !user_signed_in?
    end

    def check_current_user
      redirect_to root_path if current_user != @product.user
    end

    def filter_params
      params.slice(:product_name)
    end
end
