class CommentVote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :comment

  validates  :post_id, presence: true
  validates  :user_id, presence: true
end
