class CreatePersonTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :person_types, comment: 'Discriminador de jerarquia en la empresa.' do |t|
      t.string :name, :limit => 50
      t.string :comment
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
