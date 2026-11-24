json.extract! sensor, :id, :equipment_id, :name, :sensor_type, :unit, :warning_threshold, :critical_threshold, :created_at, :updated_at
json.url sensor_url(sensor, format: :json)
