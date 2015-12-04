class AddUserToAvailabilities < ActiveRecord::Migration
  def change
    add_reference :availabilities, :user, index: true
  end
end
