class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.create(params.permit(:product_id, :user_id, :title, :content, :rating))
    @product.update(avgrating: @product.avg_rating)
    redirect_to product_path(@product)
  end

  def destroy
    @review = Review.find(params[:review_id])
    @product = @review.product
    @review.destroy
    redirect_to product_path(@product)
  end
end
