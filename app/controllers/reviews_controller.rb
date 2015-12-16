class ReviewsController < ApplicationController
  def create
    @review = Review.create({
      equipment_id: params[:equipment_id],
      user_id: params[:review][:user_id],
      comment: params[:review][:comment],
      rate: params[:review][:rate]
      })
    redirect_to @review.equipment
  end

  def destroy
    @review = Review.find(params[:id])
    equipment = @review.equipment
    @review.destroy

    root
  end


  private

  def review_params
    params.require(:review).permit(:comment, :rating, :equipment_id, :user_id)
  end

end
