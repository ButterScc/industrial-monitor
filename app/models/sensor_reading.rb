class SensorReading < ApplicationRecord
  belongs_to :sensor

  validates :value, numericality: true
  validates :recorded_at, presence: true
end