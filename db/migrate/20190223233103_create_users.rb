class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :username, :limit => 50, unique: true
      t.string :email, :limit => 50, unique: true
      t.string :password_digest
      t.boolean :active, :default => true
      t.references :person, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
