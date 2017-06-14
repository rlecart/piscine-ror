class Comment < ActiveRecord::Base
	belongs_to :users
	belongs_to :cuicuis
end
