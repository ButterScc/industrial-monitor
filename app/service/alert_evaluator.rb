class AlertEvaluator
  def self.call(reading)
    sensor = reading.sensor
    value = reading.value

    severity =
      if value >= sensor.critical_threshold
        "critical"
      elsif value >= sensor.warning_threshold
        "warning"
      end

    return unless severity

    Alert.create!(
      sensor: sensor,
      severity: severity,
      message: "#{sensor.name} detected #{value} #{sensor.unit}"
    )
  end
end

#Nilai di bawah 60 derajat C = Normal
#Nilai 60-79 derajat C = Warning
#Nilai 80 derajat C ke atas = Critical