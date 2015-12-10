class EquipmentsController < ApplicationController

  def index
    # @equipment = Equipment.where('name LIKE ?', "%#{search}%")
    if params[:search]
      @equipments = Equipment.search(params[:search]).order("created_at DESC")
    else
      @equipments = Equipment.all.order('created_at DESC')
    end
    @markers = Gmaps4rails.build_markers(@equipments) do |equipments, markers|
      markers.lat equipments.latitude if equipments.latitude
      markers.lng equipments.longitude if equipments.longitude
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    equipment_coordinates = { lat: @equipment.latitude, lng: @equipment.longitude } if @equipment.latitude
  end



  private

  def equipment_params
    params.require(:equipment).permit(:name, :value, :description, :picture, :address)
  end

  def find_user
    @equipment = Equipment.find(params[:user_id])
  end

end
