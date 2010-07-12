class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| !comment.user_id }
end
