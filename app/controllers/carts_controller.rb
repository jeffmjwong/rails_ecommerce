class CartsController < ApplicationController
  # before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :check_current_user
  before_action :set_cart

  def index
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_cart
    #   @cart = Cart.find(params[:id])
    # end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end

    def check_current_user
      redirect_to root_path if current_user != @user
    end

    def set_cart
      @cart = @user.cart
    end
end
