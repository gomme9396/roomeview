class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      
      t.string  :email
      t.string  :reason

      t.timestamps null: false
    end
  end
end
