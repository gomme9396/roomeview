class CreateAddresses < ActiveRecord::Migration
  
  def change
    create_table :addresses do |t|
      
      t.float  :marker1
      t.float  :marker2
      
      t.string :current_user
      
      t.string :total_address
      t.string :parcel_address
      t.string :road_address
      
      t.string :detail_address
      
      t.timestamps null: false
    end
  end
end
