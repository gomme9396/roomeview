class HomeController < ApplicationController

  before_action :require_login, except: [:index]
  require 'csv'
    def export_review
      @addressreview = Addressreview.all
      addressreview = CSV.generate do |csv|
      csv << ["id", "address_id", "address_name","detail_address_name","price", "month","start_date",
              "end_date","fee","comment1","image_url1","image_url2","image_url3",
              "image_url4","cool","warm","sun","blocking","wind","bug","iron","smell",
              "pet","gas","micro","bed","desk","laundry","internet","fire","cctv","parking",
              "comment2","night","light","noise","sani"]
          @addressreview.each do |a|
            csv << [a.id, a.address_id, a.address_name, a.detail_address_name, a.price, a.month,a.start_date,
                    a.end_date, a.fee, a.comment1, a.image_url1,a.image_url2, a.image_url3,
                    a.image_url4,a.cool,a.warm,a.sun,a.blocking,a.wind,a.bug,a.iron,a.smell,
                    a.pet,a.gas,a.micro,a.bed,a.desk,a.laundry,a.internet,a.fire,a.cctv,a.parking,
                    a.comment2,a.night,a.light,a.noise,a.sani]
              end
          end
          send_data(addressreview, :type => 'text/csv', :filename => 'addressreview.csv')
    end

    def export_address
      @address = Address.all
      address = CSV.generate do |csv|
      csv << ["id","marker1", "marker2", "current_user","total_address", "parcel_address", "road_address",
              "detail_address"]
          @address.each do |a|
            csv << [a.id, a.marker1, a.marker2, a.current_user, a.total_address, a.parcel_address, a.road_address,
                    a.detail_address]
          end
      end
      send_data(address, :type => 'text/csv', :filename => 'address.csv')
    end

    def export_user
      @user = User.all
      user = CSV.generate do |csv|
      csv << ["id","email"]
          @user.each do |a|
            csv << [a.id,a.email]
          end
      end
      send_data(user, :type => 'text/csv', :filename => 'user.csv')
    end

    def create_b
      @create_review = Address.all
    end

    def list_path_a
      # email = User.new
      # email.email = params[:email]

      # Address.get_address_save
      address = Address.new

      address.marker1 = params[:marker1]
      address.marker2 = params[:marker2]

      address.total_address = params[:total_address]
      address.parcel_address = params[:parcel_address]
      address.road_address = params[:road_address]

      address.detail_address = params[:detail_address]

      address.current_user = params[:current_user]

      address.save
      redirect_to "/home/create_b"
    end



    def list_path_b
      @address = Address.find(params[:address_id])

      review = Addressreview.new

      review.address_id = params[:address_id]

      review.address_name = @address.total_address
      review.detail_address_name = @address.detail_address

      review.price = params[:price]
      review.month = params[:month]
      review.start_date = params[:start_date]
      review.end_date = params[:end_date]
      review.fee = params[:fee]
      review.comment1 = params[:comment1]

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
      review.comment2 = params[:comment2]

      review.night = params[:night]
      review.light = params[:light]
      review.noise = params[:noise]
      review.sani = params[:sani]

      # review.avg1 = (review.warm.to_f + review.cook.to_f + review.water.to_f + review.light.to_f + review.furniture.to_f + review.bug.to_f)/6
      # review.avg2 = (review.noise.to_f + review.traffic.to_f + review.convin.to_f + review.hygiene.to_f )/4
      # review.avg3 = (review.price.to_f + review.fee.to_f + review.owner.to_f)/3
      # review.tavg = (review.avg1 + review.avg2 + review.avg3)/3

      uploader1 = MachineUploader.new
      uploader1.store!(params[:image1])
      review.image_url1 = uploader1.url
      # review.image_thumb_url1 = review.image_url1.split('/')[0] + "/" + review.image_url1.split('/')[1] + "/" + review.image_url1.split('/')[2] + "/" + review.image_url1.split('/')[3] + "/" + review.image_url1.split('/')[4] + "/thumb_" + review.image_url1.split('/')[5]

      uploader2 = MachineUploader.new
      uploader2.store!(params[:image2])
      review.image_url2 = uploader2.url

      uploader3 = MachineUploader.new
      uploader3.store!(params[:image3])
      review.image_url3 = uploader3.url

      uploader4 = MachineUploader.new
      uploader4.store!(params[:image4])
      review.image_url4 = uploader4.url

      review.save

      redirect_to "/home/list_find"
    end

    def list_find
      @address = Address.all
      @address = Address.includes(:addressreviews).all.reverse

    end

    def find
        @address = Address.all.reverse

        search_value = params[:search_type]

        #건물명 검색
        if search_value == "1"
          find_address = params[:find_detail_address]
          @find_address = find_address.strip
          @view_address = Address.where("detail_address LIKE ?", "%#{@find_address}%" )

        #주소 검색
        elsif search_value == "2"
          find_address = params[:find_detail_address]
          @find_address = find_address.strip
          @view_address = Address.where("total_address LIKE ?", "%#{@find_address}%" )
        else
        #지도에서 찾기
          find_address = params[:find_address]
          @find_address = find_address.strip
          @view_address = Address.where("total_address LIKE ?", "%#{@find_address}%" )
        end
    end

    def review
      @address = Address.find(params[:address_id])
      @review = Address.all

    end

    def destroy
      @address = Address.find(params[:address_id])
      @address_review = @address.addressreviews.take
      @address.destroy
      @address_review.destroy

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
      redirect_to "/home/mypage"
    end

    def update_view_a
      @one_address = Address.find(params[:address_id])
    end

    def update_view_b
      @update_review = Address.all
      @one_address = Address.find(params[:address_id])
      @one_review = @one_address.addressreviews.take
    end

    def update_a
      @one_address = Address.find(params[:address_id])

      @one_address.marker1 = params[:marker1]
      @one_address.marker2 = params[:marker2]

      @one_address.total_address = params[:total_address]
      @one_address.parcel_address = params[:parcel_address]
      @one_address.road_address = params[:road_address]

      @one_address.detail_address = params[:detail_address]

      @one_address.save
      redirect_to "/update_view_b/" + params[:address_id]
    end

    def update_b
      @address = Address.find(params[:address_id])

      @one_review = @address.addressreviews.take

      @one_review.address_id = params[:address_id]
      @one_review.address_name = @address.total_address
      @one_review.detail_address_name = @address.detail_address

      @one_review.price = params[:price]
      @one_review.month = params[:month]
      @one_review.start_date = params[:start_date]
      @one_review.end_date = params[:end_date]
      @one_review.fee = params[:fee]
      @one_review.comment1 = params[:comment1]

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
      @one_review.comment2 = params[:comment2]

      @one_review.night = params[:night]
      @one_review.light = params[:light]
      @one_review.noise = params[:noise]
      @one_review.sani = params[:sani]

      if params[:image1] != nil
        uploader1 = MachineUploader.new
        uploader1.store!(params[:image1])
        @one_review.image_url1 = uploader1.url
      end

      if params[:image2] != nil
        uploader2 = MachineUploader.new
        uploader2.store!(params[:image2])
        @one_review.image_url2 = uploader2.url
      end

      if params[:image3] != nil
        uploader3 = MachineUploader.new
        uploader3.store!(params[:image3])
        @one_review.image_url3 = uploader3.url
      end

      if params[:image4] != nil
        uploader4 = MachineUploader.new
        uploader4.store!(params[:image4])
        @one_review.image_url4 = uploader4.url
      end

      @one_review.save

      redirect_to "/home/list_find"
    end

    def mypage
      @address = Address.all.reverse
      # @current_user = Address.current_user
      # @address = Address.where("address LIKE ?","%#{@current_user}%")
      # @email = User.all
    end

    def review_path
      # comment = Comment.new
      # comment.address_id = params[:address_id]
      # comment.author = params[:author]
      # comment.comment = params[:comment]
      # comment.save

      @address_id = params[:address_id]
      @comment = params[:comment]
      @author = current_user.email
      comment = Comment.new(address_id: @address_id, user_id: current_user.id, comment: @comment)
      comment.save

      @comments = Comment.all.reverse
      # redirect_to "/home/review/#{params[:address_id]}"
    end

    def data_view
      @user = User.all
      @review = Addressreview.all
    end

    def sorting_data
      @sort_value = params[:param]
      @address = Address.all
      #@sort_data = Address.all

      if @sort_value == "1"
        @sort_data = Address.all.order(:id).reverse

      elsif @sort_value == "2"
        @sort_data = Address.all.order(:detail_address)

      elsif @sort_value == "3"
        @address_review = Addressreview.all.order(:price).reverse
        @sort_data = Address.joins(:addressreviews).order('addressreviews.price')
      end
    end

    def destroy_image1
      @one_review = Addressreview.find(params[:address_id])

      if @one_review.image_url1 != nil
        old_image_name1 = @one_review.image_url1.split('/')[5]
        remover1 = MachineUploader.new
        remover1.retrieve_from_store!(old_image_name1)
        remover1.remove!
        @one_review.image_url1 = nil
      end

      @one_review.save

      redirect_to "/update_view_b/" + params[:address_id]
    end

    def destroy_image2
      @one_review = Addressreview.find(params[:address_id])

      if @one_review.image_url2 != nil
        old_image_name2 = @one_review.image_url2.split('/')[5]
        remover2 = MachineUploader.new
        remover2.retrieve_from_store!(old_image_name2)
        remover2.remove!
        @one_review.image_url2 = nil
      end

      @one_review.save

      redirect_to "/update_view_b/" + params[:address_id]
    end

    def destroy_image3
      @one_review = Addressreview.find(params[:address_id])

      if @one_review.image_url3 != nil
        old_image_name3 = @one_review.image_url3.split('/')[5]
        remover3 = MachineUploader.new
        remover3.retrieve_from_store!(old_image_name3)
        remover3.remove!
        @one_review.image_url3 = nil
      end

      @one_review.save

      redirect_to "/update_view_b/" + params[:address_id]
    end

    def destroy_image4
      @one_review = Addressreview.find(params[:address_id])

      if @one_review.image_url4 != nil
        old_image_name4 = @one_review.image_url4.split('/')[5]
        remover4 = MachineUploader.new
        remover4.retrieve_from_store!(old_image_name4)
        remover4.remove!
        @one_review.image_url4 = nil
      end

      @one_review.save

      redirect_to "/update_view_b/" + params[:address_id]
    end

end
