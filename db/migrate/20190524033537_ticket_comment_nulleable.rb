class TicketCommentNulleable < ActiveRecord::Migration[5.2]
  def change
  	change_column :tickets, :comment, :default => '', :null => false
  end
end
