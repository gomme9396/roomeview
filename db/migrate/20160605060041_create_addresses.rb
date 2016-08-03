class CreateAddresses < ActiveRecord::Migration
  
  def change
    create_table :addresses do |t|
      
      t.float  :marker1
      t.float  :marker2
      t.string :current_user
      t.string :address
      t.string :detail_address
      
      t.timestamps null: false
    end
  end
end
