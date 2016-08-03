class Address < ActiveRecord::Base
    
    belongs_to :users
    has_many :addressreviews
    has_many :comments

    # def self.get_address_save
    
    #   address = Address.new
    #   address.marker1 = params[:marker1]
    #   address.marker2 = params[:marker2]
    #   address.address = params[:address]
    #   address.detail_address = params[:detail_address]
    #   address.current_user = params[:current_user]
    #   address.save
    
    # end

end
