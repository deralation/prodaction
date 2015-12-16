class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :equipment

  validate :uniqueness_of_date_range

  private
  def uniqueness_of_date_range
    errors.add(:start_date, "is not available") if Equipment.where("? >= start_date AND ? <= end_date",
                                                            start_date, start_date).count == 0
    errors.add(:end_date, "is not available") if Equipment.where("? >= start_date AND ? <= end_date",
                                                            end_date, end_date).count == 0
  end
end
