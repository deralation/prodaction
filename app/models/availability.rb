class Availability < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :user
end
