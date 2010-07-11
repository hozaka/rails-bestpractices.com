class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
  belongs_to :user

  validates_presence_of :body
  validates_presence_of :username, :if => Proc.new { |comment| !comment.user_id }
  
  before_save :generate_formatted_html
  
  private
    def generate_formatted_html
      self.formatted_html = RDiscount.new(body).to_html
    end
end
