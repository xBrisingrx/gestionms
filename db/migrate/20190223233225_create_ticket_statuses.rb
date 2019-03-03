class CreateTicketStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_statuses do |t|
      t.string :status, :limit => 50
      t.string :comment
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
