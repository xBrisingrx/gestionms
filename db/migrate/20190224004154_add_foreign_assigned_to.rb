class AddForeignAssignedTo < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :tickets, :people , column: :assigned_to, index: true, foreign_key: true
  end
end
