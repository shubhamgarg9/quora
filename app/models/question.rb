class Question < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :text, presence: true, length: { minimum: 5, maximum: 100 }
	validates :description, length: { maximum: 400 }
end