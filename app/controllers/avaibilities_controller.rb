class AvaibilitiesController < ApplicationController
  before_action :set_equipment

  def new
    @equipment = Equipment.new
  end

  def show
    @avaibility = Avaibility.new
  end

  # yes

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end

  def equipment_params
    params.require(:equipment).permit(:name, :value, :description, :picture, :address)
  end
end
