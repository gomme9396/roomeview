class ExportController < ApplicationController
    
    before_action :require_login, except: [:index]
    
    require 'csv'
    def export_review
      @review = Review.all
      review = CSV.generate do |csv|
      csv << ["id", "marker1", "marker2", "writer", "total_address", "parcel_address", "road_address", 
              "detail_address", "price", "month", "start_date", "how_long", "fee", "comment1", 
              "cool", "warm", "sun", "blocking", 
              "wind", "bug", "iron", "smell", "pet", "gas", "micro", "bed", "desk", "laundry", "internet", 
              "fire", "cctv", "parking", "comment2", "night", "light", "noise", "sani"]
              # "image_url1", "image_url2", "image_url3", "image_url4",
          @review.each do |r|
            csv << [r.id, r.marker1, r.marker2, r.writer, r.total_address, r.parcel_address, r.road_address, 
                    r.detail_address, r.price, r.month, r.start_date, r.how_long, r.fee, r.comment1, 
                    r.cool, r.warm, r.sun, r.blocking, 
                    r.wind, r.bug, r.iron, r.smell, r.pet, r.gas, r.micro, r.bed, r.desk, r.laundry, r.internet, 
                    r.fire, r.cctv, r.parking, r.comment2, r.night, r.light, r.noise, r.sani]
                    # r.image_url1, r.image_url2, r.image_url3, r.image_url4, 
              end
          end
          send_data(review, :type => 'text/csv', :filename => 'review.csv')
    end

    def export_user
      @user = User.all
      user = CSV.generate do |csv|
      csv << ["id", "email"]
          @user.each do |u|
            csv << [u.id, u.email]
          end
      end
      send_data(user, :type => 'text/csv', :filename => 'user.csv')
    end
    
end
