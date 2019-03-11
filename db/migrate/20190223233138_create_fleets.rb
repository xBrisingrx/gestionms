class CreateFleets < ActiveRecord::Migration[5.2]
  def change
    create_table :fleets do |t|
      t.string :code
      t.string :model, limit: 30
      t.integer :ip_address, limit: 8
      t.string :hardware
      t.string :software, comment: 'Software particular que lleve el equipo'
      t.string :os, limit: 20, comment: 'Sistema Operativo'
      t.boolean :active, :default => true
      t.references :client, foreign_key: true
      t.references :person, foreign_key: true
      t.references :fleet_type, foreign_key: true

      t.timestamps
    end
  end
end
