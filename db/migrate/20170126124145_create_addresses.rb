class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      
      # 건물 좌표
      t.float  :marker1
      t.float  :marker2
      
      # 지번 주소 + 도로명 주소
      t.string :total_address
      # 지번 주소
      t.string :parcel_address
      # 도로명 주소
      t.string :road_address

      t.timestamps null: false
    end
  end
end
