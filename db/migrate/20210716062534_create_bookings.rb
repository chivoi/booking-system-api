class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :timeslot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :venue
      t.string :address
      t.integer :event_type
      t.string :start_time
      t.integer :duration
      t.boolean :pa_provided, default: false
      t.text :message

      t.timestamps
    end
  end
end
