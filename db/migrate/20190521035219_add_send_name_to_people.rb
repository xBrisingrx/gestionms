class AddSendNameToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :send_email, :boolean, default: false
  end
end
