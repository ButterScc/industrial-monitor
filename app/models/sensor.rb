class Sensor < ApplicationRecord
  
  belongs_to :equipment

  has_many :sensor_readings, dependent: :destroy
  has_many :alerts, dependent: :destroy

  has_secure_token :api_token

  validates :name, presence: true
  validates :sensor_type, presence: true
  validates :unit, presence: true
  validates :warning_threshold, :critical_threshold, numericality: true

  validate  :thresholds_order

  private

  def thresholds_order
    return if warning_threshold.nil? || critical_threshold.nil?

    if warning_threshold >= critical_threshold
      errors.add(:warning_threshold, "must be less than critical threshold")
    end
  end
end
