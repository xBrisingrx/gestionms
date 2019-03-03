class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
    	t.string :title, :limit => 100
      t.string :detail
      t.date :created_date
      t.integer :assigned_to, limit: 8 , comment: 'Persona a cargo de realizar el ticket'
      t.boolean :report, comment: 'Discrimina si el ticket va o no al reporte'
      t.boolean :active, :default => true
      t.references :client, foreign_key: true
      t.references :fleet, foreign_key: true
      t.references :user, foreign_key: true
      t.references :person, foreign_key: true
      t.references :ticket_status, foreign_key: true
      t.references :ticket_priority, foreign_key: true
      t.references :ticket_type, foreign_key: true
      t.timestamps
    end
  end
end
