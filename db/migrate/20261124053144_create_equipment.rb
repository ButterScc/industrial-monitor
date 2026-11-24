class CreateEquipment < ActiveRecord::Migration[8.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :code
      t.string :location
      t.string :status, default: "active"

      t.timestamps
    end
  end
end
