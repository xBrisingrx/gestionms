class ChangeIpAddress < ActiveRecord::Migration[5.2]
  def change
  	  change_column :fleets, :ip_address, :string
  end
end
