class ExportController < ApplicationController
    
    before_action :require_admin, except: [:index]
    
    require 'csv'
    
    def export_review
      @review = Review.all
      review = CSV.generate do |csv|
      csv << ["id", "user_id", "address_id", "marker1", "marker2", "writer", "total_address", "parcel_address", "road_address", "detail_address",
              "comment1", "comment2", "start_year", "start_month", "how_long", "place_type", "contract_type", "price", "month", "fee",  
              "cool", "warm", "sun", "blocking", "wind", "bug", "iron", "smell", "pet", 
              "gas", "micro", "bed", "desk", "laundry", "internet", "fire", "cctv", "parking",
              "night", "light", "noise", "sani", "avg1", "avg2"]
              # "image_url1", "image_url2", "image_url3", "image_url4",
          @review.each do |r|
            csv << [r.id, r.user_id, r.address_id, r.marker1, r.marker2, r.writer, r.total_address, r.parcel_address, r.road_address, r.detail_address,
                    r.comment1, r.comment2, r.start_year, r.start_month, r.how_long, r.place_type, r.contract_type, r.price, r.month, r.fee, 
                    r.cool, r.warm, r.sun, r.blocking, r.wind, r.bug, r.iron, r.smell, r.pet,
                    r.gas, r.micro, r.bed, r.desk, r.laundry, r.internet, r.fire, r.cctv, r.parking, 
                    r.night, r.light, r.noise, r.sani, r.avg1, r.avg2]
                    # r.image_url1, r.image_url2, r.image_url3, r.image_url4, 
              end
          end
          send_data(review, :type => 'text/csv', :filename => 'review.csv')
    end
    
    def export_address
      @address = Address.all
      address = CSV.generate do |csv|
      csv << ["id", "marker1", "marker2", "total_address", "parcel_address", "road_address"]
          @address.each do |a|
            csv << [a.id, a.marker1, a.marker2, a.total_address, a.parcel_address, a.road_address]
              end
          end
          send_data(address, :type => 'text/csv', :filename => 'address.csv')
    end

    def export_user
      @user = User.all
      user = CSV.generate do |csv|
      csv << ["id", "email", "confirmation"]
          @user.each do |u|
            csv << [u.id, u.email, u.confirmation]
          end
      end
      send_data(user, :type => 'text/csv', :filename => 'user.csv')
    end
    
    def export_board
      @board = Board.all
      board = CSV.generate do |csv|
      csv << ["id", "user_id", "address_id", "parcel_address", "writer", "title", "content"]
          @board.each do |b|
            csv << [b.id, b.user_id, b.address_id, b.parcel_address, b.writer, b.title, b.content]
              end
          end
          send_data(board, :type => 'text/csv', :filename => 'board.csv')
    end
    
    def export_comment
      @comment = Comment.all
      comment = CSV.generate do |csv|
      csv << ["id", "user_id", "board_id", "writer", "content"]
          @comment.each do |c|
            csv << [c.id, c.user_id, c.board_id, c.writer, c.content]
              end
          end
          send_data(comment, :type => 'text/csv', :filename => 'comment.csv')
    end
    
    def export_withdraw
      @withdraw = Withdraw.all
      withdraw = CSV.generate do |csv|
      csv << ["id", "email", "reason"]
          @withdraw.each do |w|
            csv << [w.id, w.email, w.reason]
              end
          end
          send_data(withdraw, :type => 'text/csv', :filename => 'withdraw.csv')
    end
end
