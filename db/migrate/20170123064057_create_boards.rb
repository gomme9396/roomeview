class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      
      t.string :parcel_address
      
      t.string :writer
      
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
