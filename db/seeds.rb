# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

equipment = Equipment.find_or_create_by!(code: "PUMP-001") do |item|
  item.name = "Industrial Pump 01"
  item.location = "Production Area A"
  item.status = "active"
end

sensor = equipment.sensors.find_or_create_by!(
  name: "Temperature Sensor"
) do |item|
  item.sensor_type = "temperature"
  item.unit = "°C"
  item.warning_threshold = 60
  item.critical_threshold = 80
end

[35.5, 38.2, 42.0, 55.5, 65.5, 85.0].each_with_index do |value, index|
  SensorReading.create!(
    sensor: sensor,
    value: value,
    recorded_at: index.minutes.ago
  )
end

puts "Industrial Monitor seed data created!"