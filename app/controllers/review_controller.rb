class ReviewController < ApplicationController

    before_action :require_login, except: [:index]
    
    def withdraw
      @one_user = User.find(params[:id])
    end
    
    def user_destroy_path
      withdraw = Withdraw.new
      
      withdraw.email = session[:user_id]
      withdraw.reason = params[:reason]
      
      withdraw.save
      
      user = User.find(params[:id])
      
      user.destroy
      
      reset_session
      
      redirect_to '/'
    end

    def list_path

      address = Address.new
      review = Review.new

      have_address = Address.where(:parcel_address => params[:parcel_address])

      review.user_id = User.where(:email => session[:user_id]).take.id

      if have_address.take.nil?
        address.marker1 = params[:marker1]
        address.marker2 = params[:marker2]

        address.total_address = params[:total_address]
        address.parcel_address = params[:parcel_address]
        address.road_address = params[:road_address]

        address.save

      #   review.address_id = Address.last.id + 1
      # else
      #   review.address_id = have_address.take.id
      end

      review.address_id = have_address.take.id

      review.marker1 = params[:marker1]
      review.marker2 = params[:marker2]

      review.writer = session[:user_id]

      review.total_address = params[:total_address]
      review.parcel_address = params[:parcel_address]
      review.road_address = params[:road_address]

      review.detail_address = params[:detail_address]

      review.comment1 = params[:comment1]
      review.comment2 = params[:comment2]

      review.start_year = params[:start_year]
      review.start_month = params[:start_month]
      review.how_long = params[:how_long]

      review.place_type = params[:place_type]
      review.contract_type = params[:contract_type]
      review.price = params[:price]
      review.month = params[:month]
      review.fee = params[:fee]

      review.cool = params[:cool]
      review.warm = params[:warm]
      review.sun = params[:sun]
      review.blocking = params[:blocking]
      review.wind = params[:wind]
      review.bug = params[:bug]
      review.iron = params[:iron]
      review.smell = params[:smell]
      review.pet = params[:pet]

      review.gas = params[:gas]
      review.micro = params[:micro]
      review.bed = params[:bed]
      review.desk = params[:desk]
      review.laundry = params[:laundry]
      review.internet = params[:internet]
      review.fire = params[:fire]
      review.cctv = params[:cctv]
      review.parking = params[:parking]

      review.night = params[:night]
      review.light = params[:light]
      review.noise = params[:noise]
      review.sani = params[:sani]

      review.avg1 = (review.cool.to_f + review.warm.to_f + review.sun.to_f + review.blocking.to_f + review.wind.to_f + review.bug.to_f + review.iron.to_f+ review.smell.to_f)/8
      review.avg2 = (review.night.to_f + review.light.to_f + review.noise.to_f + review.sani.to_f )/4
      # review.avg3 = (review.price.to_f + review.fee.to_f + review.owner.to_f)/3
      # review.tavg = (review.avg1 + review.avg2 + review.avg3)/3

      # uploader1 = MachineUploader.new
      # uploader1.store!(params[:image1])
      # review.image_url1 = uploader1.url
      # review.image_thumb_url1 = review.image_url1.split('/')[0] + "/" + review.image_url1.split('/')[1] + "/" + review.image_url1.split('/')[2] + "/" + review.image_url1.split('/')[3] + "/" + review.image_url1.split('/')[4] + "/thumb_" + review.image_url1.split('/')[5]

      # uploader2 = MachineUploader.new
      # uploader2.store!(params[:image2])
      # review.image_url2 = uploader2.url

      # uploader3 = MachineUploader.new
      # uploader3.store!(params[:image3])
      # review.image_url3 = uploader3.url

      # uploader4 = MachineUploader.new
      # uploader4.store!(params[:image4])
      # review.image_url4 = uploader4.url

      review.save

      redirect_to "/review/list"
    end

    def list
      @review = Review.all.reverse
    end

    def review
      @review = Review.find(params[:id])
    end

    def update_path

      address = Address.new
      all_address = Address.all

      @one_review = Review.find(params[:id])

      have_address = Address.where(:parcel_address => params[:parcel_address])

      @one_review.user_id = User.where(:email => session[:user_id]).take.id

      if have_address.take.nil?
        address.marker1 = params[:marker1]
        address.marker2 = params[:marker2]

        address.total_address = params[:total_address]
        address.parcel_address = params[:parcel_address]
        address.road_address = params[:road_address]

        address.save

      #   review.address_id = Address.last.id + 1
      # else
      #   review.address_id = have_address.take.id
      end

      @one_review.address_id = have_address.take.id

      @one_review.marker1 = params[:marker1]
      @one_review.marker2 = params[:marker2]

      @one_review.writer = session[:user_id]

      @one_review.total_address = params[:total_address]
      @one_review.parcel_address = params[:parcel_address]
      @one_review.road_address = params[:road_address]

      @one_review.detail_address = params[:detail_address]

      @one_review.comment1 = params[:comment1]
      @one_review.comment2 = params[:comment2]

      @one_review.start_year = params[:start_year]
      @one_review.start_month = params[:start_month]
      @one_review.how_long = params[:how_long]

      @one_review.place_type = params[:place_type]
      @one_review.contract_type = params[:contract_type]
      @one_review.price = params[:price]
      @one_review.month = params[:month]
      @one_review.fee = params[:fee]

      @one_review.cool = params[:cool]
      @one_review.warm = params[:warm]
      @one_review.sun = params[:sun]
      @one_review.blocking = params[:blocking]
      @one_review.wind = params[:wind]
      @one_review.bug = params[:bug]
      @one_review.iron = params[:iron]
      @one_review.smell = params[:smell]
      @one_review.pet = params[:pet]

      @one_review.gas = params[:gas]
      @one_review.micro = params[:micro]
      @one_review.bed = params[:bed]
      @one_review.desk = params[:desk]
      @one_review.laundry = params[:laundry]
      @one_review.internet = params[:internet]
      @one_review.fire = params[:fire]
      @one_review.cctv = params[:cctv]
      @one_review.parking = params[:parking]

      @one_review.night = params[:night]
      @one_review.light = params[:light]
      @one_review.noise = params[:noise]
      @one_review.sani = params[:sani]

      @one_review.avg1 = (@one_review.cool.to_f + @one_review.warm.to_f + @one_review.sun.to_f + @one_review.blocking.to_f + @one_review.wind.to_f + @one_review.bug.to_f + @one_review.iron.to_f + @one_review.smell.to_f)/8
      @one_review.avg2 = (@one_review.night.to_f + @one_review.light.to_f + @one_review.noise.to_f + @one_review.sani.to_f )/4

      # if params[:image1] != nil
      #   uploader1 = MachineUploader.new
      #   uploader1.store!(params[:image1])
      #   @one_review.image_url1 = uploader1.url
      # end

      # if params[:image2] != nil
      #   uploader2 = MachineUploader.new
      #   uploader2.store!(params[:image2])
      #   @one_review.image_url2 = uploader2.url
      # end

      # if params[:image3] != nil
      #   uploader3 = MachineUploader.new
      #   uploader3.store!(params[:image3])
      #   @one_review.image_url3 = uploader3.url
      # end

      # if params[:image4] != nil
      #   uploader4 = MachineUploader.new
      #   uploader4.store!(params[:image4])
      #   @one_review.image_url4 = uploader4.url
      # end

      @one_review.save

      all_address.each do |a|
        if a.reviews.take.nil?
          a.boards.each do |b|
            b.comments.each do |c|
              c.destroy
            end
            b.destroy
          end
          a.destroy
        end
      end

      redirect_to "/review/mypage"
    end

    def update
      @one_review = Review.find(params[:id])
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy

      all_address = Address.all

      all_address.each do |a|
        if a.reviews.take.nil?
          a.boards.each do |b|
            b.comments.each do |c|
              c.destroy
            end
            b.destroy
          end
          a.destroy
        end
      end

      # if @address_review.take.image_url1 != nil
      #   old_image_name1 = @address_review.take.image_url1.split('/')[5]
      #   remover1 = MachineUploader.new
      #   remover1.retrieve_from_store!(old_image_name1)
      #   remover1.remove!
      # end
      # if @address_review.take.image_url2 != nil
      #   old_image_name2 = @address_review.take.image_url2.split('/')[5]
      #   remover2 = MachineUploader.new
      #   remover2.retrieve_from_store!(old_image_name2)
      #   remover2.remove!
      # end
      # if @address_review.take.image_url3 != nil
      #   old_image_name3 = @address_review.take.image_url3.split('/')[5]
      #   remover3 = MachineUploader.new
      #   remover3.retrieve_from_store!(old_image_name3)
      #   remover3.remove!
      # end
      # if @address_review.take.image_url4 != nil
      #   old_image_name4 = @address_review.take.image_url4.split('/')[5]
      #   remover4 = MachineUploader.new
      #   remover4.retrieve_from_store!(old_image_name4)
      #   remover4.remove!
      # end
      redirect_to "/review/mypage"
    end

    # def destroy_image1
    #   @one_review = Addressreview.find(params[:address_id])

    #   if @one_review.image_url1 != nil
    #     old_image_name1 = @one_review.image_url1.split('/')[5]
    #     remover1 = MachineUploader.new
    #     remover1.retrieve_from_store!(old_image_name1)
    #     remover1.remove!
    #     @one_review.image_url1 = nil
    #   end

    #   @one_review.save

    #   redirect_to "/update_view_b/" + params[:address_id]
    # end

    # def destroy_image2
    #   @one_review = Addressreview.find(params[:address_id])

    #   if @one_review.image_url2 != nil
    #     old_image_name2 = @one_review.image_url2.split('/')[5]
    #     remover2 = MachineUploader.new
    #     remover2.retrieve_from_store!(old_image_name2)
    #     remover2.remove!
    #     @one_review.image_url2 = nil
    #   end

    #   @one_review.save

    #   redirect_to "/update_view_b/" + params[:address_id]
    # end

    # def destroy_image3
    #   @one_review = Addressreview.find(params[:address_id])

    #   if @one_review.image_url3 != nil
    #     old_image_name3 = @one_review.image_url3.split('/')[5]
    #     remover3 = MachineUploader.new
    #     remover3.retrieve_from_store!(old_image_name3)
    #     remover3.remove!
    #     @one_review.image_url3 = nil
    #   end

    #   @one_review.save

    #   redirect_to "/update_view_b/" + params[:address_id]
    # end

    # def destroy_image4
    #   @one_review = Addressreview.find(params[:address_id])

    #   if @one_review.image_url4 != nil
    #     old_image_name4 = @one_review.image_url4.split('/')[5]
    #     remover4 = MachineUploader.new
    #     remover4.retrieve_from_store!(old_image_name4)
    #     remover4.remove!
    #     @one_review.image_url4 = nil
    #   end

    #   @one_review.save

    #   redirect_to "/update_view_b/" + params[:address_id]
    # end
    # 내 정보
    def mypage
        @user = User.where(:email => session[:user_id]).take
        @reviews = @user.reviews.reverse
        @boards = @user.boards.reverse
        @comments = @user.comments.reverse
    end
    
    # 회원 정보 수정 (비밀번호)
    def edit_password
        @one_user = User.find(params[:id])
    end

    def edit_password_path
        
        u = User.find(params[:id])
        
        if u.password == params[:password]
          if params[:edit_password] == params[:confirmation_edit_password]
            
            u.password = params[:edit_password]
            u.confirmation_password = params[:confirmation_edit_password]

            u.save
            
            reset_session
            
            redirect_to '/user/login'
          else
            redirect_to '/review/edit_error2'
          end
        else
            reset_session
            
            redirect_to '/user/edit_error'
        end
    end
    
    def edit_error2
      @user = User.where(:email => session[:user_id]).take
    end

    def review_front
      
      @one_review = Review.where(:parcel_address => params[:parcel_address]).take
      @reviews = Review.where(:parcel_address => params[:parcel_address])

      @price = 0
      @month = 0
      @price_num = 0
      @month_num = 0

      @reviews.each do |r|
        if r.month == nil
          @price = @price + r.price
          @price_num = @price_num + 1
        else
          @price = @price + r.price
          @month = @month + r.month
          @month_num = @month_num + 1
          @price_num = @price_num + 1
        end
      end

      if @month_num == 0
        @price = @price / @price_num
      else
        @price = @price / @price_num
        @month = @month / @month_num
      end

    end

    def review_list
      @user_review = Review.where(:writer => session[:user_id]).take
      @one_review = Review.where(:parcel_address => params[:parcel_address]).take
      @review = Review.where(:parcel_address => params[:parcel_address])
      # @avg1 = (@one_review.cool.to_f + @one_review.warm.to_f + @one_review.sun.to_f + @one_review.blocking.to_f + @one_review.wind.to_f + @one_review.bug.to_f + @one_review.iron.to_f + @one_review.smell.to_f)/8
      # @avg2 = (@one_review.light.to_f + @one_review.night.to_f + @one_review.noise.to_f + @one_review.sani.to_f)/4

      # review.avg2 = (review.night.to_f + review.light.to_f + review.noise.to_f + review.sani.to_f )/4

    end

    def review_board
      @one_address = Address.where(:parcel_address => params[:parcel_address]).take
      @boards = @one_address.boards
      @one_review = Review.where(:parcel_address => params[:parcel_address]).take
      # @reviews = Review.where(:parcel_address => params[:parcel_address])
      # @boards = Board.where(:parcel_address => params[:parcel_address])
    end


    def review_board_write_path
      @one_address = Address.find(params[:id])
      
      board = Board.new

      board.user_id = User.where(:email => session[:user_id]).take.id
      board.address_id = params[:id]
      
      board.time = Time.now

      board.parcel_address = Address.where(:parcel_address => @one_address)

      board.writer = session[:user_id]

      board.content = params[:content]

      board.save

      redirect_to(:back)
    end

    # def review_board_content
    #   @one_board = Board.find(params[:id])
    #   @one_review = Review.where(:parcel_address => @one_board.parcel_address).take
    # end

    # def review_board_update
    #   @one_board = Board.find(params[:id])
    #   @one_review = Review.where(:parcel_address => @one_board.parcel_address).take
    # end

    # def review_board_update_path
    #   @one_board = Board.find(params[:id])

    #   @one_board.writer = session[:user_id]

    #   @one_board.title = params[:title]
    #   @one_board.content = params[:content]

    #   @one_board.save

    #   redirect_to "/review/mypage"
    # end

    def review_board_destroy_path
      
    end

    def comment_path
      @comment = Comment.new

      @comment.user_id = User.where(:email => session[:user_id]).take.id
      @comment.board_id = params[:board_id]

      @comment.writer = session[:user_id]
      @comment.content = params[:comment]


      @comment.save

      redirect_to "/review/review_board_content/" + params[:board_id]
    end
    
    def comment_update
      @one_comment = Comment.find(params[:id])
    end
    
    def comment_update_path
      @one_comment = Comment.find(params[:id])
      
      @one_comment.content = params[:content]
      
      @one_comment.save
      
      redirect_to "/review/mypage"
    end
    
    def comment_destroy
      @one_comment = Comment.find(params[:id])
      @one_comment.destroy
      
      redirect_to "/review/mypage"
    end

    def data
      @board = Board.all
      @comment = Comment.all
    end

end
