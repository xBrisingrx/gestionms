class CreateTicketAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_answers do |t|
			t.references :ticket, foreign_key: true
      t.references :user, foreign_key: true
      t.string :detail
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
