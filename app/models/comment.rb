class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many   :commentvotes

  validates  :post_id, presence: true
  validates  :user_id, presence: true
  validates  :content, presence: true
end
