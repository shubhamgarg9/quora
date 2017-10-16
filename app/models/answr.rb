class Answr < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :text, presence: true, length: { minimum: 4 }
end
