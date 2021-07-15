class CreateTimeslots < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslots do |t|
      t.date :date
      t.integer :half_day
      t.boolean :is_blocked, default: false

      t.timestamps
    end
  end
end
