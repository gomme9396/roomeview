class CreateAddressreviews < ActiveRecord::Migration
  def change
    create_table :addressreviews do |t|
      
        t.integer :address_id
        t.string  :address_name
        t.string  :detail_address_name
        
        t.string  :price
        t.string  :month
        t.string  :start_date
        t.string  :end_date
        t.integer :fee
        t.string  :comment1
        
        t.string :image_url1, default:""
        t.string :image_url2, default:""
        t.string :image_url3, default:""
        t.string :image_url4, default:""
        
        t.integer :cool
        t.integer :warm
        t.integer :sun
        t.integer :blocking
        t.integer :wind
        t.integer :bug
        t.integer :iron
        t.integer :smell
        t.integer :pet
        
        t.integer :gas
        t.integer :micro
        t.integer :bed
        t.integer :desk
        t.integer :laundry
        t.integer :internet
        t.integer :fire
        t.integer :cctv
        t.integer :parking
        t.string  :comment2
        
        t.integer :night
        t.integer :light
        t.integer :noise
        t.integer :sani
        
        # t.float :tavg
      
      t.timestamps null: false
    end
  end
end
