class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :confirmation
      
      t.string :password
      t.string :confirmation_password

      t.timestamps null: false
    end
  end
end
