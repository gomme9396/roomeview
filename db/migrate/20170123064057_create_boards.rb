class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      
      t.integer :user_id
      t.integer :address_id
      
      t.string :time
      
      t.string :parcel_address
      
      t.string :writer
      
      t.string :content

      t.timestamps null: false
    end
  end
end
