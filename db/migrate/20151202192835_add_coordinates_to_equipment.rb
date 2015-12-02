class AddCoordinatesToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :latitude, :float
    add_column :equipment, :longitude, :float
  end
end
