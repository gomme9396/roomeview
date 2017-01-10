class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      # 건물 좌표
      t.float  :marker1
      t.float  :marker2

      # 작성자 이메일
      t.string :writer

      # 지번 주소 + 도로명 주소
      t.string :total_address
      # 지번 주소
      t.string :parcel_address
      # 도로명 주소
      t.string :road_address

      # 상세 주소
      t.string :detail_address

      # 한줄 평
      t.string  :comment1
      # 추가 코멘트
      t.string  :comment2

      # 입주일 (년도)
      t.integer :start_year
      # 입주일 (월)
      t.integer :start_month
      # 거주기간
      t.integer :how_long

      # 거주 형태
      t.integer :place_type
      # 계약 형태
      t.integer :contract_type
      # 보증금
      t.integer :price
      # 월세
      t.integer :month

      # 관리비 포함 항목
      t.string :fee

      # 사진
      # t.string :image_url1, default:""
      # t.string :image_url2, default:""
      # t.string :image_url3, default:""
      # t.string :image_url4, default:""

      # 냉방
      t.integer :cool
      # 난방
      t.integer :warm
      # 채광
      t.integer :sun
      # 방음
      t.integer :blocking
      # 통풍
      t.integer :wind
      # 벌레
      t.integer :bug
      # 녹물
      t.integer :iron
      # 하수구 냄새
      t.integer :smell
      # 애완동물
      t.integer :pet

      # 가스렌지
      t.integer :gas
      # 전자렌지
      t.integer :micro
      # 침대
      t.integer :bed
      # 책상
      t.integer :desk
      # 세탁기
      t.integer :laundry
      # 무선 인터넷
      t.integer :internet
      # 화재 장비
      t.integer :fire
      # CCTV
      t.integer :cctv
      # 주차 공간
      t.integer :parking

      # 가로등
      t.integer :night
      # 빛공해
      t.integer :light
      # 외부 소음
      t.integer :noise
      # 주변 위생
      t.integer :sani

      t.float :avg1
      t.float :avg2

      t.timestamps null: false
    end
  end
end
