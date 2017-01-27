class Address < ActiveRecord::Base
    
    has_many :reviews
    has_many :boards
    
end
