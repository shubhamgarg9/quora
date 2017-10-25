class Upvote < ActiveRecord::Base
	belongs_to :user
	belongs_to :answr
	validates_uniqueness_of :user, scope: :answr

end