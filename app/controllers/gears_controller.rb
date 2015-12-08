class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  def index
    @gears = current_user.gears
  end

  def show

  end

  def new
    @gear = current_user.gears.build
  end

  def create
    @gear = current_user.gears.build(gear_params)

    if @gear.save
      redirect_to @gear, notice: "Saved..."
    else
      render :new
  end

  def edit

  end

  def update
    if @gear.update(gear_params)
      redirect_to @gear, notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_gear
       @gear = Gear.find(params[:id])
    end

    def gear_params
      params.require(:gear).permit(:gear_type_1,:gear_type_2,:gear_type_3,:gear_type_4,
        :gear_type_5,:gear_type_6, :listing_name,:description,:address, :is_option_1,
        :is_option_2, :is_option_3, :is_option_4, :is_option_5, :is_option_6, :price, :active )
    end
  end
end
