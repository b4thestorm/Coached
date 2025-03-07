class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :schedules, :slot, :slot_start
  end
end
