class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    current_user.update(user_param)
    redirect_to root_path
  end

  private

  def user_param
    params.require(:user).permit(:description)
  end
end
