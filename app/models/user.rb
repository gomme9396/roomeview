class User < ActiveRecord::Base
    
    has_many :reviews
    has_many :boards
    has_many :comments
    
end
