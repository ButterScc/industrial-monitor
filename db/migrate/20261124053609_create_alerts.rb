class CreateAlerts < ActiveRecord::Migration[8.1]
  def change
    create_table :alerts do |t|
      t.references :sensor, null: false, foreign_key: true
      t.string :severity
      t.text :message
      t.boolean :acknowledged, default: false

      t.timestamps
    end
  end
end
