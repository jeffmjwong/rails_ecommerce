class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    check_user
    initialize_subtotal
  end

  private

    def check_user
      if !user_signed_in?
        redirect_to root_path
      elsif !current_user.admin && @cart.user != current_user
        redirect_to root_path
      end
    end

    def initialize_subtotal
      @subtotal_items = 0
      @subtotal_price = 0
    end

end
