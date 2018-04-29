class BasketsController < ApplicationController
  def create
    @basket = Basket.create(params.permit(:product_id, :cart_id, :quantity))
    redirect_to cart_path(current_user.cart)
  end

  def update
    @basket = Basket.find(params[:basket_id])
    @basket.update(params.permit(:quantity))
    redirect_to cart_path(current_user.cart)
  end

  def destroy
    @basket = Basket.find(params[:basket_id])
    @basket.destroy
    redirect_to cart_path(current_user.cart)
  end
end
