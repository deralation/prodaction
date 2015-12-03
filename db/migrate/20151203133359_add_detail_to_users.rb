class AddDetailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :telephone, :decimal
    add_column :users, :birthday, :date
    add_column :users, :address, :string
    add_column :users, :occupation, :string
  end
end
