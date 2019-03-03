class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, :limit => 50
      t.string :surname, :limit => 50
      t.integer :dni, limit: 8
      t.string :email, :limit => 50
      t.integer :phone, limit: 8
      t.boolean :active, :default => true
      t.references :client, foreign_key: true
      t.references :person_type, foreign_key: true
      t.timestamps
    end
  end
end
