class Review < ActiveRecord::Base
    
    belongs_to :users
    # has_many :comments
    
end
