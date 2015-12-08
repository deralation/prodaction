class AddTypeConditionToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :type, :string
    add_column :equipment, :condition, :string
  end
end
