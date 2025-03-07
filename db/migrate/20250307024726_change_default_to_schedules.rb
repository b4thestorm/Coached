class ChangeDefaultToSchedules < ActiveRecord::Migration[7.1]
  def change
    change_column_null :schedules, :student_id, true
  end
end
