class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)
    flash[:notice] = "Successfully booked"
    redirect_to your_bookings_path
  end


  def destroy
    @equipment = current_user.equipment.find(params[:id])
    @equipment.destroy
  end

  def your_bookings
    @bookings = current_user.reservations
  end


  def your_reservations
    @equipment = current_user.equipment
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :value, :equipment_id)
  end

end
