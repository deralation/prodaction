class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    @availability = current_user.availabilities.create(availability_param)

    redirect_to user_equipments_path(current_user), notice: "Availability added"
  end


  private

  def availability_param
    params.require(:availability).permit(:start_date, :end_date, :equipment_id)
  end

end