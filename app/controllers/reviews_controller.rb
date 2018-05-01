class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.create(params.permit(:product_id, :user_id, :content, :rating))
    redirect_to product_path(@product)
  end
end
