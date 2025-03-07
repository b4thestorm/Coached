class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.datetime :slot

      t.timestamps
    end
  end
end
