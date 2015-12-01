class EquipmentsController < ApplicationController

  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = @user
    if @equipment.save
      redirect_to user_equipment_path(current_user)
    else
      render "equipment/new"
    end
  end

  def destroy
    @equipment = @user.equipment.find(params[:id])
    @equipment.destroy
    redirect_to user_equipment_path(@user)
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :value, :description)
  end

  def find_user
    @equipment = Equipment.find(params[:user_id])
  end

end
