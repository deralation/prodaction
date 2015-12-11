class ReviewsController < ApplicationController
  def create
    @review = Review.find(params[:id])
    redirect_to @review.equipment
  end

  def destroy
    @review = Review.find(params[:id])
    equipment = @review.equipment
    @review.destroy

    redirect_to equipment_path(:id)
  end


  private

  def review_params
    params.require(:review).permit(:comment, :rating, :equipment_id, :user_id)
  end

end
