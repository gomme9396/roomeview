class HomeController < ApplicationController

  before_action :require_login, except: [:index]
  require 'csv'
    def export_review
      @addressreview = Addressreview.all
      addressreview = CSV.generate do |csv|
      csv << ["id", "address_id", "address_name","price", "month","start_date",
              "end_date","fee","comment1","image_url1","image_url2","image_url3",
              "image_url4","cool","warm","sun","blocking","wind","bug","iron","smell",
              "pet","gas","micro","bed","desk","laundry","internet","fire","cctv","parking",
              "comment2","night","light","noise","sani"
            ]
          @addressreview.each do |a|
            csv << [a.id, a.address_id, a.address_name, a.price, a.month,a.start_date,
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
      csv << ["id","marker1", "marker2", "current_user","address", "detail_address"]
          @address.each do |a|
            csv << [a.id,a.marker1, a.marker2,a.current_user, a.address, a.detail_address]
          end
      end
      send_data(address, :type => 'text/csv', :filename => 'address.csv')
    end

    def index


    end

    def create
    end

    def create_b
      @create_review = Address.all
    end

    def create_c
    end

    def list_path_a
      # email = User.new
      # email.email = params[:email]

      # Address.get_address_save
      address = Address.new
      address.marker1 = params[:marker1]
      address.marker2 = params[:marker2]
      address.address = params[:address]
      address.detail_address = params[:detail_address]
      address.current_user = params[:current_user]
      address.save
      redirect_to "/home/create_b"
    end



    def list_path_b

      @address = Address.find(params[:address_id])

      review = Addressreview.new
      review.address_id = params[:address_id]
      review.address_name = @address.address

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
      @address = Address.all.reverse
      @address = Address.includes(:addressreviews).all

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
          @view_address = Address.where("address LIKE ?", "%#{@find_address}%" )
        else
        #지도에서 찾기
          find_address = params[:find_address]
          @find_address = find_address.strip
          @view_address = Address.where("address LIKE ?", "%#{@find_address}%" )
        end
    end

    def review
      @address = Address.find(params[:address_id])
      @review = Address.all

    end

    def destroy
      @address = Address.find(params[:address_id])
      @address_review = Addressreview.find(params[:address_id])
      @address.destroy
      @address_review.destroy
      redirect_to "/home/mypage"
    end

    def update_view_a
      @one_address = Address.find(params[:address_id])
    end

    def update_view_b
      @update_review = Address.all
      @one_review = Addressreview.find(params[:address_id])
    end

    def update_a
      @one_address = Address.find(params[:address_id])
      @one_address.marker1 = params[:marker1]
      @one_address.marker2 = params[:marker2]
      @one_address.address = params[:address]
      @one_address.detail_address = params[:detail_address]
      @one_address.save
      redirect_to "/update_view_b/" + params[:address_id]
    end

    def update_b
      @one_review = Addressreview.find(params[:address_id])
      @one_review.address_id = params[:address_id]

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

      uploader1 = MachineUploader.new
      uploader1.store!(params[:image1])
      @one_review.image_url1 = uploader1.url

      uploader2 = MachineUploader.new
      uploader2.store!(params[:image2])
      @one_review.image_url2 = uploader2.url

      uploader3 = MachineUploader.new
      uploader3.store!(params[:image3])
      @one_review.image_url3 = uploader3.url

      uploader4 = MachineUploader.new
      uploader4.store!(params[:image4])
      @one_review.image_url4 = uploader4.url

      @one_review.save

      redirect_to "/home/list_find"
    end

    def write_path
    end

    def mypage
      @address = Address.all.reverse
      # @current_user = Address.current_user
      # @address = Address.where("address LIKE ?","%#{@current_user}%")
      # @email = User.all
    end

    def review_path
      comment = Comment.new
      comment.address_id = params[:address_id]
      comment.author = params[:author]
      comment.comment = params[:comment]
      comment.save

      redirect_to "/home/review/#{params[:address_id]}"
    end

    def data_view
      @review = Addressreview.all
    end
end
