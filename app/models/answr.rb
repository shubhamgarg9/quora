class Answr < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :upvotes
	validates :user_id, presence: true
	validates :question_id, presence: true
	validates :text, presence: true, length: { minimum: 4 }


	def thumbs_up_total
		self.upvotes.where(upvote: true).size
	end

	def thumbs_down_total
		self.upvotes.where(upvote: false).size
	end

end
