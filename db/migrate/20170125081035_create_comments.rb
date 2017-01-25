class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string :parcel_address
      
      t.string :writer
      
      t.string :content

      t.timestamps null: false
    end
  end
end
