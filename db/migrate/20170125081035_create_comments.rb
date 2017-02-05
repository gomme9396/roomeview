class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.integer :user_id
      t.integer :board_id
      
      t.string  :time
      
      t.string  :writer
      
      t.string  :content

      t.timestamps null: false
    end
  end
end
