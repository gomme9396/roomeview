class Board < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :address
    has_many :comments

end
