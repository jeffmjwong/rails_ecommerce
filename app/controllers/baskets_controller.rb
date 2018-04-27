class BasketsController < ApplicationController
  def create
    @basket = Basket.create(params.permit(:product_id, :cart_id, :quantity))
    redirect_to cart_path(current_user)
  end
end
