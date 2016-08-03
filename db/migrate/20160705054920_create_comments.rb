class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        
        t.integer :address_id  
        t.string :comment  
        t.string :author
          
      t.timestamps null: false
    end
  end
end
