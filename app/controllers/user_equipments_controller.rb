class UserEquipmentsController < ApplicationController
  before_filter :authenticate_user!

  def new_fake
    redirect_to new_user_equipment_path(current_user)
  end

  def index
    @equipment = current_user.equipment
    @markers = Gmaps4rails.build_markers(@equipment) do |equipment, marker|
      marker.lat equipment.latitude if equipment.latitude
      marker.lng equipment.longitude if equipment.longitude
    end
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = current_user.equipment.build(equipment_params)
    if @equipment.save
      render "user_equipments/show"
    else
      render "user_equipments/new"
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @equipment_coordinates = { lat: @equipment.latitude, lng: @equipment.longitude } if @equipment.latitude
  end

  def edit
  end

  def update
      respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to user_equipments_path, notice: 'Equipment was successfully updated.' }
        format.json { head :no_content }
      end
    end
  end


  def destroy
    @equipment = current_user.equipment.find(params[:id])
    @equipment.destroy
    redirect_to user_equipments_path(current_user.equipment)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :value, :description, :picture, :address, :start_date, :end_date)
  end

  def find_user
    @equipment = Equipment.find(params[:user_id])
  end

end
