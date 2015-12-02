class EquipmentsController < ApplicationController
  def index
    raise
    @equipment = current_user.equipment
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = @user
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
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
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
