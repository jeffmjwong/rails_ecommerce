class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    if !user_signed_in?
      redirect_to root_path
    elsif !current_user.admin && @cart.user != current_user
      redirect_to root_path
    end
  end

end
