class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :equipment

  # validate :dates_available, on: :create

  # def uniqueness_of_date_range?
  #   errors.add(:start_date, "is not available") if Equipment.where("? >= start_date AND ? <= end_date",
  #                                                           start_date, start_date).count == 0
  #   errors.add(:end_date, "is not available") if Equipment.where("? >= start_date AND ? <= end_date",
  #                                                           end_date, end_date).count == 0
  # end

  def dates_available
   equipment = Equipment.find(equipment_id)
   if equipment.start_date > start_date && equipment.end_date < start_date
     errors.add(:start_date, "is not available")
   elsif equipment.start_date > end_date && equipment.end_date < end_date
     errors.add(:end_date, "is not available")
   end
  end
end


 # def dates_available
 # equipment = Equipment.find(equipment_id)
 #   if equipment.start_date > start_date && equipment.end_date < start_date
 #     errors.add(:start_date, "is not available")
 #   elsif equipment.start_date > end_date && equipment.end_date < end_date
 #     errors.add(:end_date, "is not available")
 #   end
 # end

