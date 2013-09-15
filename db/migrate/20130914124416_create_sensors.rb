class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :ser_name
      t.string :ser_data
      t.integer :user_id

      t.timestamps
    end
    add_index :sensors, [:user_id]
  end
end
