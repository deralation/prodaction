class EquipmentsController < ApplicationController
  before_filter :authenticate_user!

  def new_fake
    redirect_to new_user_equipment_path(current_user)
  end

  def index
    @equipment = current_user.equipment
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = current_user.equipment.build(equipment_params)
    if @equipment.save
      redirect_to user_equipments_path(current_user)
    else
      render "equipment/new"
    end
  end

  def show

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
    params.require(:equipment).permit(:name, :value, :description)
  end

  def find_user
    @equipment = Equipment.find(params[:user_id])
  end

end