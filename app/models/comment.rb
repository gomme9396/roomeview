class Comment < ActiveRecord::Base

    belongs_to :addresses
    belongs_to :user

end
