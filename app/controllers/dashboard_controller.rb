class DashboardController < ApplicationController
  def index
    @total_equipments = Equipment.count
    @total_sensors = Sensor.count

    @critical_alerts = Alert.where(
      severity: "critical",
      acknowledged: false
    ).count

    @latest_readings = SensorReading
      .includes(sensor: :equipment)
      .order(recorded_at: :desc)
      .limit(10)

    @latest_alerts = Alert
      .includes(sensor: :equipment)
      .order(created_at: :desc)
      .limit(5)
  end
end