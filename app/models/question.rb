class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answrs
	has_many :follow_questions
	validates :user_id, presence: true
	validates :text, presence: true, length: { minimum: 5, maximum: 100 }
	validates :description, presence: true, length: { minimum: 11, maximum: 400 }
	mount_uploader :picture, PictureUploader
	validate :picture_size
	default_scope -> { order(updated_at: :desc) }

	def thumbs_up_total
		self.follow_questions.where(follow: true).size
	end

	def thumbs_down_total
		self.follow_questions.where(follow: false).size
	end

	private

		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end
		
end