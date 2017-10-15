class FollowQuestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates_uniqueness_of :user, scope: :question
end
