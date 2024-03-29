class Post < ActiveRecord::Base
  belongs_to :user
  has_many   :comments
  has_many   :post_votes

  validates  :title, presence: true
  validates  :content, presence: true
  validates  :user_id, presence: true

end
