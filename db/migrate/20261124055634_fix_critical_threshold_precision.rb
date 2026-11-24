class FixCriticalThresholdPrecision < ActiveRecord::Migration[8.1]
  def change
    change_column :sensors, :critical_threshold, :decimal, precision: 10, scale: 2
  end
end