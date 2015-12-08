class PagesController < ApplicationController
  def home
    @equipments = Equipment.all
  end

  def search
    if params[:search].presnt? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    else
      session[:loc_search] = ""
    end

     arrResult = Array.new

    if session[:loc_search] && session[:loc_search] != ""
      @equipments_address = Equipment.where[active: true].near(session[:loc_search], 5, order: 'distance')
    else
      @equipments_address = Equipment.where[active: true].all
    end

    @search = @equipments_address.ransack(params[:q])
    @equipments = @search.result

    @arrEquipments = @equipment.to_a

    if (params[:start_date] & params[:end_date] && params[:start_date].empty? & !params[:end_date].empty?)
      start_date = Date.parse([:start_date])
      end_date = Date.parse([:end_date])

      @equipment.each do |equip|

        not_available = equipment.availability.where



  end

end
