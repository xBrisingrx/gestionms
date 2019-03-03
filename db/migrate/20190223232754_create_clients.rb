class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
    	t.string :name, :limit => 50
      t.string :fantasy_name, :null => true
      t.integer :cuit, limit: 8
      t.string :email
      t.string :direction
      t.string :location
      t.string :province
      t.integer :phone, limit: 8
      t.boolean :active, :default => true
      t.references :client_type, foreign_key: true
      t.references :iva_condition, foreign_key: true, :null => true
      t.references :sale_condition, foreign_key: true, :null => true
      t.timestamps
    end
  end
end
