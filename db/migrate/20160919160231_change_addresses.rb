class ChangeAddresses < ActiveRecord::Migration
  
  def change
    add_column :addresses, :total_address, :string
    add_column :addresses, :parcel_address, :string
    add_column :addresses, :road_address, :string
    
    remove_column :addresses, :address, :string
  end
  
end
