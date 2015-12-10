class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reservation = current_user.reservation.create(reservation_params)
    redirect_to @reservation.equipment
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :value, :equipment_id)
  end
end
