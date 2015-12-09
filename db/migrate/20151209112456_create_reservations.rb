class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true
      t.references :equipment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
