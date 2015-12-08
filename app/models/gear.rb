class Gear < ActiveRecord::Base
  belongs_to :user

  validates :gear_type_1, presence: true
  validates :gear_type_2, presence: true
  validates :gear_type_3, presence: true
  validates :gear_type_4, presence: true
  validates :gear_type_5, presence: true
  validates :gear_type_6, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}
  validates :address, presence: true

end


