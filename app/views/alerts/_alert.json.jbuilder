json.extract! alert, :id, :sensor_id, :severity, :message, :acknowledged, :created_at, :updated_at
json.url alert_url(alert, format: :json)
