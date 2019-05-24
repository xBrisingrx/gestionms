class TicketCommentNulleable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :tickets, :comment
  end
end
