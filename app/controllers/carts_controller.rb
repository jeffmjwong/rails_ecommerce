class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    check_user
    check_quantity
    initialize_subtotal
  end

  private

    def check_user
      if !user_signed_in? || (!current_user.admin && @cart.user != current_user)
        redirect_to root_path
      end
    end

    def check_quantity
      @cart.baskets.each do |basket|
        if basket.product.quantity < 1
          basket.update(quantity: 0)
        end
      end
    end

    def initialize_subtotal
      @subtotal_items = 0
      @subtotal_price = 0
    end

end
