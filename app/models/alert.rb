class Alert < ApplicationRecord
  belongs_to :sensor

  validates :severity, presence: true
  validates :message, presence: true

  enum :severity, {
    warning: "warning",
    critical: "critical"
  }

end
