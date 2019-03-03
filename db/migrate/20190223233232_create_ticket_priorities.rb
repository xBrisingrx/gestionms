class CreateTicketPriorities < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_priorities do |t|
      t.string :priority, :limit => 50
      t.string :comment
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
