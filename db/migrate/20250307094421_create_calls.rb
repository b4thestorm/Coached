class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.integer :score
      t.string :notes
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
