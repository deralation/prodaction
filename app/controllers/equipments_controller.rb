class EquipmentsController < ApplicationController
  autocomplete :equipment, :name

  def index
    # @equipment = Equipment.where('name LIKE ?', "%#{search}%")
    if params[:name] || params[:equipment][:name]
      equipment = params[:name] || params[:equipment][:name]
      @equipments = Equipment.search(equipment).order("created_at DESC")
      @markers = Gmaps4rails.build_markers(@equipments) do |equipments, markers|
        markers.lat equipments.latitude if equipments.latitude
        markers.lng equipments.longitude if equipments.longitude
        markers.infowindow render_to_string(partial: "/equipments/infowindows", locals: { object: equipment})
      end
      respond_to do |format|
        format.html
        format.json {render json: @equipments}
      end
    else
      @equipments = Equipment.all.order('created_at DESC')
      respond_to do |format|
        format.html
        format.json {render json: @equipments}
      end
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @reservation = @equipment.reservations.new

    @booked = Reservation.where("equipment_id = ? AND user_id = ?", @equipment_id, current_user.id).present? if current_user
    @reviews = @equipment.reviews
    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user

    @equipments = [@equipment]
    @markers = Gmaps4rails.build_markers(@equipments) do |equipment, markers|
        markers.lat equipment.latitude if equipment.latitude
        markers.lng equipment.longitude if equipment.longitude
      end

  end



  private

  def equipment_params
    params.require(:equipment).permit(:name, :value, :description, :picture, :address)
  end

  def find_user
    @equipment = Equipment.find(params[:user_id])
  end

end
