class AddAddresstoEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :address, :string
  end
end
