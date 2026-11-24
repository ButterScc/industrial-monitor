class CreateSensorReadings < ActiveRecord::Migration[8.1]
  def change
    create_table :sensor_readings do |t|
      t.references :sensor, null: false, foreign_key: true
      t.decimal :value
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
