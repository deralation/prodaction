class EquipmentsController < ApplicationController

  def index
    # @equipment = Equipment.where('name LIKE ?', "%#{search}%")
    if params[:search]
      @equipments = Equipment.search(params[:search]).order("created_at DESC")
    else
      @equipments = Equipment.all.order('created_at DESC')
    end
    @markers = Gmaps4rails.build_markers(@equipment) do |equipment, marker|
      marker.lat equipment.latitude if equipment.latitude
      marker.lng equipment.longitude if equipment.longitude
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
