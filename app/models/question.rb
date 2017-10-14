class Question < ActiveRecord::Base
	validates :text, presence: true, length: { minimum: 5, maximum: 100 }
	validates :description, length: { maximum: 400 }
end