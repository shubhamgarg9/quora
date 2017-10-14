class Question < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :text, presence: true, length: { minimum: 5, maximum: 100 }
	validates :description, presence: true, length: { minimum: 11, maximum: 400 }
	mount_uploader :picture, PictureUploader
	validate :picture_size

	private

		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end

end