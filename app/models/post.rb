class Post < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :user
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  scope :recent, order('created_at desc')
  
  def belongs_to?(user)
    user_id == user.id
  end
end
