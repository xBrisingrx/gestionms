class CreateFleets < ActiveRecord::Migration[5.2]
  def change
    create_table :fleets do |t|
      t.string :code
      t.integer :ip_address, limit: 8
      t.string :hardware
      t.string :software
      t.boolean :active, :default => true
      t.references :client, foreign_key: true
      t.references :person, foreign_key: true
      t.references :fleet_type, foreign_key: true

      t.timestamps
    end
  end
end
