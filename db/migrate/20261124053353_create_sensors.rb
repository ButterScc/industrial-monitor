class CreateSensors < ActiveRecord::Migration[8.1]
  def change
    create_table :sensors do |t|
      t.references :equipment, null: false, foreign_key: true
      t.string :name
      t.string :sensor_type
      t.string :unit
      t.decimal :warning_threshold, precision: 10, scale: 2
      t.decimal :critical_threshold, precision: 10, scale: 25
      t.string :api_token

      t.timestamps
    end
  end
end
