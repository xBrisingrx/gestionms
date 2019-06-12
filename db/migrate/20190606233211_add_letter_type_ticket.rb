class AddLetterTypeTicket < ActiveRecord::Migration[5.2]
  def change
  	add_column :ticket_types, :letter, :string, limit: 5
  end
end
