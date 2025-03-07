class AddNewColumnToSchedules < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :slot_end, :datetime
  end
end
