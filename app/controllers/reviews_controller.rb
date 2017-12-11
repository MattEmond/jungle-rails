class ReviewsController < ApplicationController

  def create
    temp_review = Review.new(review_params)
    temp_review.user_id = current_user.id
    temp_review.product_id = params[:product_id]

    temp_review.save
    redirect_to product_path(id: params[:product_id])
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:description, :rating)
  end


end
