class AddStartdateEndDateToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :start_date, :datetime
    add_column :equipment, :end_date, :datetime
  end
end
