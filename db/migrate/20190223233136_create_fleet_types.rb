class CreateFleetTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :fleet_types do |t|
      t.string :name, :limit => 50
      t.string :comment
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
